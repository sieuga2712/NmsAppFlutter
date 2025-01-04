import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhChopdController extends GetxController
    with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();

  var dsChuongTrinhChoPheDuyetData = <DanhsachChuongtrinhData>[].obs;

  var filteredDsChuongTrinhChoPheDuyetData = <DanhsachChuongtrinhData>[].obs;

  // Từ khóa tìm kiếm
  String? keyWord = "";

  void loadDanhSachChuongTrinhChopd() async {
    change(null, status: RxStatus.loading());
    try {
      await chuongTrinhProvider.dsChuongTrinhChoPheDuyet().then((value) {
        dsChuongTrinhChoPheDuyetData.clear();
        if (value.items != null) {
          dsChuongTrinhChoPheDuyetData.addAll(value.items!);
        }
        change(dsChuongTrinhChoPheDuyetData, status: RxStatus.success());
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
      filteredDsChuongTrinhChoPheDuyetData
          .assignAll(dsChuongTrinhChoPheDuyetData);
    } else {
      // Lọc dữ liệu theo trường `ten`
      filteredDsChuongTrinhChoPheDuyetData.assignAll(
        dsChuongTrinhChoPheDuyetData.where(
          (item) => item.ten!.toLowerCase().contains(keyWord!),
        ),
      );
    }
    if (filteredDsChuongTrinhChoPheDuyetData.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(filteredDsChuongTrinhChoPheDuyetData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    print('chuongtrinhId: $chuongTrinhId');
    Get.toNamed(Routers.CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN, arguments: {
      'chuongTrinhId': chuongTrinhId,
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhSachChuongTrinhChopd();
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
