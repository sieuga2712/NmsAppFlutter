import 'package:cskhpto/modules/page/login/login_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
