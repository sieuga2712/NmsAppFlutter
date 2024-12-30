import 'dart:math';
import 'package:dio/dio.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:logger/logger.dart';

class LoginProvider {
  final dio = ApiRoot().dio;
  static const String _tokenEndpoint = '/connect/token';
  static const String _revocatEndpoint = '/connect/revocat';
  static const int maxRetries = 3;
  final log = Logger();

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
          validateStatus: (status) => status != null && status < 500,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return LoginModel.fromJson(response.data);
      } else if (response.statusCode == 401 && retryCount < maxRetries) {
        log.w('Retrying token request after 401 status code.');
        await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
        return _makeTokenRequest(formData, retryCount: retryCount + 1);
      } else {
        log.e('Error response: ${response.statusCode} - ${response.data}');
        return null;
      }
    } on DioException catch (e) {
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
}
