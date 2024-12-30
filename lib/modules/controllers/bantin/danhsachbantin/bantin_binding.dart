import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/bantin/danhsachbantin/chitiet_bantin_controller.dart';
import 'package:nms_app/modules/controllers/bantin/danhsachbantin/danhsach_bantin_controller.dart';

class DanhsachbantinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinController>(() => DanhsachBantinController(),
        fenix: true);
  }
}

class ChitietbantinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinController>(() => ChitietBantinController(),
        fenix: true);
  }
}
