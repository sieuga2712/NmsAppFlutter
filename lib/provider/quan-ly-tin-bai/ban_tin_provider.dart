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

class BanTinProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();
  Future<List<Dsnguyennhan>> dsnguyennhan() async {
    try {
      final reponsitory = await dio.post(
        ListApi.dsnnbh,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      List<dynamic> jsonList = reponsitory.data;
      List<Dsnguyennhan> nguyennhanList =
          jsonList.map((json) => Dsnguyennhan.fromJson(json)).toList();
      return nguyennhanList;
    } on DioError catch (err) {
      final errorMessage =
          dioError.DioException.fromDioError(err).errorMessage.toString();
      return Future.error(errorMessage);
    } catch (exception) {
      return Future.error(exception.toString());
    }
    // ignore: deprecated_member_use
  }

  Future<List<thuebaohong>> dsBaoHong(
      String userName,
      String passWord,
      int trangthaixl,
      int ttphieu,
      String maNV,
      int nhomquyen,
      int donvi,
      int loaidttb,
      int loaikh) async {
    final formData = {
      'userName': userName,
      'passWord': passWord,
      'ttxly': trangthaixl,
      'ttphieu': ttphieu,
      'manv': maNV,
      'nhomquyen': nhomquyen,
      'donvi_id': donvi,
      'email': userName,
      'loaiDttb': loaidttb,
      'loaiKH': loaikh,
    };
    try {
      final reponsitory = await dio.post(
        ListApi.dstbh,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      List<dynamic> jsonList = reponsitory.data;
      List<thuebaohong> doituonglist =
          jsonList.map((json) => thuebaohong.fromJson(json)).toList();
      return doituonglist;
    } on DioError catch (err) {
      final errorMessage =
          dioError.DioException.fromDioError(err).errorMessage.toString();

      return Future.error(errorMessage);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<List<Dsdoituong>> dsdoituong() async {
    try {
      final reponsitory = await dio.post(
        ListApi.dsdtkh,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      List<dynamic> jsonList = reponsitory.data;
      List<Dsdoituong> doituonglist =
          jsonList.map((json) => Dsdoituong.fromJson(json)).toList();
      return doituonglist;
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
