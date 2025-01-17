import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_bottom_navigation_bar.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_header.dart';
import 'package:nms_app/router.dart';

class LienHeView extends StatelessWidget {
  const LienHeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomHeader(title: 'Thông tin liên hệ'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: <Widget>[
                  const Icon(Icons.phone),
                  SizedBox(width: screenWidth * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Điện thoại',
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '0210.3.82.82.82',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              Row(
                children: <Widget>[
                  const Icon(Icons.headset),
                  SizedBox(width: screenWidth * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hotline',
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '02103828282',
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
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
        // Đã ở LienHeView
        break;
      case 4:
        Get.offAllNamed(Paths.GIOITHIEU);
        break;
    }
  }
}
