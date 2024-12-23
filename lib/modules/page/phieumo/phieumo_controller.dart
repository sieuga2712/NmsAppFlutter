import 'dart:convert';

import 'package:cskhpto/core/values/get_storage_key.dart';
import 'package:cskhpto/modules/page/phieumo/phieumo_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PhieumoController extends GetxController {
  var storage = GetStorage();
  var choicebutton = "chuaxuly".obs;
  @override
  void onInit() {
    super.onInit();
  }
}
