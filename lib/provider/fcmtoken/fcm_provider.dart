import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/user_api.dart';

class FcmTokenProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<dynamic> saveFcmToken(token) async {
    var data = FormData.fromMap({
        "token": token,
      });
    try {
     final response = await dio.post(UserApi.saveFcmToken,data: data,);
      return response.data;
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
