import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nms_app/router.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nms_app/provider/login/login_provider.dart';

class LoginController extends GetxController {
  final LoginProvider _loginProvider = LoginProvider();
  final dio = ApiRoot().dio;
  final String _clientId = 'NMS_Mobile';
  static const String _issuer = 'https://apinpm.egov.phutho.vn';
  final String _redirectUri = 'com.yourapp://callback';
  Timer? _refreshTimer;
  final int _refreshThreshold = 3000;
  final List<String> _scopes = [
    'openid',
    'profile',
    'email',
    'offline_access',
    'NMS'
  ];
  final log = Logger();
  final loginModel = LoginModel().obs;
  final isLoggingOutLoading = false.obs;
  final isReloginInProgress = false.obs;

  @override
  void onInit() async {
    super.onInit();
    try {
      await _loadLoginData();
      if (loginModel.value.isLoggedIn) {
        await _handleLoggedInState();
      } else {
        log.i('No login information found.');
      }
    } catch (e, stackTrace) {
      log.e('Error during initialization: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _loadLoginData() async {
    final storage = GetStorage();
    final bool? isLoggedIn = storage.read(GetStorageKey.isLogin);

    if (isLoggedIn != true) {
      loginModel.value = LoginModel();
      return;
    }

    loginModel.value = await loadFromStorage();
  }

  Future<void> _handleLoggedInState() async {
    if (await _verifyTokenValidity()) {
      log.i('Token is valid, navigating to home.');
      if (Get.currentRoute != Paths.TRANGCHU) {
        await Future.delayed(const Duration(milliseconds: 30));
        Get.offAllNamed(Paths.TRANGCHU);
      }
    } else {
      log.i('Token is invalid, attempting to refresh.');
      await refreshToken();
    }
  }

  Future<bool> saveToStorage() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    try {
      final storage = GetStorage();
      final String data = json.encode(loginModel.value.toJson());

      await storage.write('login_data', data);

      storage.write('access_token', loginModel.value.accessToken);
      storage.write('refresh_token', loginModel.value.refreshToken);
      storage.write('expires_in', loginModel.value.expiresIn);
      storage.write('token_type', loginModel.value.tokenType);
      storage.write('scope', loginModel.value.scope);
      storage.write('id_token', loginModel.value.idToken);
      storage.write(GetStorageKey.isLogin, true);

      _pref.setString("accessToken", loginModel.value.accessToken);
      _pref.setString("refreshToken", loginModel.value.refreshToken);
      _pref.setString("expires_in", loginModel.value.expiresIn.toString());
      _pref.setString("token_type", loginModel.value.tokenType);
      _pref.setString("scope", loginModel.value.scope);
      _pref.setString("id_token", loginModel.value.idToken);
      log.i('Login data saved successfully.');
      return true;
    } catch (e, stackTrace) {
      log.e('Error saving login data to storage: $e',
          error: e, stackTrace: stackTrace);
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
    } catch (e, stackTrace) {
      Logger().e('Error loading login data from storage: $e',
          error: e, stackTrace: stackTrace);
    }
    return LoginModel();
  }

  Future<void> performAuthentication() async {
    try {
      log.i('Starting authentication process.');

      final issuer = await Issuer.discover(Uri.parse(_issuer));
      final client = Client(issuer, _clientId);

      final authenticator = Authenticator(
        client,
        scopes: _scopes,
        redirectUri: Uri.parse(_redirectUri),
        urlLancher: (url) async {
          // Thêm prompt=login vào url
          final urlWithPrompt = Uri.parse(url).replace(queryParameters: {
            ...Uri.parse(url).queryParameters,
            'prompt': 'login'
          });

          log.i('Opening URL: $urlWithPrompt');
          final result = await FlutterWebAuth2.authenticate(
            url: urlWithPrompt.toString(),
            callbackUrlScheme: 'com.yourapp',
          );
          final callbackUri = Uri.parse(result);
          final code = callbackUri.queryParameters['code'];

          if (code != null) {
            log.i('Code received: $code');
            final loginData = await _loginProvider.exchangeCodeForToken(
                code, _clientId, _redirectUri);
            if (loginData != null) {
              log.i('Token received: ${loginData.accessToken}');
              loginModel.value = loginData;
              await saveToStorage();
              Get.back();
              Get.offAllNamed(Paths.TRANGCHU);
            } else {
              log.e('Failed to exchange code for token.');
            }
          } else {
            log.w('No code found in callback URL.');
          }
        },
      );

      await authenticator.authorize();
    } catch (e, stackTrace) {
      log.e('Error during authentication: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> refreshToken() async {
    try {
      if (loginModel.value.refreshToken.isEmpty) {
        log.e('No refresh token available.');
        return;
      }
      final refreshResponse = await _loginProvider.refreshToken(
        loginModel.value.refreshToken,
        _clientId,
      );
      if (refreshResponse != null) {
        loginModel.value = refreshResponse;
        await saveToStorage();
        _startRefreshTimer();
        log.i('Token refreshed successfully.');
      } else {
        log.e('Failed to refresh token, logging out');
        logout();
      }
    } catch (e, stackTrace) {
      log.e('Error during token refresh: $e', error: e, stackTrace: stackTrace);
      logout();
    }
  }

  Future<bool> _verifyTokenValidity() async {
    if (loginModel.value.expiresIn == 0) return false;
    final expiryDate =
        DateTime.now().add(Duration(seconds: loginModel.value.expiresIn));
    return expiryDate.difference(DateTime.now()).inSeconds > _refreshThreshold;
  }

  void _startRefreshTimer() {
    _refreshTimer?.cancel();
    final expiresIn = loginModel.value.expiresIn;
    if (expiresIn > _refreshThreshold) {
      final refreshTime = Duration(seconds: expiresIn - _refreshThreshold);
      _refreshTimer = Timer(refreshTime, () {
        log.i('Token refresh timer triggered.');
        refreshToken();
      });
      log.i(
          'Token refresh timer started, will refresh in ${refreshTime.inSeconds} seconds');
    } else {
      log.w('Token expires too soon, attempting refresh now.');
      refreshToken();
    }
  }

  Future<void> logout() async {
    if (isLoggingOutLoading.value) {
      log.w('Logout already in progress.');
      return;
    }

    isLoggingOutLoading.value = true;
    try {
      await _revokeToken();
      await _clearCookies();
      _clearLoginData();
      log.i('Logout successful.');
      Get.offAllNamed(Paths.LOGIN);
    } catch (e, stackTrace) {
      log.e('Error during logout: $e', error: e, stackTrace: stackTrace);
    } finally {
      isLoggingOutLoading.value = false;
    }
  }

  Future<void> _clearCookies() async {
    try {
      final cookieJar = CookieJar();
      await cookieJar.deleteAll();
      log.i('Cookies cleared successfully.');
    } catch (e, stackTrace) {
      log.e('Error during clearing cookies: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _revokeToken() async {
    try {
      if (loginModel.value.accessToken.isEmpty) {
        log.w('No access token available for revocation.');
        return;
      }

      await _loginProvider.revokeToken(
        loginModel.value.accessToken,
        _clientId,
      );
      log.i('Access token revoked successfully.');

      await _loginProvider.revokeRefreshToken(
        loginModel.value.refreshToken,
        _clientId,
      );
      log.i('Refresh token revoked successfully.');
    } on DioException catch (e) {
      log.e('DioError during token revocation: ${e.message}',
          error: e, stackTrace: e.stackTrace);
      log.e('Error response: ${e.response?.data}');
    } catch (e, stackTrace) {
      log.e('Error during token revocation: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> _clearLoginData() async {
    try {
      final storage = GetStorage();
      final SharedPreferences _pref = await SharedPreferences.getInstance();

      await storage.remove('login_data');
      await storage.remove('access_token');
      await storage.remove('refresh_token');
      await storage.remove('expires_in');
      await storage.remove('token_type');
      await storage.remove('scope');
      await storage.remove('id_token');
      await storage.remove(GetStorageKey.isLogin);

      _pref.remove("accessToken");
      _pref.remove("refreshToken");
      _pref.remove("expires_in");
      _pref.remove("token_type");
      _pref.remove("scope");
      _pref.remove("id_token");

      loginModel.value = LoginModel();
      log.i('Login data cleared successfully.');
    } catch (e, stackTrace) {
      log.e('Error during clearing login data: $e',
          error: e, stackTrace: stackTrace);
    }
  }

  Future<void> handleServerError() async {
    if (isReloginInProgress.value) {
      return;
    }

    try {
      isReloginInProgress.value = true;

      if (loginModel.value.refreshToken.isNotEmpty) {
        try {
          await refreshToken();
          if (loginModel.value.accessToken.isNotEmpty) {
            return;
          }
        } catch (e) {
          log.w('Failed to refresh token during server error handling');
        }
      }

      final oldLoginData = await loadFromStorage();
      if (oldLoginData.isLoggedIn) {
        await performAuthentication();
      } else {
        Get.offAllNamed(Paths.LOGIN);
      }
    } catch (e, stackTrace) {
      log.e('Error during auto re-login: $e', error: e, stackTrace: stackTrace);
      Get.offAllNamed(Paths.LOGIN);
    } finally {
      isReloginInProgress.value = false;
    }
  }

  Future<bool> handleApiResponse(response) async {
    if (response.statusCode == 500) {
      await handleServerError();
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }
}
