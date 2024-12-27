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
      final response =
          await dio.post(ChucnangthuchienApi.chucNangThucHien, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return ChucnangthuchienModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<ChucnangthuchienModel> xuLyChuongTrinhBanTinByInput(data) async {
    try {
      print('data: $data');
      print(
          'ChucnangthuchienApi.xuLyChucNang: ${ChucnangthuchienApi.xuLyChucNang}');
      final response =
          await dio.post(ChucnangthuchienApi.xuLyChucNang, data: data);

      print('dsChucNangThucHien: ${response.data}');
      return ChucnangthuchienModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
