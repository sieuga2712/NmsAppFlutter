import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/model/user/thong_tin_user_model.dart';
import 'package:nms_app/modules/controllers/user/user_controller.dart';
import 'package:nms_app/modules/views/user/change_password_view.dart';

class UserProfileView extends GetView<UserProfileController> {
  // ignore: use_super_parameters
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: controller.obx(
          (user) => _buildUserProfile(user),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Center(child: Text('Đã xảy ra lỗi: $error')),
          onEmpty: const Center(child: Text('Không có thông tin người dùng')),
        ),
      ),
    );
  }

  Widget _buildUserProfile(UserModel? user) {
    if (user == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildHeader(user),
        ),
      ],
    );
  }

  Widget _buildHeader(UserModel user) {
    const primaryColor = Color(0xFF42A5F5);
    const secondaryColor = Color.fromARGB(255, 218, 223, 226);

    return DefaultTabController(
      length: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final tabBarTopPadding =
              screenWidth * 0.03; // 3% top padding for tab bar
          final tabBarHorizontalPadding =
              screenWidth * 0.05; // 5% padding cho các tab ngang
          final tabBarVerticalPadding =
              screenWidth * 0.02; // 2% padding cho các tab dọc
          final buttonTopPadding =
              screenWidth * 0.08; // 8% top padding for the update button
          final formPadding = screenWidth * 0.04; // 4% padding for the form

          return Padding(
            padding: EdgeInsets.only(top: tabBarTopPadding),
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  child: TabBar(
                    isScrollable: false,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey[700],
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: tabBarHorizontalPadding,
                              vertical: tabBarVerticalPadding),
                          child: const Text(
                            'Thông tin người dùng',
                            style: TextStyle(fontSize: 12.7),
                          ),
                        ),
                      ),
                      Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: tabBarHorizontalPadding,
                              vertical: tabBarVerticalPadding),
                          child: const Text(
                            'Đổi mật khẩu',
                            style: TextStyle(fontSize: 12.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth * 0.05),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: secondaryColor.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(formPadding),
                      child: TabBarView(
                        children: [
                          _buildThongTinNguoiDungTab(user, buttonTopPadding),
                          ChangePasswordTab(buttonTopPadding: buttonTopPadding),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildThongTinNguoiDungTab(UserModel user, double buttonTopPadding) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final usernameController = TextEditingController(text: user.userName);
    final nameController = TextEditingController(text: user.name ?? '');
    final surnameController = TextEditingController(text: user.surname ?? '');
    final emailController = TextEditingController(text: user.email ?? '');
    final phoneController = TextEditingController(text: user.phoneNumber ?? '');
    final concurrencyStamp = user.concurrencyStamp ?? '';

    final originalValues = {
      'name': user.name ?? '',
      'surname': user.surname ?? '',
      'email': user.email ?? '',
      'phoneNumber': user.phoneNumber ?? '',
    };

    return SingleChildScrollView(
      padding: EdgeInsets.all(screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.03),
          TextFormField(
            controller: usernameController,
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Tên đăng nhập',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Tên',
                    prefixIcon: Icon(Icons.text_fields),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: TextFormField(
                  controller: surnameController,
                  enabled: false,
                  decoration: const InputDecoration(
                    labelText: 'Họ',
                    prefixIcon: Icon(Icons.text_fields),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.03),
          TextFormField(
            controller: emailController,
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
          TextFormField(
            controller: phoneController,
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'Số điện thoại',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: buttonTopPadding),
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.white,
                ),
                label: const Text(
                  'Cập nhật',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenWidth * 0.03),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  final currentValues = {
                    'name': nameController.text,
                    'surname': surnameController.text,
                    'email': emailController.text,
                    'phoneNumber': phoneController.text,
                  };

                  if (mapEquals(originalValues, currentValues)) {
                    CustomSnackBar.showWarningSnackBar(
                      context: Get.context,
                      title: 'Thông báo',
                      message: 'Bạn chưa thay đổi thông tin nào!',
                    );
                    return;
                  }

                  controller.updateProfile(
                    userName: user.userName ?? '',
                    name: nameController.text,
                    surname: surnameController.text,
                    email: emailController.text,
                    phoneNumber: phoneController.text,
                    concurrencyStamp: concurrencyStamp,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
