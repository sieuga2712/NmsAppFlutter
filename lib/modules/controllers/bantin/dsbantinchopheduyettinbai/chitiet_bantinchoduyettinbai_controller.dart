import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';

class ChitietBantinChoduyetTinbaiController extends GetxController
    with StateMixin<ChitietBantinModel> {
  var storage = GetStorage();
  var banTinProvider = BantinProvider();
  String? banTinId = Get.arguments["banTinId"];
  String? chuongTrinhId = "";

  Rx<ChitietBantinModel?> chiTietBanTin = Rx<ChitietBantinModel?>(null);

  void loadChiTietBanTinChoDuyetTinBai() async {
    change(null, status: RxStatus.loading());
    print('banTinId loadChiTietBanTin: $banTinId');
    try {
      await banTinProvider.getChiTietBanTin(banTinId).then((response) async {
        chiTietBanTin.value = response;
        chuongTrinhId = chiTietBanTin.value?.chuongTrinhId;
        change(chiTietBanTin.value, status: RxStatus.success());
      });
    } catch (exception) {
      print('Lỗi: $exception');
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadChiTietBanTinChoDuyetTinBai();
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
