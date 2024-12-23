import 'package:nms_app/network/network_controller.dart';
import 'package:nms_app/router.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetupController extends GetxController {
  final GetStorage storage = GetStorage();

  NetworkController networkController = Get.find();
  var progressDowloadFile = 0.0.obs;
  void logOut() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    storage.erase();
    Get.offAllNamed(Paths.LOGIN);
  }
}
