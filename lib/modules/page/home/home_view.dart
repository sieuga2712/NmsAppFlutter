import 'package:cskhpto/core/values/app_color.dart';
import 'package:cskhpto/modules/page/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'dart:ui';

// ignore: use_key_in_widget_ructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SingleChildScrollView(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Container(
              child: Center(
                child: SpinKitCircle(
                    color: Get.isDarkMode
                        ? AppColor.yellowColor
                        : AppColor.blueAccentColor,
                    size: 40),
              ),
            );
          }),
        ),
      ),
    );
  }
}
