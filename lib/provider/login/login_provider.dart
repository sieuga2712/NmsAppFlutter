import 'dart:math';
import 'package:dio/dio.dart';
import 'package:nms_app/model/auth/granted_policies.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

class LoginProvider {
  final dio = ApiRoot().dio;
  static const String _tokenEndpoint = '/connect/token';
  static const String _revocatEndpoint = '/connect/revocat';
  static const int maxRetries = 3;
  final log = Logger();

  // Đổi mã xác thực (code) lấy về token:
  // - Gửi yêu cầu lên server với grant_type là authorization_code
  // - Trả về model chứa thông tin đăng nhập
  Future<LoginModel?> exchangeCodeForToken(
      String code, String clientId, String redirectUri) async {
    try {
      final formData = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
      };
      return await _makeTokenRequest(formData);
    } catch (e) {
      log.e('Error in exchangeCodeForToken: $e');
      return null;
    }
  }

  // Làm mới token bằng refresh token:
  // - Gửi yêu cầu với grant_type là refresh_token
  // - Trả về model chứa thông tin đăng nhập mới
  Future<LoginModel?> refreshToken(String refreshToken, String clientId) async {
    try {
      final formData = {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': clientId,
      };

      final response = await _makeTokenRequest(formData);
      return response;
    } on DioException catch (e) {
      log.e('Error in refreshToken: ${e.message}');
      log.e('Error response data: ${e.response?.data}');
      return null;
    }
  }

  // Hàm chung để gửi yêu cầu lấy token:
  // - Xử lý các mã lỗi khác nhau (200, 401, 500)
  // - Tự động thử lại khi gặp lỗi timeout hoặc 401
  // - Có cơ chế delay tăng dần giữa các lần thử lại
  // - Xử lý lỗi server bằng handleServerError
  Future<LoginModel?> _makeTokenRequest(Map<String, dynamic> formData,
      {int retryCount = 0}) async {
    try {
      final response = await dio.post(
        _tokenEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          validateStatus: (status) => status != null && status < 600,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return LoginModel.fromJson(response.data);
      } else if (response.statusCode == 500) {
        final loginController = Get.find<LoginController>();
        await loginController.handleServerError();
        return null;
      } else if (response.statusCode == 401 && retryCount < maxRetries) {
        log.w('Retrying token request after 401 status code.');
        await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
        return _makeTokenRequest(formData, retryCount: retryCount + 1);
      } else {
        log.e('Error response: ${response.statusCode} - ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        final loginController = Get.find<LoginController>();
        await loginController.handleServerError();
        return null;
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        if (retryCount < maxRetries) {
          log.w('Retrying token request after timeout.');
          await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
          return _makeTokenRequest(formData, retryCount: retryCount + 1);
        }
      }
      log.e('DioError: ${e.message}');
      log.e('Error response: ${e.response?.data}');
      rethrow;
    }
  }

  // Thu hồi access token:
  // - Gửi yêu cầu thu hồi token lên server
  // - Xử lý và log các lỗi nếu có
  Future<void> revokeToken(String accessToken, String clientId) async {
    try {
      final formData = {
        'client_id': clientId,
        'token': accessToken,
        'token_type_hint': 'access_token'
      };
      await _makeRevokeTokenRequest(formData);
    } on DioException catch (e) {
      log.e('DioError during revokeToken: ${e.message}',
          error: e, stackTrace: e.stackTrace);
      log.e('Error response: ${e.response?.data}');
      rethrow;
    } catch (e, stackTrace) {
      log.e('Error during revokeToken: $e', error: e, stackTrace: stackTrace);
    }
  }

  // Thu hồi refresh token:
  // - Gửi yêu cầu thu hồi refresh token lên server
  // - Xử lý và log các lỗi nếu có
  Future<void> revokeRefreshToken(String refreshToken, String clientId) async {
    try {
      final formData = {
        'client_id': clientId,
        'token': refreshToken,
        'token_type_hint': 'refresh_token'
      };
      await _makeRevokeTokenRequest(formData);
    } on DioException catch (e) {
      log.e('DioError during revokeRefreshToken: ${e.message}',
          error: e, stackTrace: e.stackTrace);
      log.e('Error response: ${e.response?.data}');
      rethrow;
    } catch (e, stackTrace) {
      log.e('Error during revokeRefreshToken: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  // Hàm chung để gửi yêu cầu thu hồi token:
  // - Gửi POST request đến endpoint thu hồi
  // - Kiểm tra status code
  // - Xử lý và log các lỗi
  Future<void> _makeRevokeTokenRequest(Map<String, dynamic> formData) async {
    try {
      final response = await dio.post(
        _revocatEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      if (response.statusCode != 200) {
        log.e(
            'Failed to revoke token, status code: ${response.statusCode} data: ${response.data}');
      }
    } on DioException catch (e) {
      log.e('DioError during _makeRevokeTokenRequest: ${e.message}',
          error: e, stackTrace: e.stackTrace);
      log.e('Error response: ${e.response?.data}');
      rethrow;
    } catch (e, stackTrace) {
      log.e('Error during _makeRevokeTokenRequest: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  // Lấy cấu hình quyền của ứng dụng:
  // - Gọi API lấy cấu hình
  // - Trích xuất thông tin quyền từ response
  // - Xử lý lỗi 401 bằng handleServerError
  // - Trả về model chứa thông tin quyền
  Future<ChinhSachDuocCapModel?> getApplicationConfiguration() async {
    try {
      final response = await dio.get(
        '/api/abp/application-configuration',
        queryParameters: {'includeLocalizationResources': false},
        options: Options(
          headers: {
            'accept': 'application/json',
            'accept-language': 'vi',
          },
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final permissions = response.data['auth']?['grantedPolicies'] ?? {};
        return ChinhSachDuocCapModel.fromJson(permissions);
      }
      return null;
    } on DioException catch (e) {
      log.e('Error fetching application configuration: ${e.message}');
      if (e.response?.statusCode == 401) {
        final loginController = Get.find<LoginController>();
        await loginController.handleServerError();
      }
      return null;
    }
  }
}
