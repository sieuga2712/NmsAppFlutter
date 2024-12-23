import 'package:get/instance_manager.dart';
import 'package:nms_app/modules/controllers/danhsachchuongtrinh/danhsachchuongtrinh_controller.dart';

class DanhsachchuongtrinhBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DanhsachchuongtrinhController());
  }
}
