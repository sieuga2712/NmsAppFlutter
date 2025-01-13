import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/user/change_password_controller.dart';

class ChangePasswordTab extends GetView<ChangePasswordController> {
  final double buttonTopPadding;
  // ignore: use_super_parameters
  const ChangePasswordTab({Key? key, required this.buttonTopPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final formPadding = screenWidth * 0.04; // 4% padding for the form

    return Padding(
      padding: EdgeInsets.all(formPadding),
      child: Form(
        key: controller.formKey,
        child: Obx(
          () => Column(
            children: [
              TextFormField(
                controller: controller.currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu hiện tại',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu hiện tại';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth * 0.03),
              TextFormField(
                controller: controller.newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu mới',
                  prefixIcon: Icon(Icons.lock_reset_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu mới';
                  }
                  if (value.length < 6) {
                    return 'Mật khẩu phải có ít nhất 6 ký tự';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth * 0.03),
              TextFormField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Xác nhận mật khẩu mới',
                  prefixIcon: Icon(Icons.lock_reset_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng xác nhận mật khẩu mới';
                  }
                  if (value != controller.newPasswordController.text) {
                    return 'Mật khẩu không trùng khớp';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenWidth * 0.06),
              if (controller.errorMessage.value != null)
                Text(
                  controller.errorMessage.value!,
                  style: const TextStyle(color: Colors.red),
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
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.changePassword,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
