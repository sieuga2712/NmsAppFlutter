import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/app_string.dart';
import 'package:nms_app/global_widget/failure_network.dart';
import 'package:nms_app/global_widget/navigation_bottom.dart';
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
  final String? logoPath;

  HeaderAppbar({
    super.key,
    required this.body,
    required this.title,
    required this.isDrawer,
    required this.pathScreen,
    this.isConfirm,
    this.onBackButtonPressed,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 17),
            ),
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
          actions: [
            if (logoPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  logoPath!,
                  height: screenHeight * 0.058,
                ),
              )
          ],
        ),
        drawer: navigaDrawer.NavigationDrawer(),
        bottomNavigationBar: title != "" ? NavigationBottom() : null,
        body: commonController.networkController.connectionStatus.value == 1
            ? body
            : FailureInternetView(description: AppString.noInternet),
      ),
    );
  }
}
