import 'package:nms_app/core/values/app_config.dart';
import 'package:dio/dio.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ApiRoot {
  final Dio dio = Dio();
  final log = Logger();

  ApiRoot() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          var domainApi = AppConfig.domainAPI;
          if (!options.path.contains('http')) {
            options.path = domainApi + options.path;
          }
          final loginController = Get.find<LoginController>();
          final accessToken = loginController.loginModel.value.accessToken;

          if (accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if (error.response?.statusCode == 500) {
            final loginController = Get.find<LoginController>();
            try {
              log.w('Received 500, attempting to relogin.');
              await loginController.handleServerError();
              return handler.resolve(await dio.fetch(error.requestOptions));
            } catch (e, stackTrace) {
              log.e('Error handling 500 error: $e',
                  error: e, stackTrace: stackTrace);
              return handler.next(error);
            }
          }

          if (error.response?.statusCode == 401) {
            final loginController = Get.find<LoginController>();
            if (loginController.loginModel.value.refreshToken.isEmpty) {
              log.w('Refresh token is empty, logging out user.');
              await loginController.logout();
              return handler.next(error);
            }
            try {
              log.w('Received 401, attempting to refresh token.');
              await loginController.refreshToken();
              return handler.resolve(await dio.fetch(error.requestOptions));
            } catch (e, stackTrace) {
              log.e('Error refreshing token: $e',
                  error: e, stackTrace: stackTrace);
              await loginController.logout();
              return handler.next(error);
            }
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          if (response.statusCode == 500) {
            final loginController = Get.find<LoginController>();
            loginController.handleServerError().then((_) async {
              try {
                final retryResponse = await dio.fetch(response.requestOptions);
                handler.resolve(retryResponse);
              } catch (e) {
                handler.next(response);
              }
            }).catchError((e) {
              handler.next(response);
            });
            return;
          }
          return handler.next(response);
        },
      ),
    );
  }
}
