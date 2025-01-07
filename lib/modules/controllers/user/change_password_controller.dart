// controllers/user/change_password_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/provider/user/user_provider.dart';

class ChangePasswordController extends GetxController {
  final UserProvider _userProvider;
  final _store = GetStorage();
  final formKey = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = RxnString();

  ChangePasswordController(this._userProvider);

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = null;

      final accessToken = _store.read('access_token');
      if (accessToken == null) {
        errorMessage.value = 'Không tìm thấy token xác thực.';
        isLoading.value = false;
        return;
      }

      final payload = {
        "currentPassword": currentPasswordController.text,
        "newPassword": newPasswordController.text,
      };

      try {
        await _userProvider.changePassword(accessToken, payload);
        CustomSnackBar.showSuccessSnackBar(
          context: Get.context,
          title: 'Thông báo',
          message: 'Đổi mật khẩu thành công!',
        );
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
      } catch (e) {
        errorMessage.value = 'Đổi mật khẩu thất bại: $e';
      } finally {
        isLoading.value = false;
      }
    }
  }
}
