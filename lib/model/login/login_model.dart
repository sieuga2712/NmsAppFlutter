import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  String accessToken;
  String refreshToken;
  int expiresIn;
  String logoutUrl;

  LoginModel({
    this.accessToken = '',
    this.refreshToken = '',
    this.expiresIn = 0,
    this.logoutUrl = '',
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      accessToken: json['access_token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      expiresIn: json['expires_in'] ?? 0,
      logoutUrl: json['logout_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'logout_url': logoutUrl,
    };
  }

  Future<bool> saveToStorage() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    try {
      final storage = GetStorage();
      final String data = json.encode(toJson());

      await storage.write('login_data', data);

      storage.write('access_token', accessToken);
      storage.write('refresh_token', refreshToken);
      storage.write('expires_in', expiresIn);
      storage.write('logout_url', logoutUrl);
      storage.write(GetStorageKey.isLogin, true);

      _pref.setString("accessToken", accessToken);
      _pref.setString("refreshToken", refreshToken);

      print('Dữ liệu đã lưu: $data');
      return true;
    } catch (e) {
      print('Lỗi khi lưu dữ liệu đăng nhập: $e');
      return false;
    }
  }

  static Future<LoginModel> loadFromStorage() async {
    try {
      final storage = GetStorage();
      final String? data = storage.read('login_data');
      if (data != null) {
        Map<String, dynamic> jsonData = json.decode(data);
        print('Refresh token: ${jsonData['refresh_token']}');
        return LoginModel.fromJson(jsonData);
      }
    } catch (e) {
      print('Lỗi khi đọc dữ liệu đăng nhập: $e');
    }
    return LoginModel();
  }

  static Future<bool> clearStorage() async {
    try {
      final storage = GetStorage();
      await storage.remove('login_data');
      await storage.remove('access_token');
      await storage.remove('refresh_token');
      await storage.remove('expires_in');
      await storage.remove('logout_url');
      await storage.write(GetStorageKey.isLogin, false);
      return true;
    } catch (e) {
      print('Lỗi khi xóa dữ liệu đăng nhập: $e');
      return false;
    }
  }

  bool get isLoggedIn => accessToken.isNotEmpty;

  static LoginModel? tryParseResponse(String responseBody) {
    try {
      final Map<String, dynamic> data = json.decode(responseBody);
      return LoginModel.fromJson(data);
    } catch (e) {
      print('Lỗi khi xử lý dữ liệu đăng nhập: $e');
      return null;
    }
  }
}
