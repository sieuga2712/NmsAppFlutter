import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_bottom_navigation_bar.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_header.dart';
import 'package:nms_app/router.dart';

class HuongDanView extends StatelessWidget {
  const HuongDanView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomHeader(title: 'Hướng dẫn sử dụng'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: screenHeight * 0.04),
            Text(
              'Nội dung:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '1. Nhấn vào biểu tượng tài khoản ở trên để đăng nhập.',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '2. Sử dụng các mục bên dưới để quản lý công việc.',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '3. Chọn "Thông tin liên hệ" để được hỗ trợ',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              '4. Chọn "Giới thiệu" để xem thông tin ứng dụng',
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          _navigateToView(index, context);
        },
      ),
    );
  }

  void _navigateToView(int index, BuildContext context) {
    switch (index) {
      case 0:
        Get.offAllNamed(Paths.WELCOMESCREEN);
        break;
      case 1:
        // Đã ở HuongDanView
        break;
      case 2:
        Get.toNamed(Paths.LOGIN);
        break;
      case 3:
        Get.offAllNamed(Paths.LIENHE);
        break;
      case 4:
        Get.offAllNamed(Paths.GIOITHIEU);
        break;
    }
  }
}
