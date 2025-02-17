import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_bottom_navigation_bar.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_header.dart';
import 'package:nms_app/router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

import 'package:nms_app/core/values/app_color.dart';

class HuongDanView extends StatelessWidget {
  final InAppReview inAppReview=InAppReview.instance;
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
            /*Text(
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
            ),*/ListTile(
            leading: Icon(Icons.attach_file_rounded,
                size: 40.0), // Biểu tượng bên trái
            title: TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://youtu.be/uyfshNjbn38');
               if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Kiểu chữ
              ),
              child: Text('Hướng dẫn sử dụng NMS App'),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          ), 
          ListTile(
            leading: Icon(Icons.file_copy_outlined,
                size: 40.0), // Biểu tượng bên trái
            title: TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://docs.google.com/document/d/1QJklT1Xl2DPIz_eRjGHVEakqe0pCg9myDltq0rr0XOY/edit?usp=sharing');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Kiểu chữ
              ),
              child: Text('Điều khoản sử dụng'),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          ),
          ListTile(
            leading: Icon(Icons.message_outlined,
                size: 40.0), // Biểu tượng bên trái
            title: TextButton(
              onPressed: () async {
               try{
                if(await inAppReview.isAvailable()){
                  inAppReview.requestReview();
                }
               }
               catch(e){
                print(e);
               }
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Kiểu chữ
              ),
              child: Text('Góp ý'),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          )
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
