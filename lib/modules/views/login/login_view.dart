import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_rounded,
                                      color: AppColor.blueAccentColor,
                                      size: MediaQuery.of(context).size.width *
                                          0.06, // Icon size theo % width
                                    ),
                                    SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.02), // Khoảng cách giữa icon và chữ
                                    Text(
                                      'Trở lại',
                                      style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05, // Font size theo % width
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.blueAccentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'images/icon.png',
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.width * 0.4,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Obx(
                              () => Text(
                                controller.loginModel.value.isLoggedIn
                                    ? "Đã đăng nhập"
                                    : "Chưa đăng nhập",
                                style: TextStyle(
                                  color: controller.loginModel.value.isLoggedIn
                                      ? Colors.green
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, // added font size
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColor.blueAccentColor.withOpacity(0.6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: BorderSide(
                                      color: AppColor.blueAccentColor),
                                ),
                                onPressed: () =>
                                    controller.performAuthentication(),
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(color: AppColor.whiteColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
