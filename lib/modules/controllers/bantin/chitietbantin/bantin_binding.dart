import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/bantin/chitietbantin/chitiet_bantin_controller.dart';

class ChiTietBanTinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChiTietBanTinController>(
        () => ChiTietBanTinController(),
        fenix: true);
  }
}
