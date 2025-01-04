import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/chitiet_chuongtrinh_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/danhsach_chuongtrinh_controller.dart';

class DanhsachchuongtrinhBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachChuongtrinhController>(
        () => DanhsachChuongtrinhController(),
        fenix: true);
  }
}

class ChitietchuongtrinhBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietChuongtrinhController>(
        () => ChitietChuongtrinhController(),
        fenix: true);
  }
}
