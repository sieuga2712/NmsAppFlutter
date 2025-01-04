import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhdaxuatban/chitiet_chuongtrinhdaxuatban_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhdaxuatban/danhsach_chuongtrinhdaxuatban_controller.dart';

class DanhsachchuongtrinhDaXuatBanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachChuongtrinhDaXuatBanController>(
        () => DanhsachChuongtrinhDaXuatBanController(),
        fenix: true);
  }
}

class ChitietchuongtrinhDaXuatBanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietChuongtrinhDaXuatBanController>(
        () => ChitietChuongtrinhDaXuatBanController(),
        fenix: true);
  }
}
