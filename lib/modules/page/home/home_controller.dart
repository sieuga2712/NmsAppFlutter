import 'dart:convert';

import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/core/ultis/full_screen_dialog_loader.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/login/login_model.dart';
import 'package:nms_app/modules/page/login/login_provider.dart';
import 'package:nms_app/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final loginProvider = LoginProvider();
  RxList<arrobjdonvi> dsChucVuKiemNhiem = <arrobjdonvi>[].obs;
  var storage = GetStorage();
  var selectDonVi = "".obs;
  void saveInfoAccount() async {
    selectDonVi.value = storage.read(GetStorageKey.donviId).toString();
  }

  void dskiemnhiem() {
    String Arrdskn = storage.read(GetStorageKey.dskiemnhiem);
    List<dynamic> jsonList = jsonDecode(Arrdskn);
    List<arrobjdonvi> donviList =
        jsonList.map((json) => arrobjdonvi.fromJson(json)).toList();
    dsChucVuKiemNhiem = donviList.obs;
  }

  void changeDonViKiemNhiem(String maDv) {
    // ignore: invalid_use_of_protected_member

    arrobjdonvi itemDV = dsChucVuKiemNhiem.value
        .where((element) => element.donvi_id!.toInt().toString() == maDv)
        .first;

    Get.defaultDialog(
      title: "Thông báo",
      middleText: "Bạn muốn đổi kiêm nhiệm sang ${itemDV.ten_dv}",
      textCancel: "Đóng",
      textConfirm: "Ok!",
      confirmTextColor: Colors.white,
      onConfirm: () {
        selectDonVi.value = maDv;

        onPressChangeDV(itemDV);
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void onPressChangeDV(arrobjdonvi item) async {
    storage.write(GetStorageKey.donviId, item.donvi_id!);
    Get.offAllNamed(Routers.LOGIN, arguments: {"loaiDangNhap": "doikiemnhiem"});
    Get.delete();
  }

  @override
  void onInit() {
    super.onInit();
    dskiemnhiem();
    saveInfoAccount();
  }
}
