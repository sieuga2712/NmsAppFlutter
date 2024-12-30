import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhController extends GetxController
    with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();
  List<DanhsachChuongtrinhData> dsChuongTrinhData = [];

  void loadDanhSachChuongTrinh() async {
    change(null, status: RxStatus.loading());
    try {
      await chuongTrinhProvider.dsChuongTrinh().then((value) {
        dsChuongTrinhData.clear();
        if (value.items != null) {
          dsChuongTrinhData.addAll(value.items!);
        }
        change(dsChuongTrinhData, status: RxStatus.success());
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu bản tin: $error');
      change(null, status: RxStatus.error('Đã xảy ra lỗi khi tải dữ liệu.'));
    }
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    print('chuongtrinhId: $chuongTrinhId');
    Get.toNamed(Routers.CHITIETCHUONGTRINH, arguments: {
      'chuongTrinhId': chuongTrinhId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachChuongTrinh();
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
