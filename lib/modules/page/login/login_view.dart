import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/page/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: use_key_in_widget_ructors
class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Container(
              height: orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.height,
              decoration: BoxDecoration(),
              child: Form(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Image.asset(
                        'images/icon.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColor.blueAccentColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(
                                (MediaQuery.of(context).size.width - 25), 50),
                            side: BorderSide(color: AppColor.blueAccentColor),
                          ),
                          onPressed: () {
                            controller.performAuthentication();
                          },
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(color: AppColor.whiteColor),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      if (controller.accessToken != "")
                        Text("Đã đăng nhập: ${controller.accessToken!}"),
                      SizedBox(
                        height: 10,
                      ),
                      if (controller.accessToken != "")
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColor.blueAccentColor.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: Size(
                                  (MediaQuery.of(context).size.width - 25), 50),
                              side: BorderSide(color: AppColor.blueAccentColor),
                            ),
                            onPressed: () {
                              controller.checkbantin();
                            },
                            child: Text(
                              "test api",
                              style: TextStyle(color: AppColor.whiteColor),
                            )),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColor.blueAccentColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(
                                (MediaQuery.of(context).size.width - 25), 50),
                            side: BorderSide(color: AppColor.blueAccentColor),
                          ),
                          onPressed: () {
                            controller.logout();
                          },
                          child: Text(
                            "Đăng xuất",
                            style: TextStyle(color: AppColor.whiteColor),
                          )),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
