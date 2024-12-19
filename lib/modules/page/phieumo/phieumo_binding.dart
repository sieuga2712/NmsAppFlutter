import 'package:nms_app/modules/page/phieumo/phieumo_controller.dart';
import 'package:get/instance_manager.dart';

class PhieumoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PhieumoController());
  }
}
