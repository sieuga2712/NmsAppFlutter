import 'package:cskhpto/network/network_controller.dart';
import 'package:get/instance_manager.dart';

class NetworkBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
  }
}
