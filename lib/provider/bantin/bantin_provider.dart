import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_canxuly_model.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/bantin_api.dart';

class BantinProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<DanhsachBantinModel> dsBanTin({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'ChoPheDuyetvideo';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinChoDuyetTinBai({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'ChoPheDuyetTinBai';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinKhongPheDuyet({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'KhongPheDuyetTinBai';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinDangSanXuat({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'DangSanXuat';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinKhongPheDuyetVideo({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'KhongPheDuyetVideo';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinDaXuatBan({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'TinDaXuatBan';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<List<DanhsachBantinCanxulyModel>> danhSachBanTinCanXuLyByChuongTrinhId(
    String? chuongTrinhId) async {
    try {
      final response =
          await dio.get("${BantinApi.dsBanTinCanXuLy}/$chuongTrinhId");

      final List<dynamic> data = response.data;

      return data
          .map((item) => DanhsachBantinCanxulyModel.fromJson(item))
          .toList();
    } catch (exception) {
      print('Lỗi khi gọi API: $exception');
      return Future.error(exception.toString());
    }
  }

  Future<List<DanhsachBantinCanxulyModel>> danhSachBanTinByChuongTrinhId(
    String? chuongTrinhId) async {
    try {
      final response =
          await dio.get("${BantinApi.dsBanTin}/$chuongTrinhId");

      final List<dynamic> data = response.data;

      return data
          .map((item) => DanhsachBantinCanxulyModel.fromJson(item))
          .toList();
    } catch (exception) {
      print('Lỗi khi gọi API: $exception');
      return Future.error(exception.toString());
    }
  }


  Future<ChitietBantinModel> getChiTietBanTin(idBanTin) async {
    try {
      final response = await dio.get("${BantinApi.chiTietBanTin}/$idBanTin/v2");
      return ChitietBantinModel.fromJson(response.data);
    } catch (exception) {
      print('response: $exception');
      return Future.error(exception.toString());
    }
  }

  Future<dynamic> downloadVideoBanTin(List<String> fileIds) async {
    try {
      final responses = await Future.wait(fileIds.map((fileId) async {
        final response = await dio.post(
          "${BantinApi.downloadFile}/$fileId/download",
          options: Options(responseType: ResponseType.bytes),
        );
        return response.data;
      }));

      return responses;
    } catch (exception) {
      print('response: $exception');
      return Future.error(exception.toString());
    }
  }
}
