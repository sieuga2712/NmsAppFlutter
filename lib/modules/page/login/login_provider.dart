import 'dart:convert';
import 'dart:io';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/model/ultis/dsdoituong.dart';
import 'package:nms_app/model/ultis/dsnguyennhan.dart';
import 'package:nms_app/model/ultis/thuebaohong.dart';
import 'package:nms_app/network/api_list.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/network/dio_exception.dart' as dioError;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
// ignore: implementation_imports, library_prefixes
import 'package:dio/src/form_data.dart' as fromData;
import 'package:get_storage/get_storage.dart';

class LoginProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<void> GetDetailBanTin() async {
    try {
      final reponsitory = await dio.get(
        ListApi.DetailBanTin + '/3a16abeb-4171-70f9-9610-f571e5afc9c2',
      );
      print(reponsitory);
    } on DioError catch (err) {
      final errorMessage =
          dioError.DioException.fromDioError(err).errorMessage.toString();
      return Future.error(errorMessage);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
