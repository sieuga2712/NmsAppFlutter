import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/chitiet_bantinchoduyettinbai_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/danhsach_bantinchoduyettinbai_controller.dart';

class DanhsachBantinChoduyetTinbaiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinChoduyetTinbaiController>(
        () => DanhsachBantinChoduyetTinbaiController(),
        fenix: true);
  }
}

class ChitietBantinChoduyetTinbaiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinChoduyetTinbaiController>(
        () => ChitietBantinChoduyetTinbaiController(),
        fenix: true);
  }
}
