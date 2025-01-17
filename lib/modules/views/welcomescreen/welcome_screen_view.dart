import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/welcomescreen/welcome_screen_controller.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_bottom_navigation_bar.dart';
import 'package:nms_app/global_widget/welcomescreen/custom_header.dart';
import 'package:nms_app/router.dart'; // Đảm bảo import router của bạn

class HomeView extends GetView<WelcomeScreenController> {
  final valueItemBL = <ItemNhacViec>[].obs;

  // ignore: use_super_parameters
  HomeView({Key? key}) : super(key: key);

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  @override
  Widget build(BuildContext context) {
    double tile = 1.0;
    final data = MediaQuery.of(context);
    final screenWidth = data.size.width;
    final screenHeight = data.size.height;

    if (getDeviceType() == 'tablet' && screenWidth > screenHeight) {
      tile = 3.0;
    }

    valueItemBL.value = ([
      ItemNhacViec.fromJson({
        "key": "chuongTrinh",
        "tenNhacViec": "Chương trình đang SX",
        "indexNhacViec": 1,
        "imagePath": "images/2.png"
      }),
      ItemNhacViec.fromJson({
        "key": "pheDuyetKB",
        "tenNhacViec": "Chờ phê duyệt KB",
        "indexNhacViec": 2,
        "imagePath": "images/2.png"
      }),
      ItemNhacViec.fromJson({
        "key": "tinBai",
        "tenNhacViec": "Chờ duyệt tin bài",
        "indexNhacViec": 3,
        "imagePath": "images/3.png"
      }),
      ItemNhacViec.fromJson({
        "key": "video",
        "tenNhacViec": "Chờ duyệt Video",
        "indexNhacViec": 4,
        "imagePath": "images/4.png"
      }),
    ]);

    return Scaffold(
      appBar: const CustomHeader(title: 'NMSApp'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.04),
              InkWell(
                onTap: () => controller.navigateToLogin(),
                child: CircleAvatar(
                  radius: screenWidth * 0.15,
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: screenWidth * 0.25,
                    color: const Color.fromARGB(255, 105, 105, 105),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Đăng nhập',
                style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    color: const Color(0xFF0277BD)),
              ),
              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: OrientationBuilder(builder: (context, orientation) {
                  return SizedBox(
                    height: screenHeight * 0.6, // Điều chỉnh chiều cao phù hợp
                    child: Obx(() {
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount:
                            orientation == Orientation.portrait ? 2 : 4,
                        childAspectRatio: tile,
                        crossAxisSpacing: screenWidth * 0.02,
                        mainAxisSpacing: screenWidth * 0.02,
                        physics: const ClampingScrollPhysics(),
                        children: valueItemBL
                            .map((element) => ItemMenu(
                                  title: element.tenNhacViec,
                                  imagePath: element.imagePath,
                                  clickOn: () => _showLoginDialog(context),
                                ))
                            .toList(),
                      );
                    }),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // Đánh dấu view hiện tại
        onTap: (index) {
          switch (index) {
            case 0:
              // Đã ở HomeView
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
              Get.offAllNamed(Paths.GIOITHIEU);
              break;
          }
        },
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Get.defaultDialog(
      title: "Thông báo",
      titleStyle:
          TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
      middleText: "Bạn cần đăng nhập để sử dụng chức năng này",
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Bạn cần đăng nhập để sử dụng chức năng này",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenWidth * 0.035),
          ),
          SizedBox(height: screenWidth * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0277BD)),
                ),
                child: Text(
                  "Để sau",
                  style: TextStyle(
                      color: Colors.blue, fontSize: screenWidth * 0.035),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  controller.navigateToLogin();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0277BD)),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.035),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Giữ lại các widget ItemMenu và ItemNhacViec
class ItemMenu extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback clickOn;

  const ItemMenu({
    super.key,
    required this.title,
    required this.imagePath,
    required this.clickOn,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: clickOn,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          border: Border.all(color: Colors.blueAccent, width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth * 0.035,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemNhacViec {
  final String key;
  final String tenNhacViec;
  final int indexNhacViec;
  final String imagePath;

  ItemNhacViec({
    required this.key,
    required this.tenNhacViec,
    required this.indexNhacViec,
    required this.imagePath,
  });

  factory ItemNhacViec.fromJson(Map<String, dynamic> json) {
    return ItemNhacViec(
      key: json['key'],
      tenNhacViec: json['tenNhacViec'],
      indexNhacViec: json['indexNhacViec'],
      imagePath: json['imagePath'],
    );
  }
}
