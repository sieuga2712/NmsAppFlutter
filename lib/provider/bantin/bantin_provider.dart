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

      print('dsBanTin1234: ${response.data}');
      return DanhsachBantinModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ChitietBantinModel> getChiTietBanTin(idBanTin) async {
    try {
      final response = await dio.get("${BantinApi.chiTietBanTin}/$idBanTin/v2");
      print('getChiTietBanTin: $response');
      return ChitietBantinModel.fromJson(response.data);
    } catch (exception) {
      print('response: $exception');
      return Future.error(exception.toString());
    }
  }
}
