import 'package:get/get.dart';
import 'package:nms_app/router.dart';

class WelcomeScreenController extends GetxController {
  void navigateToLogin() {
    Get.toNamed(Paths.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
