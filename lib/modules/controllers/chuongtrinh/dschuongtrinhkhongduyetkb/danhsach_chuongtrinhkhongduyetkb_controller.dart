import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhKhongduyetKBController extends GetxController
    with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();

  // Danh sách dữ liệu gốc
  var dsChuongTrinhKhongDuyetKBData = <DanhsachChuongtrinhData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsChuongTrinhKhongDuyetKBData = <DanhsachChuongtrinhData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  void loadDanhSachChuongTrinhKhongDuyetKB() async {
    change(null, status: RxStatus.loading());
    try {
      await chuongTrinhProvider.dsChuongTrinhKhongDuyetKB().then((value) {
        dsChuongTrinhKhongDuyetKBData.clear();
        if (value.items != null) {
          dsChuongTrinhKhongDuyetKBData.addAll(value.items!);
        }
        change(dsChuongTrinhKhongDuyetKBData, status: RxStatus.success());
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
      filteredDsChuongTrinhKhongDuyetKBData
          .assignAll(dsChuongTrinhKhongDuyetKBData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsChuongTrinhKhongDuyetKBData.assignAll(
        dsChuongTrinhKhongDuyetKBData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsChuongTrinhKhongDuyetKBData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsChuongTrinhKhongDuyetKBData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    print('chuongtrinhId: $chuongTrinhId');
    Get.toNamed(Routers.CHITIETCHUONGTRINHKHONGDUYETKICHBAN, arguments: {
      'chuongTrinhId': chuongTrinhId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachChuongTrinhKhongDuyetKB();
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
