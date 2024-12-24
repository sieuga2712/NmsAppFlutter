import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/user/danh_ba_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/provider/api/user_api.dart';

class UserProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();


  Future<DanhBaModel> getDanhDaTheoDonVi() async {
    try {
      var maCanBo = _store.read(GetStorageKey.maCanBo);
      var maDonVi = _store.read(GetStorageKey.maDonVi);
      final response = await dio.get(
        '${UserApi.danhSachDanhBanDv}?ma_don_vi=$maDonVi&ma_can_bo=$maCanBo&checkeds=undefined',
      );
      return DanhBaModel.fromJson(response.data);
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
