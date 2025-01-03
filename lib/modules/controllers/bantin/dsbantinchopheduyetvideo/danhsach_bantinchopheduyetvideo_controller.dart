import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinchopheduyetvideoController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();
  // List<DanhsachBantinData> dsBantinData = [];

  // Danh sách dữ liệu gốc
  var dsBantinData = <DanhsachBantinData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsBanTinChoduyetvideoData = <DanhsachBantinData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  void loadDanhSachBanTin() async {
    change(null, status: RxStatus.loading());
    try {
      await bantinProvider.dsBanTin().then((value) {
        dsBantinData.clear();
        if (value.items != null) {
          dsBantinData.addAll(value.items!);
        }
        change(dsBantinData, status: RxStatus.success());
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
      filteredDsBanTinChoduyetvideoData.assignAll(dsBantinData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsBanTinChoduyetvideoData.assignAll(
        dsBantinData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsBanTinChoduyetvideoData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsBanTinChoduyetvideoData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTIN, arguments: {
      'banTinId': banTinId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachBanTin();
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
