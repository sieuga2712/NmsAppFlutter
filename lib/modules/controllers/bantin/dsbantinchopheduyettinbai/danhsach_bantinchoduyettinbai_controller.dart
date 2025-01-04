import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinChoduyetTinbaiController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  // Danh sách dữ liệu gốc
  var dsBanTinChoDuyetTinBaiData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinChoDuyetTinBaiData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  /// Load danh sách bản tin
  void loadDanhSachBantinChoduyetTinbai() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinChoDuyetTinBai().then((value) {
        dsBanTinChoDuyetTinBaiData.clear();
        if (value.items != null) {
          dsBanTinChoDuyetTinBaiData.addAll(value.items!);
          filteredDsBanTinChoDuyetTinBaiData.assignAll(value.items!);
        }
        change(filteredDsBanTinChoDuyetTinBaiData, status: RxStatus.success());
      });
    } catch (error) {
      print('Lỗi khi tải dữ liệu bản tin: $error');
      change(null, status: RxStatus.error('Đã xảy ra lỗi khi tải dữ liệu.'));
    }
  }

  void setSearchKey(String? text) {
    keyWord = text?.toLowerCase();
    print('keyWord : $keyWord');

    if (keyWord == null || keyWord!.isEmpty) {
      filteredDsBanTinChoDuyetTinBaiData.assignAll(dsBanTinChoDuyetTinBaiData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinChoDuyetTinBaiData.assignAll(
        dsBanTinChoDuyetTinBaiData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinChoDuyetTinBaiData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinChoDuyetTinBaiData, status: RxStatus.success());
    }
  }

  /// Chuyển trang đến chi tiết bản tin
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
