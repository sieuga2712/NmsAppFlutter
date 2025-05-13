import 'package:nms_app/core/values/app_images.dart';
import 'package:nms_app/global_widget/header_appbar.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/bantinchoduyettinbai_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/danhsach_bantinchoduyettinbai_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindangsanxuat/bantindangsanxuat_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindangsanxuat/danhsach_bantindangsanxuat_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindaxuatban/bantindaxuatban_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindaxuatban/danhsach_bantindaxuatban_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyettin/bantinkhongduyettin_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyettin/danhsach_bantinkhongduyettin_controller.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyetvideo/bantinkhongduyetvideo_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinkhongduyetvideo/danhsach_bantinkhongduyetvideo_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhchoduyet/chuongtrinhchopd_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/danhsach_bantinchopheduyetvideo_binding.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyetvideo/danhsach_bantinchopheduyetvideo_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/chuongtrinh_binding.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/danhsach_chuongtrinh_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhchoduyet/danhsach_chuongtrinhchopd_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhdaxuatban/chuongtrinhdaxuatban_binding.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhdaxuatban/danhsach_chuongtrinhdaxuatban_controller.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhkhongduyetkb/chuongtrinhkhongduyetkb_binding.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinhkhongduyetkb/danhsach_chuongtrinhkhongduyetkb_controller.dart';
import 'package:nms_app/modules/controllers/user/user_binding.dart';
import 'package:nms_app/modules/controllers/welcomescreen/welcome_screen_binding.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyettinbai/chitiet_bantinchoduyettinbai_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyettinbai/danhsach_bantinchoduyettinbai_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyetvideo/chitiet_bantinchoduyetvideo_view.dart';
import 'package:nms_app/modules/views/bantin/bantinchoduyetvideo/danhsach_bantinchoduyetvideo_view.dart';
import 'package:nms_app/modules/views/bantin/bantindangsanxuat/chitiet_bantindangsanxuat_view.dart';
import 'package:nms_app/modules/views/bantin/bantindangsanxuat/danhsach_bantindangsanxuat_view.dart';
import 'package:nms_app/modules/views/bantin/bantindaxuatban/chitiet_bantindaxuatban_view.dart';
import 'package:nms_app/modules/views/bantin/bantindaxuatban/danhsach_bantindaxuatban_view.dart';
import 'package:nms_app/modules/views/bantin/bantinkhongduyettin/chitiet_bantinkhongduyettin_view.dart';
import 'package:nms_app/modules/views/bantin/bantinkhongduyettin/danhsach_bantinkhongduyettin_view.dart';
import 'package:nms_app/modules/views/bantin/bantinkhongduyetvideo/chitiet_bantinkhongduyetvideo_view.dart';
import 'package:nms_app/modules/views/bantin/bantinkhongduyetvideo/danhsach_bantinkhongduyetvideo_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhchopheduyetkb/chitiet_chuongtrinhchopheduyetkb_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhchopheduyetkb/danhsach_chuongtrinhchopheduyetkb_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdangsoanthao/chitiet_chuongtrinh_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdangsoanthao/danhsach_chuongtrinh_view.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_binding.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdaxuatban/chitiet_chuongtrinhdaxuatban_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhdaxuatban/danhsach_chuongtrinhdaxuatban_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhkhongduyetkb/chitiet_chuongtrinhkhongduyetkb_view.dart';
import 'package:nms_app/modules/views/chuongtrinh/chuongtrinhkhongduyetkb/danhsach_chuongtrinhkhongduyetkb_view.dart';
import 'package:nms_app/modules/views/trangchu/trangchu_view.dart';
import 'package:nms_app/modules/controllers/login/login_binding.dart';
import 'package:nms_app/modules/views/login/login_view.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/views/user/user_view.dart';
import 'package:nms_app/modules/views/welcomescreen/gioithieu_view.dart';
import 'package:nms_app/modules/views/welcomescreen/huongdan_view.dart';
import 'package:nms_app/modules/views/welcomescreen/lienhe_view.dart';
import 'package:nms_app/modules/views/welcomescreen/welcome_screen_view.dart';

class PageRouters {
  PageRouters._();

  static const INITIAL = Routers.WELCOMESCREEN;
  static const Firstpage = Routers.LOGIN;
  static final routers = [
    GetPage(
        name: Paths.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: Paths.WELCOMESCREEN,
        page: () => HomeView(),
        bindings: [WelcomeScreenBinding()]),
    GetPage(name: Paths.GIOITHIEU, page: () => GioiThieuView()),
    GetPage(name: Paths.LIENHE, page: () => LienHeView()),
    GetPage(name: Paths.HUONGDAN, page: () => HuongDanView()),
    GetPage(
        name: Paths.TRANGCHU,
        page: () => HeaderAppbar(
            body: TrangchuView(),
            title: "ㅤ",
            isDrawer: true,
            pathScreen: Paths.TRANGCHU,
            logoPath: AppImages.PTVlogo),
        bindings: [TrangchuBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINH,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhView(),
            title: "Chương Trình Đang Soạn Thảo",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINH),
        bindings: [DanhsachchuongtrinhBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINH,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhView(),
              title: "Chi tiết chương trình đang soạn thảo",
              isDrawer: false,
              pathScreen: Paths.CHITIETCHUONGTRINH,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhController>().refreshFromDetail();
              },
            ),
        bindings: [ChitietchuongtrinhBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINHCHOPHEDUYETKICHBAN,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhChopheduyetkbView(),
            title: "Chương Trình Chờ Phê Duyệt Kịch Bản",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINHCHOPHEDUYETKICHBAN),
        bindings: [DanhsachchuongtrinhchopheduyetBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhChoPheDuyetKBView(),
              title: "Chi tiết chương trình",
              isDrawer: false,
              pathScreen: Paths.CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhChopdController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietchuongtrinhchopheduyetBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINHKHONGDUYETKICHBAN,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhKhongduyetKBView(),
            title: "Chương Trình Không Duyệt Kịch Bản",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINHKHONGDUYETKICHBAN),
        bindings: [DanhsachchuongtrinhKhongduyetKBBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINHKHONGDUYETKICHBAN,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhKhongDuyetKBView(),
              title: "Chi tiết chương trình",
              isDrawer: false,
              pathScreen: Paths.CHITIETCHUONGTRINHKHONGDUYETKICHBAN,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhKhongduyetKBController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietchuongtrinhKhongduyetKBBinding()]),
    GetPage(
        name: Paths.DSCHUONGTRINHDAXUATBAN,
        page: () => HeaderAppbar(
            body: DanhsachChuongtrinhDaxuatbanView(),
            title: "Chương Trình Đã Xuất Bản",
            isDrawer: true,
            pathScreen: Paths.DSCHUONGTRINHDAXUATBAN),
        bindings: [DanhsachchuongtrinhDaXuatBanBinding()]),
    GetPage(
        name: Paths.CHITIETCHUONGTRINHDAXUATBAN,
        page: () => HeaderAppbar(
              body: ChitietChuongtrinhDaXuatBanView(),
              title: "Chi tiết chương trình",
              isDrawer: false,
              pathScreen: Paths.CHITIETCHUONGTRINHDAXUATBAN,
              onBackButtonPressed: () {
                Get.find<DanhsachChuongtrinhDaXuatBanController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietchuongtrinhDaXuatBanBinding()]),
    GetPage(
        name: Paths.DSBANTINCHOPHEDUYETVIDEO,
        page: () => HeaderAppbar(
            body: DanhsachBantinchoduyetvideoView(),
            title: "Bản tin chờ duyệt Video",
            isDrawer: true,
            pathScreen: Paths.DSBANTINCHOPHEDUYETVIDEO),
        bindings: [DanhsachBantinchopheduyetvideoBinding()]),
    GetPage(
        name: Paths.CHITIETBANTIN,
        page: () => HeaderAppbar(
              body: ChitietBantinchoduyetvideoView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTIN,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinchopheduyetvideoController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinchopheduyetvideoBinding()]),
    GetPage(
        name: Paths.DSBANTINCHODUYETTINBAI,
        page: () => HeaderAppbar(
            body: DanhsachBantinChoDuyetTinBaiView(),
            title: "Bản tin chờ duyệt tin bài",
            isDrawer: true,
            pathScreen: Paths.DSBANTINCHODUYETTINBAI),
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
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinChoduyetTinbaiBinding()]),
    GetPage(
        name: Paths.DSBANTINKHONGDUYETTIN,
        page: () => HeaderAppbar(
            body: DanhsachBantinKhongduyettinView(),
            title: "Bản tin không duyệt tin",
            isDrawer: true,
            pathScreen: Paths.DSBANTINKHONGDUYETTIN),
        bindings: [DanhsachBantinKhongduyettinBinding()]),
    GetPage(
        name: Paths.CHITIETBANTINKHONGDUYETTIN,
        page: () => HeaderAppbar(
              body: ChitietBantinKhongduyettinView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTINKHONGDUYETTIN,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinKhongduyettinController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinKhongduyettinBinding()]),
    GetPage(
        name: Paths.DSBANTINDANGSANXUAT,
        page: () => HeaderAppbar(
            body: DanhsachBantinDangsanxuatView(),
            title: "Bản tin đang sản xuất",
            isDrawer: true,
            pathScreen: Paths.DSBANTINDANGSANXUAT),
        bindings: [DanhsachBantinDangsanxuatBinding()]),
    GetPage(
        name: Paths.CHITIETBANTINDANGSANXUAT,
        page: () => HeaderAppbar(
              body: ChitietBantinDangsanxuatView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTINDANGSANXUAT,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinDangsanxuatController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinDangsanxuatBinding()]),
    GetPage(
        name: Paths.DSBANTINKHONGDUYETVIDEO,
        page: () => HeaderAppbar(
            body: DanhsachBantinKhongduyetvideoView(),
            title: "Bản tin không duyệt video",
            isDrawer: true,
            pathScreen: Paths.DSBANTINKHONGDUYETVIDEO),
        bindings: [DanhsachBantinKhongduyetvideoBinding()]),
    GetPage(
        name: Paths.CHITIETBANTINKHONGDUYETVIDEO,
        page: () => HeaderAppbar(
              body: ChitietBantinKhongduyetvideoView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTINKHONGDUYETVIDEO,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinKhongduyetvideoController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinKhongduyetvideoBinding()]),
    GetPage(
        name: Paths.DSBANTINDAXUATBAN,
        page: () => HeaderAppbar(
            body: DanhsachBantinDaxuatbanView(),
            title: "Bản tin đã xuất bản",
            isDrawer: true,
            pathScreen: Paths.DSBANTINDAXUATBAN),
        bindings: [DanhsachBantinDaxuatbanBinding()]),
    GetPage(
        name: Paths.CHITIETBANTINDAXUATBAN,
        page: () => HeaderAppbar(
              body: ChitietBantinDaxuatbanView(),
              title: "Chi tiết bản tin",
              isDrawer: false,
              pathScreen: Paths.CHITIETBANTINDAXUATBAN,
              onBackButtonPressed: () {
                Get.find<DanhsachBantinDaxuatbanController>()
                    .refreshFromDetail();
              },
            ),
        bindings: [ChitietBantinDaxuatbanBinding()]),
    GetPage(
        name: Paths.USER,
        page: () => HeaderAppbar(
            body: UserProfileView(),
            title: "Người dùng",
            isDrawer: true,
            pathScreen: Paths.USER),
        bindings: [UserBinding()]),
  ];
}

class Routers {
  Routers._();
  static const USER = Paths.USER;
  static const TRANGCHU = Paths.TRANGCHU;
  static const SPLASH = Paths.SPLASH;
  static const LOGIN = Paths.LOGIN;

  static const WELCOMESCREEN = Paths.WELCOMESCREEN;
  static const GIOITHIEU = Paths.GIOITHIEU;
  static const LIENHE = Paths.LIENHE;
  static const HUONGDAN = Paths.HUONGDAN;

  static const DSCHUONGTRINH = Paths.DSCHUONGTRINH;
  static const CHITIETCHUONGTRINH = Paths.CHITIETCHUONGTRINH;

  static const DSCHUONGTRINHCHOPHEDUYETKICHBAN =
      Paths.DSCHUONGTRINHCHOPHEDUYETKICHBAN;
  static const CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN =
      Paths.CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN;

  static const DSCHUONGTRINHKHONGDUYETKICHBAN =
      Paths.DSCHUONGTRINHKHONGDUYETKICHBAN;
  static const CHITIETCHUONGTRINHKHONGDUYETKICHBAN =
      Paths.CHITIETCHUONGTRINHKHONGDUYETKICHBAN;

  static const DSCHUONGTRINHDAXUATBAN = Paths.DSCHUONGTRINHDAXUATBAN;
  static const CHITIETCHUONGTRINHDAXUATBAN = Paths.CHITIETCHUONGTRINHDAXUATBAN;

  static const CHITIETBANTIN = Paths.CHITIETBANTIN;
  static const DSBANTINCHOPHEDUYETVIDEO = Paths.DSBANTINCHOPHEDUYETVIDEO;

  static const DSBANTINCHODUYETTINBAI = Paths.DSBANTINCHODUYETTINBAI;
  static const CHITIETBANTINCHODUYETTIN = Paths.CHITIETBANTINCHODUYETTIN;

  static const DSBANTINKHONGDUYETTIN = Paths.DSBANTINKHONGDUYETTIN;
  static const CHITIETBANTINKHONGDUYETTIN = Paths.CHITIETBANTINKHONGDUYETTIN;

  static const DSBANTINDANGSANXUAT = Paths.DSBANTINDANGSANXUAT;
  static const CHITIETBANTINDANGSANXUAT = Paths.CHITIETBANTINDANGSANXUAT;

  static const DSBANTINKHONGDUYETVIDEO = Paths.DSBANTINKHONGDUYETVIDEO;
  static const CHITIETBANTINKHONGDUYETVIDEO =
      Paths.CHITIETBANTINKHONGDUYETVIDEO;

  static const DSBANTINDAXUATBAN = Paths.DSBANTINDAXUATBAN;
  static const CHITIETBANTINDAXUATBAN = Paths.CHITIETBANTINDAXUATBAN;

  static const DANHBA = Paths.DANHBA;
}

class Paths {
  Paths._();
  static const USER = '/user';
  static const TRANGCHU = '/trangchu';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';

  static const WELCOMESCREEN = '/welcomescreen';
  static const GIOITHIEU = '/gioithieu';
  static const LIENHE = '/lienhe';
  static const HUONGDAN = '/huongdan';

  static const DSCHUONGTRINH = '/dschuongtrinh';
  static const CHITIETCHUONGTRINH = '/chitietchuongtrinh';

  static const DSCHUONGTRINHCHOPHEDUYETKICHBAN =
      "/dschuongtrinhchopheduyetkichban";
  static const CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN =
      "/chitietchuongtrinhchopheduyet";

  static const DSCHUONGTRINHKHONGDUYETKICHBAN =
      "/dschuongtrinhkhongduyetkichban";
  static const CHITIETCHUONGTRINHKHONGDUYETKICHBAN =
      "/chitietchuongtrinhkhongduyetkichban";

  static const DSCHUONGTRINHDAXUATBAN = "/dschuongtrinhdaxuatban";
  static const CHITIETCHUONGTRINHDAXUATBAN = "/chitietchuongtrinhdaxuatban";

  static const DSBANTINCHOPHEDUYETVIDEO = '/dsbantinchopheduyetvideo';
  static const CHITIETBANTIN = '/chitietbantin';

  static const DSBANTINCHODUYETTINBAI = '/dsbantinchoduyettinbai';
  static const CHITIETBANTINCHODUYETTIN = '/chitietbantinchoduyettin';

  static const DSBANTINKHONGDUYETTIN = '/dsbantinkhongduyettin';
  static const CHITIETBANTINKHONGDUYETTIN = '/chitietbantinkhongduyettin';

  static const DSBANTINDANGSANXUAT = '/dsbantindangsanxuat';
  static const CHITIETBANTINDANGSANXUAT = '/chitietbantindangsanxuat';

  static const DSBANTINKHONGDUYETVIDEO = '/dsbantinkhongduyetvideo';
  static const CHITIETBANTINKHONGDUYETVIDEO = '/chitietbantinkhongduyetvideo';

  static const DSBANTINDAXUATBAN = '/dsbantindaxuatban';
  static const CHITIETBANTINDAXUATBAN = '/chitietbantindaxuatban';

  static const PHIEUDONG = '/phieudong';
  static const DANHBA = '/danhba';
}
