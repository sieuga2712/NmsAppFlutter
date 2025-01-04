import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhDaXuatBanController extends GetxController
    with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();

  // Danh sách dữ liệu gốc
  var dsChuongTrinhDaXuatBanData = <DanhsachChuongtrinhData>[].obs;

  // Danh sách sau khi tìm kiếm
  var filteredDsChuongTrinhDaXuatBanData = <DanhsachChuongtrinhData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  void loadDanhSachChuongTrinhDaXuatBan() async {
    change(null, status: RxStatus.loading());
    try {
      await chuongTrinhProvider.dsChuongTrinhDaXuatBan().then((value) {
        dsChuongTrinhDaXuatBanData.clear();
        if (value.items != null) {
          dsChuongTrinhDaXuatBanData.addAll(value.items!);
        }
        change(dsChuongTrinhDaXuatBanData, status: RxStatus.success());
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
      filteredDsChuongTrinhDaXuatBanData
          .assignAll(dsChuongTrinhDaXuatBanData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsChuongTrinhDaXuatBanData.assignAll(
        dsChuongTrinhDaXuatBanData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsChuongTrinhDaXuatBanData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsChuongTrinhDaXuatBanData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    print('chuongtrinhId: $chuongTrinhId');
    Get.toNamed(Routers.CHITIETCHUONGTRINHDAXUATBAN, arguments: {
      'chuongTrinhId': chuongTrinhId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachChuongTrinhDaXuatBan();
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
