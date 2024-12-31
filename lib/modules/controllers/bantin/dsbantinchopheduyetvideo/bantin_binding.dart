import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/chitiet_bantinchopheduyetvideo_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/danhsach_bantinchopheduyetvideo_controller.dart';

class DanhsachbantinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinchopheduyetvideoController>(() => DanhsachBantinchopheduyetvideoController(),
        fenix: true);
  }
}

class ChitietbantinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinchopheduyetvideoController>(() => ChitietBantinchopheduyetvideoController(),
        fenix: true);
  }
}