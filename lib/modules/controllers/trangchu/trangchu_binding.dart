import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';
import 'package:get/instance_manager.dart';

class TrangchuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrangchuController(), fenix: true);
  }
}
