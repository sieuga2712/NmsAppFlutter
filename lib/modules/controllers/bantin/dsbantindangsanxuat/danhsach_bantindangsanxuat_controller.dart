import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinDangsanxuatController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  // Danh sách dữ liệu gốc
  var dsBanTinDangsanxuatData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinDangsanxuatData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  /// Load danh sách bản tin
  void loadDanhSachBantinDangsanxuat() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinDangSanXuat().then((value) {
        dsBanTinDangsanxuatData.clear();
        if (value.items != null) {
          dsBanTinDangsanxuatData.addAll(value.items!);
          filteredDsBanTinDangsanxuatData.assignAll(value.items!);
        }
        change(filteredDsBanTinDangsanxuatData, status: RxStatus.success());
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
      filteredDsBanTinDangsanxuatData.assignAll(dsBanTinDangsanxuatData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinDangsanxuatData.assignAll(
        dsBanTinDangsanxuatData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinDangsanxuatData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinDangsanxuatData, status: RxStatus.success());
    }
  }

  /// Chuyển trang đến chi tiết bản tin
  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINDANGSANXUAT, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBantinDangsanxuat();
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
