import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/user/change_password_controller.dart';
import 'package:nms_app/modules/controllers/user/user_controller.dart';
import 'package:nms_app/provider/user/user_provider.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider(), fenix: true);
    Get.put(UserProfileController(Get.find<UserProvider>()), permanent: true);
    Get.lazyPut<ChangePasswordController>(
        () => ChangePasswordController(Get.find<UserProvider>()),
        fenix: true);
  }
}
