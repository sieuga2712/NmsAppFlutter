import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/provider/trangchu/trangchu_provider.dart';
import 'package:nms_app/provider/fcmtoken/fcm_provider.dart';

class TrangchuController extends GetxController
    with StateMixin<List<TrangchuModel?>> {
  final trangChuProvider = TrangChuProvider();
  final FcmTokenProvider _fcmTokenProvider = FcmTokenProvider();

  var storage = GetStorage();
  var selectDonVi = "".obs;
  var dataList = <TrangchuModel?>[].obs;
  var isLoading = true.obs;

  void saveInfoAccount() async {
    selectDonVi.value = storage.read(GetStorageKey.donviId)?.toString() ?? "";
  }

  void getTrangChu() async {
    change(null, status: RxStatus.loading());
    try {
      isLoading(true);
      await trangChuProvider.getTrangChu().then((response) {
        dataList.clear();
        dataList.addAll(response);

        change(dataList, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      isLoading(false);
    }
  }

  void getFirebaseToken() async {
    String? fcmToken;
    if (Platform.isIOS) {
      // On iOS we need to see an APN token is available first

      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      int maxGetToken = 0;
      while (apnsToken == null && maxGetToken <= 10) {
        await Future<void>.delayed(const Duration(
          seconds: 2,
        ));
        apnsToken = await FirebaseMessaging.instance.getAPNSToken();
        maxGetToken++;
      }
      fcmToken = await FirebaseMessaging.instance.getToken();
    } else {
      // android platform
      fcmToken = await FirebaseMessaging.instance.getToken();
    }
    saveTokenFCM(fcmToken ?? "");
  }

  void onRefreshTokenFCM() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fmcToken) {
      saveTokenFCM(fmcToken);
      // storage.write(GetStorageKey.accessTokenFCM, fmcToken);
    });
  }

  void saveTokenFCM(String token) async {
    // ignore: avoid_print
    // print(token);
    // ignore: avoid_print
    await _fcmTokenProvider.saveFcmToken(token);
  }

  @override
  void onInit() {
    super.onInit();
    saveInfoAccount();
    getTrangChu();
    getFirebaseToken();
  }
}
