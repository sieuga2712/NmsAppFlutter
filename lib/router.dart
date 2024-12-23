import 'package:nms_app/global_widget/header_appbar.dart';
import 'package:nms_app/modules/controllers/danhsachchuongtrinh/danhsachchuongtrinh_binding.dart';
import 'package:nms_app/modules/views/chuongtrinh/danhsachchuongtrinh_view.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_binding.dart';
import 'package:nms_app/modules/views/trangchu/trangchu_view.dart';
import 'package:nms_app/modules/controllers/login/login_binding.dart';
import 'package:nms_app/modules/views/login/login_view.dart';
import 'package:get/get.dart';

class PageRouters {
  PageRouters._();

  static const INITIAL = Routers.LOGIN;
  static const Firstpage = Routers.LOGIN;
  static final routers = [
    GetPage(name: Paths.LOGIN, page: () => Login(), binding: LoginBinding()),
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
            body: DanhsachchuongtrinhView(),
            title: "Danh Sách Chương Trình",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINH),
        bindings: [DanhsachchuongtrinhBinding()]),
  ];
}

class Routers {
  Routers._();
  static const TRANGCHU = Paths.TRANGCHU;
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;
  static const DSCHUONGTRINH = Paths.DSCHUONGTRINH;
  static const DSBANTIN = Paths.DSBANTIN;
}

class Paths {
  Paths._();
  static const TRANGCHU = '/trangchu';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const DSCHUONGTRINH = '/dschuongtrinh';
  static const DSBANTIN = '/dsbantin';

  static const PHIEUDONG = '/phieudong';
}
