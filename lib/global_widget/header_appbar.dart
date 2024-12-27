import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/app_string.dart';
import 'package:nms_app/global_widget/failure_network.dart';
import 'package:nms_app/setup/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/global_widget/navigation_drawer.dart' as navigaDrawer;

class HeaderAppbar extends StatelessWidget {
  final SetupController commonController = Get.find();

  final Widget body;
  final String title;
  final bool isDrawer;
  final bool? isConfirm;
  final String pathScreen;
  final Function()? onBackButtonPressed;

  HeaderAppbar({
    super.key,
    required this.body,
    required this.title,
    required this.isDrawer,
    required this.pathScreen,
    this.isConfirm,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(title),
          ),
          backgroundColor: AppColor.blueAccentColor,
          foregroundColor: Colors.white,
          leading: isDrawer
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    if (onBackButtonPressed != null) {
                      onBackButtonPressed!();
                      Get.back();
                    } else {
                      Get.back();
                    }
                  },
                ),
        ),
        drawer: navigaDrawer.NavigationDrawer(),
        body: commonController.networkController.connectionStatus.value == 1
            ? body
            : FailureInternetView(description: AppString.noInternet),
      ),
    );
  }
}
