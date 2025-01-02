import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nms_app/model/user/thong_tin_user_model.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:nms_app/provider/user/user_provider.dart';

class UserProfileController extends GetxController with StateMixin<UserModel> {
  final UserProvider _userProvider;
  final log = Logger();

  UserProfileController(this._userProvider);

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      change(null, status: RxStatus.loading());

      final loginController = Get.find<LoginController>();
      final accessToken = loginController.loginModel.value.accessToken;

      // ignore: unnecessary_null_comparison
      if (accessToken == null || accessToken.isEmpty) {
        change(null, status: RxStatus.error('Access token not found'));
        return;
      }

      final userData = await _userProvider.getUserProfile(accessToken);
      change(userData, status: RxStatus.success());
    } catch (e) {
      log.e('Error fetching user profile', error: e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String userName,
    String? name,
    String? surname,
    String? email,
    String? phoneNumber,
    String? concurrencyStamp,
  }) async {
    try {
      final loginController = Get.find<LoginController>();
      final accessToken = loginController.loginModel.value.accessToken;

      // ignore: unnecessary_null_comparison
      if (accessToken == null || accessToken.isEmpty) {
        Get.snackbar('Lỗi', 'Không tìm thấy access token',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      change(value, status: RxStatus.loading());

      Map<String, dynamic> userData = {
        'userName': userName,
        'email': email ?? '',
        'name': name ?? '',
        'surname': surname ?? '',
        'phoneNumber': phoneNumber ?? '',
        'concurrencyStamp': concurrencyStamp ?? '',
      };

      await _userProvider.updateUserProfile(accessToken, userData);
      await fetchUserProfile();

      Get.snackbar('Thành công', 'Cập nhật thông tin thành công',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      log.e('Error updating user profile', error: e);
      change(value, status: RxStatus.error(e.toString()));
      Get.snackbar('Lỗi', 'Cập nhật thông tin thất bại: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
