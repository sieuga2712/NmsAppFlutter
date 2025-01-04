import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinDaxuatbanController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  // Danh sách dữ liệu gốc
  var dsBanTinDaxxuatbanData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinDaxxuatbanData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  /// Load danh sách bản tin
  void loadDanhSachBantinDaxxuatban() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinDaXuatBan().then((value) {
        dsBanTinDaxxuatbanData.clear();
        if (value.items != null) {
          dsBanTinDaxxuatbanData.addAll(value.items!);
          filteredDsBanTinDaxxuatbanData.assignAll(value.items!);
        }
        change(filteredDsBanTinDaxxuatbanData, status: RxStatus.success());
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
      filteredDsBanTinDaxxuatbanData.assignAll(dsBanTinDaxxuatbanData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinDaxxuatbanData.assignAll(
        dsBanTinDaxxuatbanData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinDaxxuatbanData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinDaxxuatbanData, status: RxStatus.success());
    }
  }

  /// Chuyển trang đến chi tiết bản tin
  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINDAXUATBAN, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBantinDaxxuatban();
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
