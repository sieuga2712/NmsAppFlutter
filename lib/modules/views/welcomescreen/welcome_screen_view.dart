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
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    if (getDeviceType() == 'tablet' && data.size.width > data.size.height) {
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
        backgroundColor: Color(0xFF0277BD),
        flexibleSpace: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'NMS App',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => controller.navigateToLogin(),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.lightBlueAccent,
                child: const Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Color.fromARGB(255, 105, 105, 105),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Login Text
            const Text(
              'Đăng nhập',
              style: TextStyle(fontSize: 22, color: Color(0xFF0277BD)),
            ),

            const SizedBox(height: 24),

            // Grid Menu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: OrientationBuilder(builder: (context, orientation) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Obx(() {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                      childAspectRatio: tile,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      physics: const NeverScrollableScrollPhysics(),
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
        backgroundColor: Color(0xFF0277BD),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Hướng dẫn sử dụng',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('1. Nhấn vào biểu tượng tài khoản ở trên để đăng nhập.'),
              SizedBox(height: 8),
              Text('2. Sử dụng các mục bên dưới để quản lý công việc.'),
              SizedBox(height: 8),
              Text('3. Chọn "Liên hệ" để được hỗ trợ'),
              SizedBox(height: 8),
              Text('4. Chọn "Thông tin" để xem thông tin ứng dụng')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Đóng',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF0277BD))),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _showContactInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text('Thông tin liên hệ',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                'Điện thoại: (0210) 3.900.900',
              ),
              SizedBox(height: 8),
              Text('Fax: (0210) 3847678'),
              SizedBox(height: 8),
              Text('Email: vinaphone.pto@vnpt.vn ; phutho@vnpt.vn'),
              SizedBox(height: 8),
              Text('Zalo page (OA): http://zalo.me/1413532271000575027'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Đóng',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF0277BD))),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void _showCompanyInfoDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Thông tin ứng dụng',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Tên đầy đủ: NMS App',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Tên công ty: VNPT Phú Thọ'),
              SizedBox(height: 8),
              Text('Tên giao dịch Quốc tế: VNPT PhuTho'),
              SizedBox(height: 8),
              Text('Giám đốc: Th.s Đặng Việt Hải'),
              SizedBox(height: 8),
              Text(
                  'Trụ sở chính: 1468 Đường Hùng Vương - Phường Tiên Cát - TP Việt Trì - Tỉnh Phú Thọ'),
              SizedBox(height: 8),
              Text('Website: http://phutho.vnpt.vn/'),
              SizedBox(height: 8),
              Text('Fanpage Facebook: www.facebook.com/phutho.vnpt.vn'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Đóng',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF0277BD)),
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
    Get.defaultDialog(
      title: "Thông báo",
      titleStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      middleText: "Bạn cần đăng nhập để sử dụng chức năng này",
      radius: 10,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Bạn cần đăng nhập để sử dụng chức năng này",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0277BD)),
                ),
                child: const Text(
                  "Để sau",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  controller.navigateToLogin();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0277BD)),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(color: Colors.white),
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
    return InkWell(
      onTap: clickOn,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blueAccent, width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
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
