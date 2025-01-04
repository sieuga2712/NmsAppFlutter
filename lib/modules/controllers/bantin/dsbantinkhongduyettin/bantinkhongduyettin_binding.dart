import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyettin/chitiet_bantinkhongduyettin_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyettin/danhsach_bantinkhongduyettin_controller.dart';

class DanhsachBantinKhongduyettinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinKhongduyettinController>(
        () => DanhsachBantinKhongduyettinController(),
        fenix: true);
  }
}

class ChitietBantinKhongduyettinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinKhongDuyetTinController>(
        () => ChitietBantinKhongDuyetTinController(),
        fenix: true);
  }
}
