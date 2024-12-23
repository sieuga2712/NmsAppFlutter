import 'dart:convert';
import 'dart:ffi';

import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/ultis/dsdoituong.dart';
import 'package:nms_app/model/ultis/dsnguyennhan.dart';
import 'package:nms_app/model/ultis/thuebaohong.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/provider/quan-ly-tin-bai/ban_tin_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhieumoController extends GetxController
    with StateMixin<List<thuebaohong>> {
  final bantinprovider = BanTinProvider();
  var storage = GetStorage();
  var choicebutton = "chuaxuly".obs;
  List<Dsnguyennhan> dsnguyennhan = <Dsnguyennhan>[].obs;
  List<Dsdoituong> dsdoituong = <Dsdoituong>[].obs;
  List<thuebaohong> dsthuebaofull = <thuebaohong>[].obs;
  List<thuebaohong> dsthuebao = <thuebaohong>[].obs;
  List<thuebaohong> dsthuetam = <thuebaohong>[].obs;

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
    GetDsnguyennhan();
    GetDsDoiTuong();
    getdsbaohong();
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
    getdsbaohong();
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
    if ((page + 1) * 20 > dsthuetam.length) {
      for (int i = page * 20; i < dsthuetam.length; i++) {
        dsthuebao.add(dsthuetam[i]);
      }
    } else {
      for (int i = page * 20; i < (page + 1) * 20; i++) {
        dsthuebao.add(dsthuetam[i]);
      }
    }
    change(dsthuebao, status: RxStatus.success());
  }

  void loadmoredata() {
    scrollerControllerChuaXuLy.removeListener(_scrollListenerhuaXuLy);
    loadMoreds();
  }

  void filterSearchResults(String search) {
    page = 0;
    if (search == "") {
      dsthuebao.clear();
      dsthuetam = dsthuebaofull;
      getMoreds();
    } else {
      dsthuebao.clear();
      dsthuetam = dsthuebaofull
          .where((item) =>
              sosanhten(item.ten_tb ?? "", search) ||
              sosanhten(item.ma_tb ?? "", search))
          .toList();
      getMoreds();
    }
  }

  bool sosanhten(String char1, String char2) {
    if (char1.toUpperCase().indexOf(char2.toUpperCase()) > -1) {
      return true;
    }
    return false;
  }

  void _scrollListenerhuaXuLy() async {
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

  void getdsbaohong() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    isloading.value = true;
    String userName = pref.getString(GetStorageKey.userName)!;
    String passWord = pref.getString(GetStorageKey.passWord)!;
    int trangthaixl = Trangthaixl;
    int ttphieu = 0;
    String maNV = pref.getString(GetStorageKey.manhanvien)!;
    int nhomquyen = pref.getInt(GetStorageKey.nhomquyen)!;
    int donvi = pref.getInt(GetStorageKey.donviId)!;
    int loaidttb = NNDuocChon;
    int loaikh = DTDuocChon;

    change(null, status: RxStatus.loading());
    try {
      bantinprovider
          .dsBaoHong(userName, passWord, trangthaixl, ttphieu, maNV, nhomquyen,
              donvi, loaidttb, loaikh)
          .then((value) {
        isloading.value = false;
        dsthuebaofull.clear();
        dsthuebao.clear();
        value.forEach((e) {
          dsthuebaofull.add(e);
        });
        dsthuetam = dsthuebaofull;
        maxpage = (value.length / 20).toInt();
        if (maxpage * 20 < value.length) maxpage++;
        getMoreds();
      });
    } catch (e) {
      isloading.value = false;
      print('lỗi: $e');
    }
  }

  void GetDsnguyennhan() async {
    await bantinprovider.dsnguyennhan().then((value) {
      Dsnguyennhan tatca = Dsnguyennhan();
      tatca.nn_id = -1;
      tatca.ten_nn = "Nguyên nhân: Tất cả";
      NNDuocChon = -1;
      dsnguyennhan.add(tatca);
      value.forEach((e) {
        e.ten_nn = "Nguyên nhân: " + e.ten_nn.toString();
        dsnguyennhan.add(e);
      });
    });
  }

  void GetDsDoiTuong() async {
    await bantinprovider.dsdoituong().then((value) {
      Dsdoituong tatca = Dsdoituong();
      tatca.loai_kh_id = -1;
      tatca.ten_loai_kh_id = "Đối tượng: Tất cả";
      tatca.mau_sms = "null";

      DTDuocChon = -1;
      dsdoituong.add(tatca);
      value.forEach((e) {
        e.ten_loai_kh_id = "Đối tượng: " + e.ten_loai_kh_id.toString();
        dsdoituong.add(e);
      });
    });
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
