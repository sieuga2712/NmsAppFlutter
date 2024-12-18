import 'package:nms_app/core/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showErrorSnackBar({
    required BuildContext? context,
    required String title,
    required String message,
  }) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColor.failureRed,
        titleText: Text(
          title,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor),
        ),
        messageText: Text(message,
            style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColor.whiteColor)),
        colorText: AppColor.whiteColor,
        borderRadius: 8,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        icon: const Icon(Icons.error_outline,
            size: 40, color: AppColor.whiteColor),
        shouldIconPulse: true,
        duration: const Duration(seconds: 2));
  }

  static void showInfoSnackBar(
      {required BuildContext? context,
      required String title,
      required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.whiteColor),
      ),
      messageText: Text(message,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.whiteColor)),
      colorText: AppColor.whiteColor,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      icon:
          const Icon(Icons.info_outline, size: 40, color: AppColor.whiteColor),
      shouldIconPulse: true,
      duration: const Duration(seconds: 2),
    );
  }

  static void showWarningSnackBar(
      {required BuildContext? context,
      required String title,
      required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColor.warningYellow,
      titleText: Text(title,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor)),
      messageText: Text(message,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.whiteColor)),
      colorText: AppColor.whiteColor,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      icon: const Icon(Icons.check_circle_outline,
          size: 40, color: AppColor.whiteColor),
      shouldIconPulse: true,
      duration: const Duration(seconds: 2),
    );
  }

  static void showSuccessSnackBar(
      {required BuildContext? context,
      required String title,
      required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      titleText: Text(title,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.whiteColor)),
      messageText: Text(message,
          style: Theme.of(Get.context!).textTheme.titleLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColor.whiteColor)),
      colorText: AppColor.whiteColor,
      borderRadius: 8,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      icon: const Icon(Icons.check_circle_outline,
          size: 40, color: AppColor.whiteColor),
      shouldIconPulse: true,
      duration: const Duration(seconds: 2),
    );
  }

  static void showDialogGrowing() {
    Get.defaultDialog(
      title: "Thông báo",
      content: Column(children: [
        SvgPicture.asset(
          'svg/design.svg', // Replace with the actual SVG file path
          width: 100, // Adjust the width as needed
          height: 100, // Adjust the height as needed
        ),
        const SizedBox(height: 16),
        const Text("Chức năng đang phát triển!"),
      ]),
    );
    Future.delayed(const Duration(seconds: 2), () {
      Get.back(); // Close the dialog
    });
  }
}
