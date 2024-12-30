import 'package:nms_app/global_widget/header_appbar.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/bantinchoduyettinbai_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/danhsach_bantinchoduyettinbai_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/danhsachchuongtrinhchopd/chuongtrinhchopd_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/bantin_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/danhsach_bantinchopheduyetvideo_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/danhsachchuongtrinh/chuongtrinh_binding.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/danhsachchuongtrinh/danhsach_chuongtrinh_controller.dart';
import 'package:nms_app/modules/controllers/user/user_binding.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyettinbai/chitiet_bantinchoduyettinbai_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyettinbai/danhsach_bantinchoduyettinbai_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyetvideo/chitiet_bantin_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyetvideo/danhsach_bantin_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhchopheduyetkb/chitiet_chuongtrinhchopheduyetkb_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhchopheduyetkb/danhsach_chuongtrinhchopheduyetkb_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdapheduyetkb/chitiet_chuongtrinh_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdapheduyetkb/danhsach_chuongtrinh_view.dart';
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
            title: "Chương Trình Đã Phê Duyệt KB",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINH),
        bindings: [DanhsachchuongtrinhBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINH,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhView(),
              title: "Chi tiết chương trình",
              isDrawer: true,
              pathScreen: Paths.CHITIETCHUONGTRINH,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhController>()
                    .loadDanhSachChuongTrinh();
              },
            ),
        bindings: [ChitietchuongtrinhBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINHCHOPHEDUYET,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhChopheduyetkbView(),
            title: "Chương Trình Chờ Phê Duyệt KB",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINHCHOPHEDUYET),
        bindings: [DanhsachchuongtrinhchopheduyetBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINHCHOPHEDUYET,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhChoPheDuyetKBView(),
              title: "Chi tiết chương trình",
              isDrawer: true,
              pathScreen: Paths.CHITIETCHUONGTRINHCHOPHEDUYET,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhController>()
                    .loadDanhSachChuongTrinh();
              },
            ),
        bindings: [ChitietchuongtrinhchopheduyetBinding()]),
    GetPage(
        name: Paths.DSBANTIN,
        page: () => HeaderAppbar(
            body: DanhsachBantinView(),
            title: "Bản tin chờ duyệt Video",
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
                Get.find<DanhsachBantinchopheduyetvideoController>()
                    .loadDanhSachBanTin();
              },
            ),
        bindings: [ChitietbantinBinding()]),
    GetPage(
        name: Paths.DSBANTINCHODUYETTIN,
        page: () => HeaderAppbar(
            body: DanhsachBantinChoDuyetTinBaiView(),
            title: "Bản tin chờ duyệt tin bài",
            isDrawer: true,
            pathScreen: Paths.DSBANTIN),
        bindings: [DanhsachBantinChoduyetTinbaiBinding()]),
    GetPage(
        name: Paths.CHITIETBANTINCHODUYETTIN,
        page: () => HeaderAppbar(
              body: ChitietBantinChoDuyetTinBaiView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTINCHODUYETTIN,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinChoduyetTinbaiController>()
                    .loadDanhSachBantinChoduyetTinbai();
              },
            ),
        bindings: [ChitietBantinChoduyetTinbaiBinding()]),
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

  static const DSCHUONGTRINHCHOPHEDUYET = Paths.DSCHUONGTRINHCHOPHEDUYET;
  static const CHITIETCHUONGTRINHCHOPHEDUYET =
      Paths.CHITIETCHUONGTRINHCHOPHEDUYET;

  static const CHITIETBANTIN = Paths.CHITIETBANTIN;
  static const DSBANTIN = Paths.DSBANTIN;

  static const DSBANTINCHODUYETTIN = Paths.DSBANTINCHODUYETTIN;
  static const CHITIETBANTINCHODUYETTIN = Paths.CHITIETBANTINCHODUYETTIN;

  static const DANHBA = Paths.DANHBA;
}

class Paths {
  Paths._();
  static const TRANGCHU = '/trangchu';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';

  static const DSCHUONGTRINH = '/dschuongtrinh';
  static const CHITIETCHUONGTRINH = '/chitietchuongtrinh';

  static const DSCHUONGTRINHCHOPHEDUYET = "/dschuongtrinhchopheduyet";
  static const CHITIETCHUONGTRINHCHOPHEDUYET = "/chitietchuongtrinhchopheduyet";

  static const DSBANTIN = '/dsbantin';
  static const CHITIETBANTIN = '/chitietbantin';

  static const DSBANTINCHODUYETTIN = '/dsbantinchoduyettin';
  static const CHITIETBANTINCHODUYETTIN = '/chitietbantinchoduyettin';

  static const PHIEUDONG = '/phieudong';
  static const DANHBA = '/danhba';
}
