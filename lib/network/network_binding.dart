import 'package:nms_app/network/network_controller.dart';
import 'package:get/instance_manager.dart';

class NetworkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
