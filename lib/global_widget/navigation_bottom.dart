import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';
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
              icon: const Icon(Icons.newspaper, color: AppColor.whiteColor),
              onPressed: () {
                navigator('chuongtrinhchopheduyet');
              },
            ),
            IconButton(
              icon: const Icon(Icons.cell_tower, color: AppColor.whiteColor),
              onPressed: () {
                navigator('bantinchopheduyettinbai');
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam_outlined,
                  color: AppColor.whiteColor),
              onPressed: () {
                navigator("bantinchopheduyetvideo");
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
      case 'chuongtrinhchopheduyet':
        Get.offNamed(Routers.DSCHUONGTRINHCHOPHEDUYETKICHBAN);
        break;
      case 'bantinchopheduyetvideo':
        Get.offNamed(Routers.DSBANTINCHOPHEDUYETVIDEO);
        break;
      case 'bantinchopheduyettinbai':
        Get.offNamed(Routers.DSBANTINCHODUYETTINBAI);
        break;
      default:
        break;
    }
  }
}
