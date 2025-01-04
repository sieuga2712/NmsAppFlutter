import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindangsanxuat/chitiet_bantindangsanxuat_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindangsanxuat/danhsach_bantindangsanxuat_controller.dart';

class DanhsachBantinDangsanxuatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinDangsanxuatController>(
        () => DanhsachBantinDangsanxuatController(),
        fenix: true);
  }
}

class ChitietBantinDangsanxuatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinDangSanXuatController>(
        () => ChitietBantinDangSanXuatController(),
        fenix: true);
  }
}
