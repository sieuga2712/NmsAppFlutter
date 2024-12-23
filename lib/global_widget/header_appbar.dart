import 'package:cskhpto/core/values/app_color.dart';
import 'package:cskhpto/core/values/app_string.dart';
import 'package:cskhpto/global_widget/failure_network.dart';
import 'package:cskhpto/network/network_controller.dart';
import 'package:cskhpto/setup/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cskhpto/global_widget/navigation_drawer.dart' as navigaDrawer;

class HeaderAppbar extends StatelessWidget {
  final SetupController commonController = Get.find();

  final Widget body;
  final String title;
  final bool isDrawer;
  final bool? isConfirm;
  final String pathScreen;
  HeaderAppbar(
      {super.key,
      required this.body,
      required this.title,
      required this.isDrawer,
      required this.pathScreen,
      this.isConfirm});

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
                    Get.back();
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
