import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/router.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nms_app/provider/login/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider = LoginProvider();
  String get logoutUrl => loginModel.value.logoutUrl;
  final dio = ApiRoot().dio;
  final String _clientId = 'NMS_Mobile';
  static const String _issuer = 'https://apinpm.egov.phutho.vn';
  final String _redirectUri = 'com.yourapp://callback';
  Timer? _refreshTimer;
  final int _refreshThreshold = 60;
  final List<String> _scopes = [
    'openid',
    'profile',
    'email',
    'offline_access',
    'NMS'
  ];

  final loginModel = LoginModel().obs;
  bool _isLoggingOut = false;

  @override
  void onInit() async {
    super.onInit();
    try {
      final storage = GetStorage();
      final bool? isLoggedIn = storage.read(GetStorageKey.isLogin);

      if (isLoggedIn != true) {
        loginModel.value = LoginModel();
        return;
      }

      loginModel.value = await loadFromStorage();

      // if (!_isLoggingOut) {
      //   if (loginModel.value.isLoggedIn) {
      //     if (await _verifyTokenValidity()) {
      //       print('Token hợp lệ, chuyển hướng đến trang chủ');
      //       if (Get.currentRoute != Paths.TRANGCHU) {
      //         await Future.delayed(Duration(milliseconds: 30));
      //         Get.offAllNamed(Paths.TRANGCHU);
      //       }
      //     } else {
      //       print('Token không hợp lệ, thử refresh');
      //       await refreshToken();
      //     }
      //   } else {
      //     print('Không có thông tin đăng nhập');
      //   }
      // }
    } catch (e) {
      print('Lỗi khởi tạo: $e');
    }
  }

  Future<bool> saveToStorage() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    try {
      final storage = GetStorage();
      final String data = json.encode(loginModel.toJson());

      await storage.write('login_data', data);

      storage.write('access_token', loginModel.value.accessToken);
      storage.write('refresh_token', loginModel.value.refreshToken);
      storage.write('expires_in', loginModel.value.expiresIn);
      storage.write('logout_url', loginModel.value.logoutUrl);
      storage.write(GetStorageKey.isLogin, true);

      _pref.setString("accessToken", loginModel.value.accessToken);
      _pref.setString("refreshToken", loginModel.value.refreshToken);
      _pref.setString("logoutUrl", loginModel.value.logoutUrl);

      print('Dữ liệu đã lưu: $data');
      print('Logout: $logoutUrl');
      return true;
    } catch (e) {
      print('Lỗi khi lưu dữ liệu đăng nhập: $e');
      return false;
    }
  }

  static Future<LoginModel> loadFromStorage() async {
    try {
      final storage = GetStorage();
      final bool? isLoggedIn = storage.read(GetStorageKey.isLogin);
      if (isLoggedIn != true) {
        return LoginModel();
      }

      final String? data = storage.read('login_data');
      if (data != null && data.isNotEmpty) {
        Map<String, dynamic> jsonData = json.decode(data);
        if (jsonData['access_token']?.isEmpty ?? true) {
          return LoginModel();
        }
        return LoginModel.fromJson(jsonData);
      }
    } catch (e) {
      print('Lỗi khi đọc dữ liệu đăng nhập: $e');
    }
    return LoginModel();
  }

  static LoginModel? tryParseResponse(String responseBody) {
    try {
      final Map<String, dynamic> data = json.decode(responseBody);
      return LoginModel.fromJson(data);
    } catch (e) {
      print('Lỗi khi xử lý dữ liệu đăng nhập: $e');
      return null;
    }
  }

  Future<void> performAuthentication() async {
    try {
      print('Starting authentication process.');

      final issuer = await Issuer.discover(Uri.parse(_issuer));
      final client = Client(issuer, _clientId);

      final authenticator = Authenticator(
        client,
        scopes: _scopes,
        redirectUri: Uri.parse(_redirectUri),
        urlLancher: (url) async {
          print('Opening URL: $url');
          final result = await FlutterWebAuth2.authenticate(
            url: url,
            callbackUrlScheme: 'com.yourapp',
          );

          final callbackUri = Uri.parse(result);
          final code = callbackUri.queryParameters['code'];

          if (code != null) {
            loginModel.value = await _loginProvider.exchangeCodeForToken(
                    code, _clientId, _redirectUri) ??
                LoginModel();
            saveToStorage();
            print('$code');
            Get.offAllNamed(Paths.TRANGCHU);
          } else {
            print('No code found in callback URL.');
          }
        },
      );

      await authenticator.authorize();
    } catch (e, stackTrace) {
      print('Error during authentication: $e');
      print(stackTrace);
    }
  }

  Future<bool> _verifyTokenValidity() async {
    if (loginModel.value.expiresIn <= 0) return false;

    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final tokenExpiry = currentTime + loginModel.value.expiresIn;

    return tokenExpiry > currentTime + 60;
  }

  void _setupTokenRefresh() {
    _refreshTimer?.cancel();

    if (loginModel.value.expiresIn > 0) {
      final refreshIn = loginModel.value.expiresIn - _refreshThreshold;
      if (refreshIn > 0) {
        _refreshTimer = Timer(Duration(seconds: refreshIn), () async {
          try {
            await refreshToken();
          } catch (e) {
            print('Lỗi refresh token tự động: $e');
            await logout();
          }
        });
      } else {
        refreshToken();
      }
    }
  }

  Future<void> refreshToken() async {
    if (loginModel.value.refreshToken.isEmpty) {
      await logout();
      return;
    }

    try {
      final newLoginModel = await _loginProvider.refreshAccessToken(
        loginModel.value.refreshToken,
        _clientId,
      );

      if (newLoginModel != null) {
        loginModel.value = newLoginModel;
        await saveToStorage();
        _setupTokenRefresh();
      } else {
        print('Không thể refresh token, đăng xuất');
        await logout();
      }
    } catch (e) {
      print('Lỗi khi refresh token: $e');
      await logout();
    }
  }

  Future<void> _clearAllStorage() async {
    try {
      final storage = GetStorage();
      await storage.erase();
      await storage.write(GetStorageKey.isLogin, false);

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      print("All storage cleared");
    } catch (e) {
      print("Storage clear error: $e");
      rethrow;
    }
  }

  Future<void> _clearWebViewData() async {
    try {
      final cj = CookieJar();
      cj.deleteAll();
      print("Cookies cleared");

      final controller = WebViewController();
      controller.clearCache();
      print("WebView cache cleared");
    } catch (e) {
      print("Error clearing WebView data: $e");
    }
  }

  Future<void> logout() async {
    if (_isLoggingOut) return;

    try {
      _isLoggingOut = true;

      // Cancel refresh timer first
      _refreshTimer?.cancel();

      // Clear all tokens
      loginModel.value = LoginModel();

      // Clear web data
      await _clearWebViewData();

      // Clear storage
      await _clearAllStorage();

      // Add specific token clearing
      final storage = GetStorage();
      await storage.remove('login_data');
      await storage.remove('access_token');
      await storage.remove('refresh_token');
      await storage.remove('expires_in');
      await storage.remove('logout_url');

      // Clear SharedPreferences specifically
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("accessToken");
      await prefs.remove("refreshToken");
      await prefs.remove("logoutUrl");

      // Force garbage collection
      await Future.delayed(Duration(milliseconds: 100));
      Get.offAllNamed(Paths.LOGIN);
    } catch (e) {
      print('Logout error: $e');
    } finally {
      _isLoggingOut = false;
    }
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }
}
