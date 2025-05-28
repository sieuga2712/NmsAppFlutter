import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/danhsach_chuongtrinh_controller.dart';
import 'package:nms_app/router.dart';

class NavigationBottom extends GetView {
  const NavigationBottom({super.key});
  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.blueAccentColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: AppColor.whiteColor),
              onPressed: () {
                navigator("trangchu");
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit_note, color: AppColor.whiteColor),
              onPressed: () {
                GetStorage()
                    .write('trangThaiChuongTrinh', 'ChuongTrinhDangSoanThao');
                if (Get.isRegistered<DanhsachChuongtrinhController>()) {
                  final controller = Get.find<DanhsachChuongtrinhController>();
                  controller.trangThaiChuongTrinh.value =
                      'ChuongTrinhDangSoanThao';
                  controller.loadDanhSachChuongTrinh();
                }
                navigator('dschuongtrinh');
              },
            ),
            IconButton(
              icon: const Icon(Icons.task_alt, color: AppColor.whiteColor),
              onPressed: () {
                GetStorage().write('trangThaiChuongTrinh', 'DaPheDuyetKichBan');
                if (Get.isRegistered<DanhsachChuongtrinhController>()) {
                  final controller = Get.find<DanhsachChuongtrinhController>();
                  controller.trangThaiChuongTrinh.value = 'DaPheDuyetKichBan';
                  controller.loadDanhSachChuongTrinh();
                }
                navigator('dschuongtrinh');
              },
            ),
            IconButton(
              icon: const Icon(Icons.block, color: AppColor.whiteColor),
              onPressed: () {
                GetStorage()
                    .write('trangThaiChuongTrinh', 'KhongPheDuyetKichBan');
                if (Get.isRegistered<DanhsachChuongtrinhController>()) {
                  final controller = Get.find<DanhsachChuongtrinhController>();
                  controller.trangThaiChuongTrinh.value =
                      'KhongPheDuyetKichBan';
                  controller.loadDanhSachChuongTrinh();
                }
                navigator("dschuongtrinh");
              },
            ),
          ],
        ),
      ),
    );
  }

  navigator(String maScreen) {
    switch (maScreen) {
      case 'trangchu':
        Get.offNamed(Routers.TRANGCHU);
        break;
      case 'dschuongtrinh':
        Get.offNamed(Routers.DSCHUONGTRINH);
        break;
      default:
        break;
    }
  }
}
