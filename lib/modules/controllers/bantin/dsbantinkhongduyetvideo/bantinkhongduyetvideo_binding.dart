import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyetvideo/chitiet_bantinkhongduyetvideo_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyetvideo/danhsach_bantinkhongduyetvideo_controller.dart';

class DanhsachBantinKhongduyetvideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachBantinKhongduyetvideoController>(
        () => DanhsachBantinKhongduyetvideoController(),
        fenix: true);
  }
}

class ChitietBantinKhongduyetvideoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietBantinKhongDuyetVideoController>(
        () => ChitietBantinKhongDuyetVideoController(),
        fenix: true);
  }
}
