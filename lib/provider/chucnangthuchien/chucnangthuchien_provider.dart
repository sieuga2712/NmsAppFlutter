import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/chucnangthuchien_api.dart';

class ChucnangthuchienProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<ChucnangthuchienModel> getChucNangThucHien(
      String? banTinId, String? chuongTrinhId) async {
    try {
      var data = {
        "chuongTrinhId": chuongTrinhId,
        "banTinId": banTinId,
        "userId": "00000000-0000-0000-0000-000000000000",
        "danhSachChucNang": [],
      };
      print('dsChucNangThucHien data: $data');
      final response =
          await dio.post(ChucnangthuchienApi.chucNangThucHien, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return ChucnangthuchienModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ChucnangthuchienModel> getChucNangThucHienChuongTrinh(
      String? chuongTrinhId) async {
    try {
      var data = {
        "chuongTrinhId": chuongTrinhId,
        "userId": "00000000-0000-0000-0000-000000000000",
        "danhSachChucNang": [],
      };
      print('dsChucNangThucHien data: $data');
      final response =
          await dio.post(ChucnangthuchienApi.chucNangThucHien, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return ChucnangthuchienModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> xuLyChuongTrinhBanTinByInput(data) async {
    try {
      final response =
          await dio.post(ChucnangthuchienApi.xuLyChucNang, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return response.data;
    } catch (error) {
      if (error is DioError &&
          error.response?.data is Map &&
          error.response!.data.containsKey('error')) {
        final errorMessage = error.response!.data['error']['details'];
        print('Lỗi chi tiết: $errorMessage');
        return {
          'isSuccess': false,
          'error': errorMessage,
        };
      } else {
        print('Lỗi không xác định: $error');
        return {
          'isSuccess': false,
          'error': 'Có lỗi xảy ra. Vui lòng thử lại sau.',
        };
      }
    }
  }

  Future<dynamic> xuLyChuongTrinhBanTinByInputV2(data) async {
    try {
      final response =
          await dio.post(ChucnangthuchienApi.xuLyChuongTrinhBanTin, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return response.data;
    } catch (error) {
      if (error is DioError &&
          error.response?.data is Map &&
          error.response!.data.containsKey('error')) {
        final errorMessage = error.response!.data['error']['details'];
        print('Lỗi chi tiết: $errorMessage');
        return {
          'isSuccess': false,
          'error': errorMessage,
        };
      } else {
        print('Lỗi không xác định: $error');
        return {
          'isSuccess': false,
          'error': 'Có lỗi xảy ra. Vui lòng thử lại sau.',
        };
      }
    }
  }
}
