import 'dart:convert';

import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/core/ultis/full_screen_dialog_loader.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/modules/page/login/login_provider.dart';
import 'package:nms_app/modules/page/login/login_view.dart';
import 'package:nms_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final loginProvider = LoginProvider();
  final String _clientId = 'NMS_Mobile';
  static const String _issuer = 'https://apinpm.egov.phutho.vn';
  final String _redirectUri = 'com.yourapp://callback';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'email',
    'offline_access',
    'NMS'
  ];

  var accessToken = "".obs;
  var logoutUrl = "".obs;
  @override
  void onInit() async {
    super.onInit();
    _loadSession();
  }

  Future<void> _loadSession() async {
    // Kiểm tra nếu có phiên đăng nhập từ trước
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken.value');
    String? logout = prefs.getString('logoutUrl');
    print('loadsession');
    print('token: ' + token.toString());

    print('logout: ' + logout.toString());

    accessToken.value = token.toString();
    logoutUrl.value = logout.toString();
    if (token != null) {
      print('Đã tìm thấy phiên đăng nhập: $token');
    }
  }

  Future<void> _saveSession(String token, String logout) async {
    // Lưu phiên đăng nhập vào SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken.value', token);
    await prefs.setString('logoutUrl', logout);
  }

  Future<void> _clearSession() async {
    // Xóa phiên đăng nhập khỏi SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken.value');
    await prefs.remove('logoutUrl');
    accessToken.value = "";
    logoutUrl.value = "";
  }

  void checkbantin() async {
    await loginProvider.GetDetailBanTin().then((value) {});
  }

  void performAuthentication() async {
    print("bỏ qua: " + accessToken.value.toString());
    if (accessToken.value != "null" && accessToken.value != "") {
      // Nếu đã đăng nhập, bỏ qua đăng nhập lại
      print('Người dùng đã đăng nhập. Bỏ qua đăng nhập lại.');
      /*ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bạn đã đăng nhập trước đó')),
      );*/
      return;
    }

    try {
      print('Bắt đầu quá trình đăng nhập');

      // Khám phá issuer
      var issuer = await Issuer.discover(Uri.parse(_issuer));
      print('Issuer được khám phá: ${issuer.metadata.issuer}');

      // Tạo client
      var client = Client(issuer, _clientId);

      // Tạo authenticator
      var authenticator = Authenticator(
        client,
        scopes: _scopes,
        redirectUri: Uri.parse(_redirectUri),
        urlLancher: (url) async {
          print('Đang mở URL: $url');
          try {
            final result = await FlutterWebAuth2.authenticate(
              url: url,
              callbackUrlScheme: 'com.yourapp',
            );
            print('Kết quả xác thực: $result');

            // Giải mã và xử lý kết quả
            final Uri callbackUri = Uri.parse(result);
            final String? code = callbackUri.queryParameters['code'];
            final String? state = callbackUri.queryParameters['state'];
            print('code:' + code.toString());
            if (code != null) {
              // Sau khi nhận mã authorization code, gửi yêu cầu đến token endpoint
              await _exchangeCodeForToken(code);
            } else {
              print('Không tìm thấy mã code trong callback URL');
            }

            return result;
          } catch (e) {
            if (e is PlatformException && e.code == 'CANCELED') {
              print('Người dùng đã hủy đăng nhập');
            } else {
              print('Lỗi khác: $e');
              rethrow;
            }
          }
        },
      );

      // Thực hiện authorize
      var credential = await authenticator.authorize();

      // Lấy token response
      var tokenResponse = await credential.getTokenResponse();

      // Lưu token và logout URL
      await _saveSession(tokenResponse.accessToken!,
          credential.generateLogoutUrl().toString());
      accessToken.value = tokenResponse.accessToken.toString();
      logoutUrl.value = credential.generateLogoutUrl().toString();
      print('Đăng nhập thành công');
      print('Access Token: $accessToken.value');
      print('Logout URL: $logoutUrl');

      // Hiển thị thông báo đăng nhập thành công
    } catch (e, stackTrace) {
      print('Lỗi chi tiết: $e');
      print('Stack trace: $stackTrace');
    }
  }

// Hàm gửi yêu cầu POST tới token endpoint để lấy access token
  Future<void> _exchangeCodeForToken(String code) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://apinpm.egov.phutho.vn/connect/token'), // Địa chỉ token endpoint
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': _redirectUri,
          'client_id': _clientId,
          // 'client_secret': 'your_client_secret', // Nếu có
        },
      );

      if (response.statusCode == 200) {
        // Phản hồi thành công, lấy access token
        final Map<String, dynamic> data = json.decode(response.body);
        final String accessToken = data['access_token'];
        final String refreshToken = data['refresh_token'];
        final int expiresIn = data['expires_in'];

        print('Token nhận được: $accessToken.value');
        print('Refresh Token: $refreshToken');
        print('Hạn sử dụng token: $expiresIn giây');
        print('Token nhận được: $accessToken.value');
        // Lưu thông tin session
        await _saveSession(accessToken, refreshToken);

        // Cập nhật trạng thái UI

        this.accessToken.value = accessToken;
        // Bạn có thể lưu refresh token nếu cần thiết cho việc làm mới token

        // Hiển thị thông báo thành công
      } else {
        // Xử lý lỗi nếu phản hồi không thành công
        print('Lỗi từ server: ${response.statusCode}');
      }
    } catch (e) {
      print('Lỗi khi gọi token endpoint: $e');
    }
  }

  Future<void> logout() async {
    try {
      // Gửi yêu cầu logout tới server
      final response = await http.get(
        Uri.parse('https://apinpm.egov.phutho.vn/connect/endsession'),
        headers: {
          'Authorization': 'Bearer ${accessToken.value}',
        },
      );

      // Xử lý redirect nếu cần
      if (response.statusCode == 302) {
        final redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          await http.get(Uri.parse(redirectUrl));
        }
      }

      // Xóa session và cập nhật giao diện
      await _clearSession();
      print('Logout thành công');
    } catch (e) {
      print('Lỗi logout: $e');
      await _clearSession(); // Vẫn clear local session dù có lỗi
    }
    update();
  }
}
