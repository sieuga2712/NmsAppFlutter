import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinKhongduyetvideoController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  // Danh sách dữ liệu gốc
  var dsBanTinKhongduyetvideoData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinKhongduyetvideoData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  /// Load danh sách bản tin
  void loadDanhSachBantinKhongduyetvideo() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTinKhongPheDuyetVideo().then((value) {
        dsBanTinKhongduyetvideoData.clear();
        if (value.items != null) {
          dsBanTinKhongduyetvideoData.addAll(value.items!);
          filteredDsBanTinKhongduyetvideoData.assignAll(value.items!);
        }
        change(filteredDsBanTinKhongduyetvideoData, status: RxStatus.success());
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
      filteredDsBanTinKhongduyetvideoData
          .assignAll(dsBanTinKhongduyetvideoData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinKhongduyetvideoData.assignAll(
        dsBanTinKhongduyetvideoData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinKhongduyetvideoData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinKhongduyetvideoData, status: RxStatus.success());
    }
  }

  /// Chuyển trang đến chi tiết bản tin
  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINKHONGDUYETVIDEO, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBantinKhongduyetvideo();
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
