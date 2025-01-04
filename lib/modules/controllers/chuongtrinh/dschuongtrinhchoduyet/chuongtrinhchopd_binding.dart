import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhchoduyet/chitiet_chuongtrinhchopd_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhchoduyet/danhsach_chuongtrinhchopd_controller.dart';

class DanhsachchuongtrinhchopheduyetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachChuongtrinhChopdController>(
        () => DanhsachChuongtrinhChopdController(),
        fenix: true);
  }
}

class ChitietchuongtrinhchopheduyetBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietChuongtrinhChopdController>(
        () => ChitietChuongtrinhChopdController(),
        fenix: true);
  }
}
