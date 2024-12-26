import 'package:nms_app/core/values/app_config.dart';
import 'package:dio/dio.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ApiRoot {
  final Dio dio = Dio();

  ApiRoot() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final _prefs = await SharedPreferences.getInstance();
          var domainApi = AppConfig.domainAPI;

          if (!options.path.contains('https')) {
            options.path = domainApi + options.path;
          }

          String? accessToken = _prefs.getString("accessToken");
          String? refreshToken = _prefs.getString("refreshToken");

          if (accessToken == null || refreshToken == null) {
            return handler.next(options);
          }

          options.headers['Authorization'] = "Bearer $accessToken";

          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              final loginController = Get.find<LoginController>();
              await loginController.refreshToken();

              return handler.resolve(await dio.fetch(error.requestOptions));
            } catch (e) {
              final loginController = Get.find<LoginController>();
              await loginController.logout();
              return handler.next(error);
            }
          }

          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
  }
}
