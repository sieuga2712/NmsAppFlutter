import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/page/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:ui';

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
                key: controller.loginFormKey,
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
                      TextFormField(
                          style: TextStyle(color: AppColor.blackColor),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColor.blueAccentColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColor.blueAccentColor),
                                  borderRadius: BorderRadius.circular(10)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColor.blueAccentColor),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: AppColor.blueAccentColor),
                                  borderRadius: BorderRadius.circular(10)),
                              errorStyle:
                                  TextStyle(color: AppColor.blueAccentColor),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.whiteColor),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Tài khoản',
                              hintStyle:
                                  TextStyle(color: AppColor.blueAccentColor),
                              prefixIcon: Icon(Icons.account_circle_outlined,
                                  color: AppColor.blueAccentColor)),
                          controller: controller.usernameController,
                          validator: (value) {
                            return controller.validateUserName(value!);
                          },
                          onSaved: (value) {
                            controller.username = value!;
                          }),
                      SizedBox(height: 10),
                      TextFormField(
                        cursorColor: AppColor.blueAccentColor,
                        style: TextStyle(color: AppColor.blackColor),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.blueAccentColor),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.blueAccentColor),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.blueAccentColor),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.blueAccentColor),
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle:
                                TextStyle(color: AppColor.blueAccentColor),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: AppColor.blueAccentColor),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Mật khẩu",
                            hintStyle:
                                TextStyle(color: AppColor.blueAccentColor),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: AppColor.blueAccentColor)),
                        controller: controller.passwordController,
                        obscureText: true,
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                        onSaved: (value) {
                          controller.password = value!;
                        },
                      ),
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
                            controller.laythongtintaikhoan();
                          },
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(color: AppColor.whiteColor),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sử dụng tài khoản tập đoàn để đăng nhập",
                        style: TextStyle(color: AppColor.redColor),
                      )
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
