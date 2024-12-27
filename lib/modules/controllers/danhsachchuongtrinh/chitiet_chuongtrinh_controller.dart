import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/chitiet_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';


class ChitietChuongtrinhController extends GetxController with StateMixin<ChitietChuongtrinhModel> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();
  String? chuongTrinhId = Get.arguments["chuongTrinhId"] ?? '3a170ddb-fc88-0a65-f3d1-2acd0e090558';

  void loadChiTietChuongTrinh() async {
    change(null, status: RxStatus.loading());
    try {
      await chuongTrinhProvider.getChiTietChuongTrinh(chuongTrinhId).then((user) {

      });

    } catch (exception) {
      change(null, status: RxStatus.error(exception.toString()));
    }
  }
  
  
   @override
  void onInit() {
    super.onInit();
    loadChiTietChuongTrinh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
