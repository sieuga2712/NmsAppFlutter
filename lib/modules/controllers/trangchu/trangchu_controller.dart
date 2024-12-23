import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/provider/trangchu/trangchu_provider.dart';

class TrangchuController extends GetxController
    with StateMixin<List<TrangchuModel?>> {
  final trangChuProvider = TrangChuProvider();
  RxList<arrobjdonvi> dsChucVuKiemNhiem = <arrobjdonvi>[].obs;
  var storage = GetStorage();
  var selectDonVi = "".obs;
  void saveInfoAccount() async {
    selectDonVi.value = storage.read(GetStorageKey.donviId).toString();
  }

  void getTrangChu() async {
    print('response99999: sdafjhsidhfsidhfsihdfisdfh');
    change(null, status: RxStatus.loading());
    try {
      await trangChuProvider.getTrangChu().then((value) {
        print('value');
        // if (value) {
        //   change( status: RxStatus.success());
        // } else {
        //   change(null, status: RxStatus.empty());
        // }
      });
    } catch (exception) {
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    super.onInit();
    saveInfoAccount();
    getTrangChu();
  }
}
