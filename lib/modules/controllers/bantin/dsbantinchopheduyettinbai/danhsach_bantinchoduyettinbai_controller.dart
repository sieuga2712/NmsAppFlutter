import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinChoduyetTinbaiController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();
  List<DanhsachBantinData> dsBanTinChoDuyetTinBaiData = [];

  void loadDanhSachBantinChoduyetTinbai() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinChoDuyetTinBai().then((value) {
        dsBanTinChoDuyetTinBaiData.clear();
        if (value.items != null) {
          dsBanTinChoDuyetTinBaiData.addAll(value.items!);
        }
        change(dsBanTinChoDuyetTinBaiData, status: RxStatus.success());
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu bản tin: $error');
      change(null, status: RxStatus.error('Đã xảy ra lỗi khi tải dữ liệu.'));
    }
  }

  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINCHODUYETTIN, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBantinChoduyetTinbai();
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
