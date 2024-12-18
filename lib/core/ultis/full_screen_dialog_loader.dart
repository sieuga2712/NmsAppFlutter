import 'package:nms_app/core/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class FullScreenDialogLoader {
  static void showDialog() {
    Get.dialog(
      // ignore: deprecated_member_use
      WillPopScope(
          child: Center(
            child: SpinKitCircle(
                color: Get.isDarkMode
                    ? AppColor.yellowColor
                    : AppColor.blueAccentColor,
                size: 50),
          ),
          onWillPop: () => Future.value(false)),
      barrierDismissible: false,
      barrierColor:
          Theme.of(Get.context!).scaffoldBackgroundColor.withOpacity(0.3),
      useSafeArea: true,
    );
  }

  static void cancleDialog() {
    Get.back();
  }
}
