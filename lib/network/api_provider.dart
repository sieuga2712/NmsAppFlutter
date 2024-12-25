import 'package:nms_app/core/values/app_config.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRoot {
  final Dio dio = Dio();

  ApiRoot() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final _prefs = await SharedPreferences.getInstance();
      var domainAPi = AppConfig.domainAPI;
      if (!options.path.contains('https')) {
        options.path = domainAPi + options.path;
      }
      String? accessToken = _prefs.getString("accessToken");
      String? refreshToken = _prefs.getString("refreshToken");
      if (accessToken == null || refreshToken == null) {
        return handler.next(options);
      }
      options.headers['Authorization'] = "Bearer $accessToken";
      await _prefs.setString('accessToken', accessToken);
      print('options.headers999999: ${options.headers['Authorization']}');
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      return handler.next(error);
    }));
  }
}
