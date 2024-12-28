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
                 child: Form(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                      children: [
                        const SizedBox(height: 60),
                        Image.asset(
                          'images/icon.png',
                           width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 40),
                        Obx(() => Text(
                              controller.loginModel.value.isLoggedIn
                                  ? "Đã đăng nhập"
                                  : "Chưa đăng nhập",
                              style: TextStyle(
                                  color: controller.loginModel.value.isLoggedIn
                                      ? Colors.green
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(height: 20),
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
                            onPressed: () => controller.performAuthentication(),
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(color: AppColor.whiteColor),
                            )),
                        const SizedBox(height: 10),
                      ],
                     ),
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