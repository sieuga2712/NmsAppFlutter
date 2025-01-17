import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/router.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08, vertical: screenHeight * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.2),
                Center(
                  child: Image.asset(
                    'images/icon.png',
                    width: screenWidth * 0.5,
                    height: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),

                // Login Status Text
                Center(
                  child: Obx(
                    () => Text(
                      controller.loginModel.value.isLoggedIn
                          ? "Đã đăng nhập"
                          : "Chưa đăng nhập",
                      style: TextStyle(
                        color: controller.loginModel.value.isLoggedIn
                            ? Colors.green
                            : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),

                // Row for Back and Đăng nhập Buttons
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: screenHeight * 0.065,
                        child: OutlinedButton.icon(
                          onPressed: () => Get.offAllNamed(Paths.WELCOMESCREEN),
                          icon: Icon(Icons.arrow_back_rounded,
                              color: AppColor.blueAccentColor),
                          label: Text(
                            'Trở lại',
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w500,
                              color: AppColor.blueAccentColor,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.blueAccentColor,
                            side: BorderSide(color: AppColor.blueAccentColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: screenWidth * 0.04), // Spacing between buttons
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: screenHeight * 0.065,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.whiteColor,
                            backgroundColor: AppColor.blueAccentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () => controller.performAuthentication(),
                          child: const Text("Đăng nhập"),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
