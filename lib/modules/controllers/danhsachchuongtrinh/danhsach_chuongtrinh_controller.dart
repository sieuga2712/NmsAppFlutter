import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhController extends GetxController with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();


  void loadDanhSachChuongTrinh() async {
    change(null, status: RxStatus.loading());
    await chuongTrinhProvider.dsChuongTrinh().then((value) {
      // if (value.message == "Lấy dữ liệu thành công" && value.data != null) {
      //   dsVanBanDen.clear();
      //   dsVanBanDen.addAll(value.data!);
      //   if (dsVanBanDen.isEmpty) {
      //     change(null, status: RxStatus.empty());
      //   } else {
      //     change(dsVanBanDen, status: RxStatus.success());
      //   }
      // }
    }).catchError((error) {
      print('lỗi: $error');
      change(null, status: RxStatus.error('Đã xảy ra lỗi khi tải dữ liệu.'));
    });
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    try {
      await chuongTrinhProvider.getChiTietChuongTrinh(chuongTrinhId).then((value) {
        // if (value.message == "Lấy dữ liệu thành công") {
          // var maXuLyDen = value.data!.maXuLyDen;
          Get.toNamed(Routers.CHITIETCHUONGTRINH, arguments: {
            'maVanBanDen': chuongTrinhId
          });
        // }
      });
    } catch (exception) {
      print('lỗi: $exception');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
