import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/bantin_api.dart';

class BantinProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<DanhsachBantinModel> dsBanTin() async {
    try {
      String trangThaiChuongTrinhBanTin = 'ChoPheDuyetvideo';
      String sorting = 'ten ASC';
      int skipCount = 0;
      int maxResultCount = 10;
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachBantinModel> dsBanTinChoDuyetTinBai() async {
    try {
      String trangThaiChuongTrinhBanTin = 'ChoPheDuyetTinBai';
      String sorting = 'ten ASC';
      int skipCount = 0;
      int maxResultCount = 10;
      final response = await dio.get(
          '${BantinApi.danhSachBanTin}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');

      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
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
