import 'package:nms_app/setup/setup_controller.dart';
import 'package:get/instance_manager.dart';

class SetupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SetupController());
  }
}
