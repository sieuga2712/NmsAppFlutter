import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_bottom_navigation_bar.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_header.dart';
import 'package:nms_app/router.dart';

class GioiThieuView extends StatelessWidget {
  const GioiThieuView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomHeader(title: "Giới thiệu"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.01),
              Image.asset(
                'images/nmsapp.png',
                height: screenHeight * 0.15,
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Ứng dụng NMSApp được nâng cấp với nhiều cải tiến, giúp cơ quan, đơn vị nâng cao hiệu quả công tác điều hành quản lý thông qua các chức năng sau:',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('- Quản lý nội dung chương trình',
                        style: TextStyle(fontSize: screenWidth * 0.04)),
                    SizedBox(height: screenHeight * 0.01),
                    Text('- Quản lý nội dung bản tin',
                        style: TextStyle(fontSize: screenWidth * 0.04)),
                    SizedBox(height: screenHeight * 0.01),
                    Text('- Gửi yêu cầu, phê duyệt, huỷ',
                        style: TextStyle(fontSize: screenWidth * 0.04)),
                    SizedBox(height: screenHeight * 0.01),
                    Text('- Và nhiều tiện ích khác',
                        style: TextStyle(fontSize: screenWidth * 0.04)),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Thông tin phiên bản: 1.0.0',
                      style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Trong phiên bản này, chúng tôi đã:',
                  style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '- Tăng cường hiệu suất.',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 4,
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
        Get.offAllNamed(Paths.HUONGDAN);
        break;
      case 2:
        Get.toNamed(Paths.LOGIN);
        break;
      case 3:
        Get.offAllNamed(Paths.LIENHE);
        break;
      case 4:
        // Đã ở GioiThieuView
        break;
    }
  }
}
