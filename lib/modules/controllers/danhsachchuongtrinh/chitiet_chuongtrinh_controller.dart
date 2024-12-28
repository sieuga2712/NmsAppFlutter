import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/chitiet_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';

class ChitietChuongtrinhController extends GetxController
    with StateMixin<ChitietChuongtrinhModel> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();
  String? chuongTrinhId = Get.arguments["chuongTrinhId"];

  Rx<ChitietChuongtrinhModel?> chiTietChuongTrinh =
      Rx<ChitietChuongtrinhModel?>(null);

  void loadChiTietChuongTrinh() async {
    change(null, status: RxStatus.loading());
    print('chuongTrinhId loadChiTietChuongTrinh: $chuongTrinhId');
    try {
      if (chuongTrinhId != null) {
        await chuongTrinhProvider
            .getChiTietChuongTrinh(chuongTrinhId!)
            .then((response) async {
          chiTietChuongTrinh.value = response;
          change(chiTietChuongTrinh.value, status: RxStatus.success());
        });
      } else {
        change(null, status: RxStatus.error("chuongTrinhId is null"));
      }
    } catch (exception) {
      print('Lỗi: $exception');
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
