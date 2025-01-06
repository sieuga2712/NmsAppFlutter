import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/global_widget/approval_popup.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/provider/chucnangthuchien/chucnangthuchien_provider.dart';

class ChitietBantinChoduyetTinbaiController extends GetxController
    with StateMixin<ChitietBantinModel> {
  var storage = GetStorage();
  var banTinProvider = BantinProvider();
  var chucNangThucHienProvider = ChucnangthuchienProvider();
  String? banTinId = Get.arguments["banTinId"];
  String? chuongTrinhId = "";

  Rx<ChitietBantinModel?> chiTietBanTin = Rx<ChitietBantinModel?>(null);
  Rx<ChucnangthuchienModel?> danhSachChucNang =
      Rx<ChucnangthuchienModel?>(null);

  void loadChiTietBanTinChoDuyetTinBai() async {
    change(null, status: RxStatus.loading());
    print('banTinId loadChiTietBanTin: $banTinId');
    try {
      await banTinProvider.getChiTietBanTin(banTinId).then((response) async {
        chiTietBanTin.value = response;
        chuongTrinhId = chiTietBanTin.value?.chuongTrinhId;
        await loadChucNangThucHien(banTinId, chuongTrinhId);
        change(chiTietBanTin.value, status: RxStatus.success());
      });
    } catch (exception) {
      print('Lỗi: $exception');
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  Future<void> loadChucNangThucHien(
      String? banTinId, String? chuongTrinhId) async {
    try {
      await chucNangThucHienProvider
          .getChucNangThucHien(banTinId, chuongTrinhId)
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
      "banTinId": banTinId,
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
        loadChiTietBanTinChoDuyetTinBai();
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
    loadChiTietBanTinChoDuyetTinBai();
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
