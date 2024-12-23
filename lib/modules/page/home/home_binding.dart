import 'package:nms_app/modules/page/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
