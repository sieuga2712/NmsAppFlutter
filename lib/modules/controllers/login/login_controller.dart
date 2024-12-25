import 'package:flutter/services.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:get/get.dart';
import 'package:nms_app/router.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final String _clientId = 'NMS_Mobile';
  static const String _issuer = 'https://apinpm.egov.phutho.vn';
  final String _redirectUri = 'com.yourapp://callback';
  final List<String> _scopes = [
    'openid',
    'profile',
    'email',
    'offline_access',
    'NMS'
  ];

  final loginModel = LoginModel().obs;

  @override
  void onInit() async {
    super.onInit();
    // Tải dữ liệu đăng nhập đã lưu khi khởi tạo controller
    loginModel.value = await LoginModel.loadFromStorage();

    if (loginModel.value.isLoggedIn) {
      print('Đã có token, chuyển hướng đến trang chủ');
      await Future.delayed(Duration(milliseconds: 30));
      Get.offAllNamed(Paths.TRANGCHU);
    } else {
      print('Chưa đăng nhập: ${loginModel.value.refreshToken}');
    }

    if (loginModel.value.refreshToken.isNotEmpty) {
      print('Refresh token: ${loginModel.value.refreshToken}');
    } else {
      print('Không có refresh token');
    }
  }

  Future<void> _exchangeCodeForToken(String code) async {
    try {
      final response = await http.post(
        Uri.parse('https://apinpm.egov.phutho.vn/connect/token'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': _redirectUri,
          'client_id': _clientId,
        },
      );

      if (response.statusCode == 200) {
        // Xử lý phản hồi và lưu vào model
        final newLoginModel = LoginModel.tryParseResponse(response.body);

        if (newLoginModel != null) {
          loginModel.value = newLoginModel;
          await loginModel.value.saveToStorage();
          print('Lưu dữ liệu đăng nhập thành công');
          if (loginModel.value.isLoggedIn) {
            // Chỉ chuyển tiếp nếu đã đăng nhập thành công
            Get.offAllNamed(Paths.TRANGCHU);
          } else {
            print('Đăng nhập không thành công, vẫn ở màn hình hiện tại');
          }
        }
      }
    } catch (e) {
      print('Lỗi khi trao đổi token: $e');
    }
  }

  void performAuthentication() async {
    if (loginModel.value.isLoggedIn) {
      print('Đã đăng nhập, chuyển hướng đến trang chủ');
      Get.offAllNamed(Paths.TRANGCHU);
      return;
    }

    try {
      print('Bắt đầu quá trình đăng nhập');

      var issuer = await Issuer.discover(Uri.parse(_issuer));
      print('Issuer được khám phá: ${issuer.metadata.issuer}');

      var client = Client(issuer, _clientId);

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

            final Uri callbackUri = Uri.parse(result);
            final String? code = callbackUri.queryParameters['code'];
            final String? state = callbackUri.queryParameters['state'];
            print('code:' + code.toString());
            if (code != null) {
              await _exchangeCodeForToken(code);
            } else {
              print('Không tìm thấy mã code trong callback URL');
            }
            
            // return result;
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

      var credential = await authenticator.authorize();
      var tokenResponse = await credential.getTokenResponse();

      print('Đăng nhập thành công: ${tokenResponse.accessToken}');
    } catch (e, stackTrace) {
      print('Lỗi khi xác thực: $e');
      print('Stack trace: $stackTrace');
    }
  }

  Future<void> logout() async {
    try {
      await LoginModel.clearStorage();
      loginModel.value = LoginModel();
    } catch (e) {
      print('Lỗi khi đăng xuất: $e');
    }
  }
}
