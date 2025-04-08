import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/global_widget/approval_popup.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_canxuly_model.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/model/chuongtrinh/chitiet_chuongtrinh_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/provider/chucnangthuchien/chucnangthuchien_provider.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';

class ChitietChuongtrinhChopdController extends GetxController
    with StateMixin<ChitietChuongtrinhModel> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();
  var banTinProvider = BantinProvider();
  var chucNangThucHienProvider = ChucnangthuchienProvider();
  String? chuongTrinhId = Get.arguments["chuongTrinhId"];

  Rx<ChitietChuongtrinhModel?> chiTietChuongTrinh =
      Rx<ChitietChuongtrinhModel?>(null);
  Rx<ChucnangthuchienModel?> danhSachChucNang =
      Rx<ChucnangthuchienModel?>(null);
  var dsBanTinCanXuLyByChuongTrinhId = <DanhsachBantinCanxulyModel>[].obs;
  var isAllSelected = false.obs;

  void loadChiTietChuongTrinhChoPheDuyet() async {
    change(null, status: RxStatus.loading());
    print('chuongTrinhId loadChiTietChuongTrinhChoPheDuyet: $chuongTrinhId');
    try {
      if (chuongTrinhId != null) {
        await chuongTrinhProvider
            .getChiTietChuongTrinh(chuongTrinhId!)
            .then((response) async {
          await loadDsBanTinCanXuLyByChuongTrinhId(chuongTrinhId);
          await loadChucNangThucHien(chuongTrinhId);
          chiTietChuongTrinh.value = response;
          change(chiTietChuongTrinh.value, status: RxStatus.success());
        });
      } else {
        change(null, status: RxStatus.error("chuongTrinhId is null"));
      }
    } catch (exception) {
      print('Lỗi loadChiTietChuongTrinhChoPheDuyet: $exception');
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  Future<void> loadDsBanTinCanXuLyByChuongTrinhId(String? chuongTrinhId) async {
    try {
      dsBanTinCanXuLyByChuongTrinhId.clear();
      await banTinProvider
          .danhSachBanTinCanXuLyByChuongTrinhId(chuongTrinhId)
          .then((response) {
        dsBanTinCanXuLyByChuongTrinhId.addAll(response);
        print(
            'dsBanTinCanXuLyByChuongTrinhId: $dsBanTinCanXuLyByChuongTrinhId');
      });
    } catch (exception) {
      print('Lỗi loadDsBanTinCanXuLyByChuongTrinhId: $exception');
    }
  }

  var selectedBanTinIds = <String>[].obs;

  void toggleBanTinSelection(String banTinId) {
    if (selectedBanTinIds.contains(banTinId)) {
      selectedBanTinIds.remove(banTinId);
    } else {
      selectedBanTinIds.add(banTinId);
    }
    selectedBanTinIds.refresh();
    print('Selected ban tin IDs: $selectedBanTinIds');
  }

  Future<void> loadChucNangThucHien(String? chuongTrinhId) async {
    try {
      await chucNangThucHienProvider
          .getChucNangThucHienChuongTrinh(chuongTrinhId)
          .then((response) {
        danhSachChucNang.value = response;
      });
    } catch (exception) {
      print('Lỗi loadChucNangThucHien: $exception');
    }
  }

  void xuLyChucNang(chucNang) async {
    print('chucNang: $chucNang');
    print('selectedBanTinIds: $selectedBanTinIds');
    if (selectedBanTinIds.isEmpty) {
      CustomSnackBar.showWarningSnackBar(
        context: Get.context,
        title: "Thông báo",
        message: 'Vui lòng chọn ít nhất 1 bản tin để xử lý',
      );
    } else {
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
  }

  void _processChucNang(chucNang) async {
    var data = {
      "chuongTrinhId": chuongTrinhId,
      "userId": "00000000-0000-0000-0000-000000000000",
      "dsTin": this.selectedBanTinIds,
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
          await chucNangThucHienProvider.xuLyChuongTrinhBanTinByInputV2(data);

      if (value['isSuccess'] == true) {
        CustomSnackBar.showSuccessSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: value['message'],
        );
        selectedBanTinIds.clear();
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
