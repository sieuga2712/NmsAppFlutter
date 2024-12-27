import 'package:nms_app/global_widget/header_appbar.dart';
import 'package:nms_app/modules/controllers/danhsachbantin/bantin_binding.dart';
import 'package:nms_app/modules/controllers/danhsachbantin/danhsach_bantin_controller.dart';
import 'package:nms_app/modules/controllers/danhsachchuongtrinh/chuongtrinh_binding.dart';
import 'package:nms_app/modules/controllers/user/user_binding.dart';
import 'package:nms_app/modules/views/bantin/chitiet_bantin_view.dart';
import 'package:nms_app/modules/views/bantin/danhsach_bantin_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/danhsach_chuongtrinh_view.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_binding.dart';
import 'package:nms_app/modules/views/trangchu/trangchu_view.dart';
import 'package:nms_app/modules/controllers/login/login_binding.dart';
import 'package:nms_app/modules/views/login/login_view.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/views/user/danh_ba.dart';

class PageRouters {
  PageRouters._();

  static const INITIAL = Routers.LOGIN;
  static const Firstpage = Routers.LOGIN;
  static final routers = [
    GetPage(
        name: Paths.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: Paths.TRANGCHU,
        page: () => HeaderAppbar(
            body: TrangchuView(),
            title: "Trang chủ",
            isDrawer: true,
            pathScreen: Paths.TRANGCHU),
        bindings: [TrangchuBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINH,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhView(),
            title: "Danh Sách Chương Trình",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINH),
        bindings: [DanhsachchuongtrinhBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINH,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhView(),
            title: "Chi tiết chương trình",
            isDrawer: true,
            pathScreen: Paths.CHITIETCHUONGTRINH),
        bindings: [ChitietchuongtrinhBinding()]),
    GetPage(
        name: Paths.DSBANTIN,
        page: () => HeaderAppbar(
            body: DanhsachBantinView(),
            title: "Danh sách bản tin",
            isDrawer: true,
            pathScreen: Paths.DSBANTIN),
        bindings: [DanhsachbantinBinding()]),
    GetPage(
      name: Paths.CHITIETBANTIN,
      page: () => HeaderAppbar(
        body: ChitietBantinView(),
        title: "Chi tiết bản tin",
        isDrawer: false,
        pathScreen: Paths.CHITIETBANTIN,
        onBackButtonPressed: () {
          Get.find<DanhsachBantinController>().loadDanhSachBanTin();
        },
      ),
      bindings: [ChitietbantinBinding()],
    ),
    GetPage(
        name: Paths.DANHBA,
        page: () => HeaderAppbar(
            body: DanhBaView(),
            title: "Danh bạ mẫu",
            isDrawer: true,
            pathScreen: Paths.DANHBA),
        bindings: [DanhBaBinding()]),
  ];
}

class Routers {
  Routers._();
  static const TRANGCHU = Paths.TRANGCHU;
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;
  static const DSCHUONGTRINH = Paths.DSCHUONGTRINH;
  static const CHITIETCHUONGTRINH = Paths.CHITIETCHUONGTRINH;
  static const CHITIETBANTIN = Paths.CHITIETBANTIN;
  static const DSBANTIN = Paths.DSBANTIN;
  static const DANHBA = Paths.DANHBA;
}

class Paths {
  Paths._();
  static const TRANGCHU = '/trangchu';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const DSCHUONGTRINH = '/dschuongtrinh';
  static const CHITIETCHUONGTRINH = '/chitietchuongtrinh';
  static const DSBANTIN = '/dsbantin';
  static const CHITIETBANTIN = '/chitietbantin';

  static const PHIEUDONG = '/phieudong';
  static const DANHBA = '/danhba';
}
