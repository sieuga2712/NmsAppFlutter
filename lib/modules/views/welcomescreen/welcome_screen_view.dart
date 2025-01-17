import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/welcomescreen/welcome_screen_controller.dart';
import 'package:nms_app/router.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  final valueItemBL = <ItemNhacViec>[].obs;

  // ignore: use_super_parameters
  WelcomeScreenView({Key? key}) : super(key: key);

  String getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? 'phone' : 'tablet';
  }

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        _showHelpDialog(Get.context!);
        break;
      case 2:
        Get.toNamed(Paths.LOGIN);
        break;
      case 3:
        _showContactInfoDialog(Get.context!);
        break;
      case 4:
        _showCompanyInfoDialog(Get.context!);
        break;
    }
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
      appBar: AppBar(
        title: null,
        backgroundColor: const Color(0xFF0277BD),
        flexibleSpace: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.04),
            child: Text(
              'NMS App',
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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
                    height: screenHeight * 0.5,
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_enabled),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Info',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0277BD),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Get.dialog(
      AlertDialog(
        title: const Text('Hướng dẫn sử dụng',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('1. Nhấn vào biểu tượng tài khoản ở trên để đăng nhập.',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('2. Sử dụng các mục bên dưới để quản lý công việc.',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('3. Chọn "Liên hệ" để được hỗ trợ',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('4. Chọn "Thông tin" để xem thông tin ứng dụng',
                  style: TextStyle(fontSize: screenWidth * 0.035))
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Đóng',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0277BD),
                    fontSize: screenWidth * 0.035)),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _showContactInfoDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Get.dialog(
      AlertDialog(
        title: const Text('Thông tin liên hệ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Điện thoại: (0210) 3.900.900',
                style: TextStyle(fontSize: screenWidth * 0.035),
              ),
              SizedBox(height: screenWidth * 0.02),
              Text('Fax: (0210) 3847678',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Email: vinaphone.pto@vnpt.vn ; phutho@vnpt.vn',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Zalo page (OA): http://zalo.me/1413532271000575027',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Đóng',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0277BD),
                    fontSize: screenWidth * 0.035)),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _showCompanyInfoDialog(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Thông tin ứng dụng',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Tên đầy đủ: NMS App',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Tên công ty: VNPT Phú Thọ',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Tên giao dịch Quốc tế: VNPT PhuTho',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Giám đốc: Th.s Đặng Việt Hải',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text(
                  'Trụ sở chính: 1468 Đường Hùng Vương - Phường Tiên Cát - TP Việt Trì - Tỉnh Phú Thọ',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Website: http://phutho.vnpt.vn/',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
              SizedBox(height: screenWidth * 0.02),
              Text('Fanpage Facebook: www.facebook.com/phutho.vnpt.vn',
                  style: TextStyle(fontSize: screenWidth * 0.035)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Đóng',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0277BD),
                  fontSize: screenWidth * 0.035),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
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
