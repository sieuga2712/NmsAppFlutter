import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: controller.obx(
            (user) => _buildUserProfile(user),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error) => Center(child: Text('Đã xảy ra lỗi: $error')),
            onEmpty: const Center(child: Text('Không có thông tin người dùng')),
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile(UserModel? user) {
    if (user == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(user),
      ],
    );
  }

  Widget _buildHeader(UserModel user) {
    const primaryColor = Color(0xFF42A5F5);
    const secondaryColor = Color.fromARGB(255, 218, 223, 226);

    return DefaultTabController(
      length: 2,
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
              labelPadding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text(
                    'Thông tin người dùng',
                    style: TextStyle(fontSize: 12.7),
                  ),
                ),
                Tab(
                  child: Text(
                    'Đổi mật khẩu',
                    style: TextStyle(fontSize: 12.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: secondaryColor.withOpacity(0.2),
            ),
            child: SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: TabBarView(
                  children: [
                    _buildThongTinNguoiDungTab(user),
                    ChangePasswordTab(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThongTinNguoiDungTab(UserModel user) {
    final usernameController = TextEditingController(text: user.userName);
    final nameController = TextEditingController(text: user.name ?? '');
    final surnameController = TextEditingController(text: user.surname ?? '');
    final emailController = TextEditingController(text: user.email ?? '');
    final phoneController = TextEditingController(text: user.phoneNumber ?? '');
    final concurrencyStamp = user.concurrencyStamp ?? '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: 'Tên đăng nhập'),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(labelText: 'Họ'),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(labelText: 'Số điện thoại'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.edit,
                  size: 15,
                  color: Colors.blue,
                ),
                label: const Text(
                  'Cập nhật',
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
                onPressed: () {
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
