import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/core/ultis/full_screen_dialog_loader.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/provider/quan-ly-can-bo/can_bo.dart';
import 'package:nms_app/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final loginProvider = CanBoProvider();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxList<arrobjdonvi> dsChucVuKiemNhiem = <arrobjdonvi>[].obs;
  var storage = GetStorage();
  var username = '';
  var password = '';
  @override
  void onInit() async {
    super.onInit();
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? prefUserName = pref.getString(GetStorageKey.userName);
    String? prefPassWord = pref.getString(GetStorageKey.passWord);
    print(pref.getString(GetStorageKey.userName));
    if (pref.getString(GetStorageKey.userName) != "iOusername") {
      usernameController.text = prefUserName ?? "";
      passwordController.text = prefPassWord ?? "";
    }
    /*if (isLoaiDangNhan == 'doikiemnhiem') {
      autoLogin(storage.read(GetStorageKey.userName),
          storage.read(GetStorageKey.passWord)!, isLoaiDangNhan);
    } else {
      if (domainAPi != null && prefPassWord != null && prefUserName != null) {
        usernameController.text = prefUserName;
        passwordController.text = prefPassWord;
        isRememberLogin.value = true;
        autoLogin(prefUserName, prefPassWord, isLoaiDangNhan);
      } else {}
    }*/
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập tài khoản';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null;
  }

  void laythongtintaikhoan() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    try {
      FullScreenDialogLoader.showDialog();

      if (loginFormKey.currentState!.validate()) {
        loginFormKey.currentState!.save();
        await loginProvider.UserLogin(username, password).then((value) => {
              FullScreenDialogLoader.cancleDialog(),
              if (value.loginsuccess == true)
                {
                  FullScreenDialogLoader.cancleDialog(),
                  _pref.setString(GetStorageKey.userName, username),
                  _pref.setString(GetStorageKey.passWord, password),
                  storage.write(GetStorageKey.hoVaTen, value.tennhanvien ?? ''),
                  storage.write(GetStorageKey.nhomquyen, value.nhomquyen ?? ''),
                  storage.write(
                      GetStorageKey.manhanvien, value.manhanvien ?? ''),
                  storage.write(GetStorageKey.email, value.email ?? ''),
                  storage.write(
                      GetStorageKey.nhanvienid, value.nhanvienid ?? -1),
                  storage.write(
                      GetStorageKey.donviId, value.arrdv![0].donvi_id ?? -1),
                  storage.write(
                      GetStorageKey.tendonvi, value.arrdv![0].ten_dv ?? ''),
                  storage.write(
                      GetStorageKey.dskiemnhiem, jsonEncode(value.arrdv) ?? ''),
                  Get.offNamed(Paths.HOME)
                }
              else
                {
                  FullScreenDialogLoader.cancleDialog(),
                  CustomSnackBar.showWarningSnackBar(
                      context: Get.context,
                      title: "Thông báo",
                      message: "Đăng nhập thất bại"),
                },
            });
      }
    } catch (exception) {
      FullScreenDialogLoader.cancleDialog();
      CustomSnackBar.showWarningSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: exception.toString());
    }
  }
}
