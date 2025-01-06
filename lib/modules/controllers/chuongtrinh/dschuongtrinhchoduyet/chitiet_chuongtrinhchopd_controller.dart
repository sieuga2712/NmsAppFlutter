import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/global_widget/approval_popup.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/model/chuongtrinh/chitiet_chuongtrinh_model.dart';
import 'package:nms_app/provider/chucnangthuchien/chucnangthuchien_provider.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';

class ChitietChuongtrinhChopdController extends GetxController
    with StateMixin<ChitietChuongtrinhModel> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();
  var chucNangThucHienProvider = ChucnangthuchienProvider();
  String? chuongTrinhId = Get.arguments["chuongTrinhId"];

  Rx<ChitietChuongtrinhModel?> chiTietChuongTrinh =
      Rx<ChitietChuongtrinhModel?>(null);
  Rx<ChucnangthuchienModel?> danhSachChucNang =
      Rx<ChucnangthuchienModel?>(null);

  void loadChiTietChuongTrinhChoPheDuyet() async {
    change(null, status: RxStatus.loading());
    print('chuongTrinhId loadChiTietChuongTrinhChoPheDuyet: $chuongTrinhId');
    try {
      if (chuongTrinhId != null) {
        await chuongTrinhProvider
            .getChiTietChuongTrinh(chuongTrinhId!)
            .then((response) async {
          await loadChucNangThucHien(chuongTrinhId);
          chiTietChuongTrinh.value = response;
          change(chiTietChuongTrinh.value, status: RxStatus.success());
        });
      } else {
        change(null, status: RxStatus.error("chuongTrinhId is null"));
      }
    } catch (exception) {
      print('Lỗi: $exception');
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  Future<void> loadChucNangThucHien(String? chuongTrinhId) async {
    try {
      await chucNangThucHienProvider
          .getChucNangThucHienChuongTrinh(chuongTrinhId)
          .then((response) {
        danhSachChucNang.value = response;
      });
    } catch (exception) {
      print('Lỗi: $exception');
    }
  }

  void xuLyChucNang(chucNang) async {
    print('chucNang: ${chucNang.tenChucNang}');

    Get.dialog(
      ApprovalPopup(
        title: chucNang.tenChucNang ?? '',
        onConfirm: (String noiDungXuLy) {
          chucNang.ghiChu = noiDungXuLy;
          _processChucNang(chucNang);
        },
        onCancel: () {},
      ),
    );
  }

  void _processChucNang(chucNang) async {
    var data = {
      "chuongTrinhId": chuongTrinhId,
      "userId": "00000000-0000-0000-0000-000000000000",
      "chucNang": {
        "tenChucNang": chucNang.tenChucNang,
        "maTrangThaiTuongUngVoiChucNang":
            chucNang.maTrangThaiTuongUngVoiChucNang,
        "ghiChu": chucNang.ghiChu,
        "mauSac": chucNang.mauSac,
        "dungOTrangChiTiet": chucNang.dungOTrangChiTiet,
        "dungOTrangChinhSua": chucNang.dungOTrangChinhSua,
      },
    };

    print('data: $data');

    try {
      var value =
          await chucNangThucHienProvider.xuLyChuongTrinhBanTinByInput(data);

      if (value['isSuccess'] == true) {
        CustomSnackBar.showSuccessSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: value['message'],
        );
        loadChiTietChuongTrinhChoPheDuyet();
      } else {
        CustomSnackBar.showErrorSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: value['error'] ?? 'Có lỗi xảy ra. Vui lòng thử lại sau.',
        );
      }
    } catch (exception) {
      print('Lỗi: $exception');
      CustomSnackBar.showErrorSnackBar(
        context: Get.context,
        title: "Thông báo",
        message: 'Có lỗi xảy ra. Vui lòng thử lại sau.',
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadChiTietChuongTrinhChoPheDuyet();
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
