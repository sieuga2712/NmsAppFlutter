import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/welcomescreen/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              // Loại bỏ hành động chuyển hướng khi bấm avatar
              onTap: () => controller.navigateToLogin(),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.lightBlueAccent.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipOval(
                    child: Image.asset("images/user.png", fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Đăng nhập',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _buildLoginButton(
                    context,
                    'Chương trình đang SX',
                    "images/2.png",
                    () => _showLoginDialog(context),
                  ),
                  _buildLoginButton(
                    context,
                    'Chờ phê duyệt KB',
                    "images/2.png",
                    () => _showLoginDialog(context),
                  ),
                  _buildLoginButton(
                    context,
                    'Chờ duyệt tin bài',
                    "images/3.png",
                    () => _showLoginDialog(context),
                  ),
                  _buildLoginButton(
                    context,
                    'Chờ duyệt Video',
                    "images/4.png",
                    () => _showLoginDialog(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String text, String imagePath,
      VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blueAccent, width: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  "Thông báo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Bạn cần đăng nhập để sử dụng chức năng này",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.blue),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("Để sau",
                          style: TextStyle(color: Colors.blue)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // Loại bỏ hành động chuyển hướng khi bấm nút đăng nhập trong dialog
                        Get.find<WelcomeScreenController>().navigateToLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text("Đăng nhập",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
