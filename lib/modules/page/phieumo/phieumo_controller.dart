import 'dart:convert';
import 'dart:ffi';

import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/ultis/dsdoituong.dart';
import 'package:nms_app/model/ultis/dsnguyennhan.dart';
import 'package:nms_app/model/ultis/thuebaohong.dart';
import 'package:nms_app/modules/page/login/login_provider.dart';
import 'package:nms_app/modules/page/phieumo/phieumo_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhieumoController extends GetxController {
  var storage = GetStorage();
  var choicebutton = "chuaxuly".obs;
  var loginProvider = LoginProvider();
  List<Dsnguyennhan> dsnguyennhan = <Dsnguyennhan>[].obs;
  List<Dsdoituong> dsdoituong = <Dsdoituong>[].obs;
  List<thuebaohong> dsthuebaofull = <thuebaohong>[].obs;
  List<thuebaohong> dsthuebao = <thuebaohong>[].obs;

  int NNDuocChon = -1;
  int DTDuocChon = -1;
  int Trangthaixl = 0;
  ScrollController scrollerControllerChuaXuLy = ScrollController();
  ScrollController scrollerControllerDaXuLy = ScrollController();

  RxBool isloading = true.obs;
  int page = 0;
  int maxpage = 1;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loaddata();
  }

  @override
  void onClose() {
    super.onClose();
    scrollerControllerChuaXuLy.dispose();
    scrollerControllerDaXuLy.dispose();
  }

  void loaddata() {
    loadMoreds();
  }

  @override
  void dispose() {
    scrollerControllerChuaXuLy.removeListener(_scrollListenerhuaXuLy);
    scrollerControllerChuaXuLy.dispose();

    scrollerControllerDaXuLy.removeListener(_scrollerControllerDaXuLy);
    scrollerControllerDaXuLy.dispose();

    super.dispose();
  }

  void loadMoreds() {
    try {
      scrollerControllerChuaXuLy.addListener(_scrollListenerhuaXuLy);
      // ignore: empty_catches
    } catch (exception) {}
  }

  void getMoreds() {
    if ((page + 1) * 20 > dsthuebaofull.length)
      for (int i = page * 20; i < dsthuebaofull.length; i++) {
        dsthuebao.add(dsthuebaofull[i]);
      }
    else {
      for (int i = page * 20; i < (page + 1) * 20; i++) {
        dsthuebao.add(dsthuebaofull[i]);
      }
    }
  }

  void loadmoredata() {
    scrollerControllerChuaXuLy.removeListener(_scrollListenerhuaXuLy);
    loadMoreds();
  }

  void _scrollListenerhuaXuLy() {
    if (scrollerControllerChuaXuLy.position.maxScrollExtent ==
        scrollerControllerChuaXuLy.position.pixels) {
      if (page <= maxpage) {
        page++;
        getMoreds();
      }
    }
  }

  void _scrollerControllerDaXuLy() {
    if (scrollerControllerDaXuLy.position.maxScrollExtent ==
        scrollerControllerDaXuLy.position.pixels) {
      if (page <= maxpage) {
        page++;
        getMoreds();
      }
    }
  }

  void ChonTrangThaiXuLy(int trangthai) {
    if (Trangthaixl != trangthai) {
      page = 0;

      NNDuocChon = -1;
      DTDuocChon = -1;
      if (trangthai == 1) {
        choicebutton.value = "daxuly";
        Trangthaixl = 1;
      } else {
        choicebutton.value = "chuaxuly";
        Trangthaixl = 0;
      }
      loaddata();
    }
  }

  void ChangeNguyenNhan(String idNn) {
    page = 0;
    NNDuocChon = int.parse(idNn);
    loaddata();
  }

  void ChangeDoiTuong(String ten_loai_kh_id) {
    DTDuocChon = int.parse(ten_loai_kh_id);
    page = 0;
    loaddata();
  }
}
