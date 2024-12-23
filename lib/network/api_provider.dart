import 'package:cskhpto/core/values/app_config.dart';
import 'package:cskhpto/model/auth/access_token.dart';
import 'package:cskhpto/network/api_list.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRoot {
  final Dio dio = Dio();

  ApiRoot() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // ignore: no_leading_underscores_for_local_identifiers
      final _prefs = await SharedPreferences.getInstance();
      var domainAPi = AppConfig.domainAPI;
      if (!options.path.contains('https')) {
        options.path = domainAPi + options.path;
      }

      String? accessToken = _prefs.getString("accessToken");
      String? refreshToken = _prefs.getString("refreshToken");
      int? expiredTime = _prefs.getInt("expiredTime");
      if (accessToken == null || expiredTime == null || refreshToken == null) {
        return handler.next(options);
      }
      final now = DateTime.now();
      final later = DateTime.now().add(Duration(minutes: expiredTime));
      bool isExpired = now.isAfter(later);
      if (isExpired) {
        String url = domainAPi + ListApi.auACCESSTOKEN;
        final reponsitory = await dio.get('$url?refresh_token=$refreshToken');
        var result = AccessToken.fromJson(reponsitory.data);
        if (result.data.accessToken.isNotEmpty) {
          options.headers['Authorization'] =
              "Bearer ${result.data.accessToken}";

          await _prefs.setInt('expiredTime', result.data.expire);
          await _prefs.setString('accessToken', result.data.accessToken);
        }
        return handler.next(options);
      } else {
        options.headers['Authorization'] = "Bearer $accessToken";
        return handler.next(options);
      }
      // ignore: deprecated_member_use
    }, onError: (DioError error, handler) async {
      return handler.next(error);
    }));
  }
}
