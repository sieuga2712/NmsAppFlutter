import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/user/danh_ba_controlller.dart';


class DanhBaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhBaControlller>(() => DanhBaControlller(), fenix: true);
  }
}
