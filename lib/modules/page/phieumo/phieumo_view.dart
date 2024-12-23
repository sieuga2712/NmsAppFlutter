import 'package:cskhpto/core/values/app_color.dart';
import 'package:cskhpto/global_widget/button_custom.dart';
import 'package:cskhpto/modules/page/phieumo/phieumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:ui';

// ignore: use_key_in_widget_ructors
class PhieumoView extends GetView<PhieumoController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SingleChildScrollView(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Container(
                child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Center(
                  child: Row(
                    children: [
                      ButtonCustom(
                        title: "Chưa xử lý",
                        onPressed: () {},
                        backgroundColor:
                            controller.choicebutton.value == "chuaxuly"
                                ? AppColor.blueAccentColor
                                : AppColor.whiteColor,
                        textColor: controller.choicebutton.value == "chuaxuly"
                            ? AppColor.whiteColor
                            : AppColor.blueAccentColor,
                      ),
                      ButtonCustom(
                        title: "Đã xử lý",
                        onPressed: () {},
                        backgroundColor:
                            controller.choicebutton.value != "chuaxuly"
                                ? AppColor.blueAccentColor
                                : AppColor.whiteColor,
                        textColor: controller.choicebutton.value != "chuaxuly"
                            ? AppColor.whiteColor
                            : AppColor.blueAccentColor,
                      )
                    ],
                  ),
                ),
              )
            ]));
          }),
        ),
      ),
    );
  }
}
