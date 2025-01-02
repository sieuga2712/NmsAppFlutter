import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/user/thong_tin_user_model.dart';
import 'package:nms_app/network/api_provider.dart';

class UserProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<UserModel> getUserProfile(String accessToken) async {
    try {
      final response = await dio.get(
        '/api/account/my-profile',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load user profile: ${response.statusCode}');
      }

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error fetching user profile: $e');
    }
  }

  Future<void> updateUserProfile(
      String accessToken, Map<String, dynamic> userData) async {
    try {
      final response = await dio.put(
        '/api/account/my-profile',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
        data: userData,
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to update user profile: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception('Access denied: ${e.response?.data}');
      } else {
        throw Exception('Error updating user profile: $e');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> changePassword(
      String accessToken, Map<String, dynamic> payload) async {
    try {
      final response = await dio.post(
        '/api/account/my-profile/change-password',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
        data: payload,
      );

      if (response.statusCode != 204) {
        throw Exception('Failed to change password: ${response.statusCode}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        throw Exception(
            'Đổi mật khẩu thất bại: ${e.response?.data['error']['message']}');
      } else if (e.response?.statusCode == 401) {
        throw Exception(
            'Không được phép: ${e.response?.data['error']['message']}');
      } else {
        throw Exception('Lỗi khi đổi mật khẩu: $e');
      }
    } catch (e) {
      throw Exception('Lỗi không mong muốn: $e');
    }
  }
}
