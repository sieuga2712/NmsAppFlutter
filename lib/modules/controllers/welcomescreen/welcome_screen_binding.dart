import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/welcomescreen/welcome_screen_controller.dart';

class WelcomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeScreenController(), fenix: true);
  }
}
