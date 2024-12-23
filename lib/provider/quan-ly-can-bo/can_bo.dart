import 'dart:io';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/network/api_list.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/network/dio_exception.dart' as dioError;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
// ignore: implementation_imports, library_prefixes
import 'package:dio/src/form_data.dart' as fromData;
import 'package:get_storage/get_storage.dart';

class CanBoProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();
  Future<LoginModel> UserLogin(String username, String password) async {
    final formData = {
      'userName': username,
      'passWord': password,
    };
    try {
      final reponsitory = await dio.post(
        ListApi.login,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      return LoginModel.fromJson(reponsitory.data);
    } on DioError catch (err) {
      final errorMessage =
          dioError.DioException.fromDioError(err).errorMessage.toString();
      return Future.error(errorMessage);
    } catch (exception) {
      return Future.error(exception.toString());
    }
    // ignore: deprecated_member_use
  }
}
