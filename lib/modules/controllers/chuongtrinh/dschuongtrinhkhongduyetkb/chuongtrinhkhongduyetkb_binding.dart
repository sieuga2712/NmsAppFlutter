import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhkhongduyetkb/chitiet_chuongtrinhkhongduyetkb_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhkhongduyetkb/danhsach_chuongtrinhkhongduyetkb_controller.dart';

class DanhsachchuongtrinhKhongduyetKBBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DanhsachChuongtrinhKhongduyetKBController>(
        () => DanhsachChuongtrinhKhongduyetKBController(),
        fenix: true);
  }
}

class ChitietchuongtrinhKhongduyetKBBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChitietChuongtrinhKhongduyetKBController>(
        () => ChitietChuongtrinhKhongduyetKBController(),
        fenix: true);
  }
}
