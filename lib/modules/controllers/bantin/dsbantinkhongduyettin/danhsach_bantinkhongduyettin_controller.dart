import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinKhongduyettinController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  // Danh sách dữ liệu gốc
  var dsBanTinKhongduyettinData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinKhongduyettinData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  /// Load danh sách bản tin
  void loadDanhSachBantinKhongduyettin() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinKhongPheDuyet().then((value) {
        dsBanTinKhongduyettinData.clear();
        if (value.items != null) {
          dsBanTinKhongduyettinData.addAll(value.items!);
          filteredDsBanTinKhongduyettinData.assignAll(value.items!);
        }
        change(filteredDsBanTinKhongduyettinData, status: RxStatus.success());
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
      filteredDsBanTinKhongduyettinData.assignAll(dsBanTinKhongduyettinData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinKhongduyettinData.assignAll(
        dsBanTinKhongduyettinData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinKhongduyettinData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinKhongduyettinData, status: RxStatus.success());
    }
  }

  /// Chuyển trang đến chi tiết bản tin
  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINKHONGDUYETTIN, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBantinKhongduyettin();
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
