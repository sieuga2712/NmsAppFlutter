import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindaxuatban/chitiet_bantindaxuatban_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindaxuatban/danhsach_bantindaxuatban_controller.dart';

class DanhsachBantinDaxuatbanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinDaxuatbanController>(
        () => DanhsachBantinDaxuatbanController(),
        fenix: true);
  }
}

class ChitietBantinDaxuatbanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinDaXuatBanController>(
        () => ChitietBantinDaXuatBanController(),
        fenix: true);
  }
}
