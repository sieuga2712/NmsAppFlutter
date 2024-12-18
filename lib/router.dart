import 'dart:ui';

import 'package:nms_app/global_widget/header_appbar.dart';
import 'package:nms_app/modules/page/home/home_binding.dart';
import 'package:nms_app/modules/page/home/home_view.dart';
import 'package:nms_app/modules/page/login/login_binding.dart';
import 'package:nms_app/modules/page/login/login_view.dart';
import 'package:get/get.dart';

class PageRouters {
  PageRouters._();

  static const INITIAL = Routers.LOGIN;
  static const Firstpage = Routers.LOGIN;
  static final routers = [
    GetPage(name: Paths.LOGIN, page: () => Login("",""), binding: LoginBinding()),
    GetPage(
        name: Paths.HOME,
        page: () => HeaderAppbar(
            body: HomeView(),
            title: "Loading...",
            isDrawer: true,
            pathScreen: Paths.HOME),
        bindings: [HomeBinding()]),
   
  ];
}

class Routers {
  Routers._();
  static const HOME = Paths.HOME;
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;

  static const PHIEUDONG = Paths.PHIEUDONG;
  static const PHIEUMO = Paths.PHIEUMO;
  static const TRACUUONT = Paths.TRACUUONT;
  static const TRACUUTHUEBAO = Paths.TRACUUTHUEBAO;

  static const DETAILPHIEU = Paths.DETAILPHIEU;
  static const THUEBAOGIAHAN = Paths.THUEBAOGIAHAN;
  static const CAPNHATPHIEU = Paths.CAPNHATPHIEU;
  static const CHUYENTOKYTHUAT = Paths.CHUYENTOKYTHUAT;
  static const CHUYENXULY = Paths.CHUYENXULY;
}

class Paths {
  Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';

  static const PHIEUDONG = '/phieudong';
  static const PHIEUMO = '/phieumo';
  static const TRACUUONT = '/tracuuont';
  static const TRACUUTHUEBAO = '/tracuuthuebao';

  static const DETAILPHIEU = '/detailphieu';
  static const THUEBAOGIAHAN = '/thuebaogiahgan';
  static const CAPNHATPHIEU = '/capnhatphieu';
  static const CHUYENTOKYTHUAT = '/chuyentokythuat';
  static const CHUYENXULY = '/chuyenxuly';
}
