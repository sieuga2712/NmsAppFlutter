import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // Bọc GestureDetector để ẩn bàn phím khi chạm vào màn hình
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return Container(
                // Điều chỉnh chiều cao container theo hướng màn hình
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
                        // Logo ứng dụng
                        Image.asset(
                          'images/icon.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 40),
                        
                        // Nút đăng nhập
                        Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blueAccentColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            minimumSize: Size(
                              (MediaQuery.of(context).size.width - 25), 
                              50
                            ),
                            side: BorderSide(color: AppColor.blueAccentColor),
                          ),
                          onPressed: controller.loginModel.value.isLoggedIn 
                              ? null  // Vô hiệu hóa nút nếu đã đăng nhập
                              : () => controller.performAuthentication(),
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(color: AppColor.whiteColor),
                          )
                        )),
                        
                        SizedBox(height: 10),
                        
                        // Hiển thị trạng thái đăng nhập
                        Obx(() => Text(
                          controller.loginModel.value.isLoggedIn
                              ? "Đã đăng nhập"
                              : "Chưa đăng nhập",
                          style: TextStyle(
                            color: controller.loginModel.value.isLoggedIn
                                ? Colors.green
                                : Colors.grey,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                        
                        const SizedBox(height: 20),
                        
                        // Nút đăng xuất
                        Obx(() => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.blueAccentColor.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(
                              (MediaQuery.of(context).size.width - 25), 
                              50
                            ),
                            side: BorderSide(color: AppColor.blueAccentColor),
                          ),
                          onPressed: controller.loginModel.value.isLoggedIn
                              ? () => controller.logout()
                              : null,  // Vô hiệu hóa nút nếu chưa đăng nhập
                          child: Text(
                            "Đăng xuất",
                            style: TextStyle(color: AppColor.whiteColor),
                          ),
                        )),
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