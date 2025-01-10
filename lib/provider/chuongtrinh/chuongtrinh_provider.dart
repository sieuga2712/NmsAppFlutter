import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/chitiet_chuongtrinh_model.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/chuongtrinh_api.dart';

class ChuongtrinhProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<DanhsachChuongtrinhModel> dsChuongTrinh({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'DaPheDuyetKichBan';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${ChuongtrinhApi.danhSachChuongTrinh}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');
      return DanhsachChuongtrinhModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachChuongtrinhModel> dsChuongTrinhChoPheDuyet({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'ChoPheDuyetKichBan';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${ChuongtrinhApi.danhSachChuongTrinh}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');
      return DanhsachChuongtrinhModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachChuongtrinhModel> dsChuongTrinhKhongDuyetKB({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'KhongPheDuyetKichBan';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${ChuongtrinhApi.danhSachChuongTrinh}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');
      return DanhsachChuongtrinhModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<DanhsachChuongtrinhModel> dsChuongTrinhDaXuatBan({
    int skipCount = 0,
    int maxResultCount = 10,
  }) async {
    try {
      String trangThaiChuongTrinhBanTin = 'DaXuatBan';
      String sorting = 'ten ASC';
      final response = await dio.get(
          '${ChuongtrinhApi.danhSachChuongTrinh}?trangThaiChuongTrinhBanTin=$trangThaiChuongTrinhBanTin&sorting=$sorting&skipCount=$skipCount&maxResultCount=$maxResultCount');
      return DanhsachChuongtrinhModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ChitietChuongtrinhModel> getChiTietChuongTrinh(
      String idChuongTrinh) async {
    try {
      final response = await dio
          .get("${ChuongtrinhApi.chiTietChuongTrinh}?input=$idChuongTrinh");
      return ChitietChuongtrinhModel.fromJson(response.data);
    } catch (exception) {
      print('response: $exception');
      return Future.error(exception.toString());
    }
  }
}
