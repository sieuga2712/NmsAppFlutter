import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/user/user_controller.dart';
import 'package:nms_app/provider/user/user_provider.dart';
import 'package:nms_app/router.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/setup/setup_controller.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/modules/controllers/login/login_controller.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';

class NavigationDrawer extends StatelessWidget {
  final getStorage = GetStorage();
  final SetupController setupController = Get.find();
  final TrangchuController homeController = Get.find();
  final LoginController loginController = Get.find<LoginController>();
  late final UserProfileController userProfileController;

  NavigationDrawer({super.key}) {
    if (!Get.isRegistered<UserProfileController>()) {
      final userProvider = Get.put(UserProvider());
      Get.put(UserProfileController(userProvider));
    }
    userProfileController = Get.find<UserProfileController>();
  }
  bool _canShowMenuItem(String permission) {
    final permissions = loginController.menuPermissions.value;
    if (permissions == null) return false;

    switch (permission) {
      case 'trangchu':
        return true;
      case 'chuongtrinh':
        return permissions.nMSMenuChuongTrinh ?? false;
      case 'chuongtrinh.chopheduyet':
        return permissions.nMSMenuChuongTrinhChoDuyet ?? false;
      case 'chuongtrinh.dapheduyet':
        return permissions.nMSMenuChuongTrinhDaPheDuyetKichBan ?? false;
      case 'chuongtrinh.khongpheduyet':
        return permissions.nMSMenuChuongTrinhKhongPheDuyetKichBan ?? false;
      case 'chuongtrinh.daxuatban':
        return permissions.nMSMenuChuongTrinhDaXuatBan ?? false;
      case 'bantin':
        return permissions.nMSMenuBanTin ?? false;
      case 'bantin.choduyet':
        return permissions.nMSMenuChoDuyetTinBai ?? false;
      case 'bantin.khongduyet':
        return permissions.nMSMenuTinKhongPheDuyet ?? false;
      case 'bantin.dangsanxuat':
        return permissions.nMSMenuDangSanXuat ?? false;
      case 'bantin.choduyet.video':
        return permissions.nMSMenuChoPheDuyetVideo ?? false;
      case 'bantin.khongduyet.video':
        return permissions.nMSMenuVideoKhongPheDuyet ?? false;
      case 'bantin.daxuatban':
        return permissions.nMSMenuTinDaXuatBan ?? false;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var nhomquyen = getStorage.read(GetStorageKey.nhomquyen);
    return Drawer(
        backgroundColor: AppColor.whiteColor,
        child: Column(children: [
          _buildHeaderDrawer(context),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Theme(
                  data: ThemeData(
                    dividerColor: AppColor.transparentColor,
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Column(
                        children: [
                          if (nhomquyen != 11 && _canShowMenuItem('trangchu'))
                            buildDrawerItems(
                                context: context,
                                text: 'Trang chủ',
                                icon: Icons.home,
                                textIconColor: (Get.isDarkMode
                                    ? AppColor.whiteColor
                                    : AppColor.helpBlue),
                                titleColor: (Get.isDarkMode
                                    ? AppColor.whiteColor
                                    : AppColor.whiteColor),
                                onTap: () {
                                  navigate('trangchu');
                                }),
                          if (_canShowMenuItem('chuongtrinh'))
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: AppColor.greyColor, width: 0.5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ExpansionTile(
                                  leading: Icon(Icons.newspaper,
                                      color: Get.isDarkMode
                                          ? AppColor.whiteColor
                                          : AppColor.helpBlue),
                                  title: Text(
                                    'Danh sách chương trình',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue,
                                        ),
                                  ),
                                  children: [
                                    if (_canShowMenuItem(
                                        'chuongtrinh.chopheduyet'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Chờ phê duyệt kịch bản',
                                          icon: Icons.watch_later_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachchuongtrinhchopheduyet');
                                          }),
                                    if (_canShowMenuItem(
                                        'chuongtrinh.dapheduyet'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Đã phê duyệt kịch bản',
                                          icon: Icons.task_alt_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate('danhsachchuongtrinh');
                                          }),
                                    if (_canShowMenuItem(
                                        'chuongtrinh.khongpheduyet'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Không phê duyệt kịch bản',
                                          icon: Icons.block_flipped,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachchuongtrinhkhongduyetkb');
                                          }),
                                    if (_canShowMenuItem(
                                        'chuongtrinh.daxuatban'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Đã xuất bản',
                                          icon: Icons.play_circle_outline,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachchuongtrinhdaxuatban');
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          if (_canShowMenuItem('bantin'))
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: AppColor.greyColor, width: 0.5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: ExpansionTile(
                                  leading: Icon(Icons.cell_tower,
                                      color: Get.isDarkMode
                                          ? AppColor.whiteColor
                                          : AppColor.helpBlue),
                                  title: Text(
                                    'Danh sách bản tin',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue,
                                        ),
                                  ),
                                  children: [
                                    if (_canShowMenuItem('bantin.choduyet'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Chờ duyệt tin bài',
                                          icon: Icons.watch_later_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachbantinchoduyettinbai');
                                          }),
                                    if (_canShowMenuItem('bantin.khongduyet'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Tin không được duyệt',
                                          icon: Icons.cancel_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachbantinkhongduyettin');
                                          }),
                                    if (_canShowMenuItem('bantin.dangsanxuat'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Đang sản xuất',
                                          icon: Icons.area_chart_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachbantindangsanxuat');
                                          }),
                                    if (_canShowMenuItem(
                                        'bantin.choduyet.video'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Chờ duyệt video',
                                          icon: Icons.videocam_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate('danhsachbantin');
                                          }),
                                    if (_canShowMenuItem(
                                        'bantin.khongduyet.video'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Không duyệt video',
                                          icon: Icons.videocam_off_outlined,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate(
                                                'danhsachbantinkhongduyetvideo');
                                          }),
                                    if (_canShowMenuItem('bantin.daxuatban'))
                                      buildDrawerItems(
                                          context: context,
                                          text: 'Đã xuất bản',
                                          icon: Icons.play_circle_outline,
                                          textIconColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.helpBlue),
                                          titleColor: (Get.isDarkMode
                                              ? AppColor.whiteColor
                                              : AppColor.whiteColor),
                                          onTap: () {
                                            navigate('danhsachbantindaxuatban');
                                          }),
                                  ],
                                ),
                              ),
                            ),
                          buildDrawerItems(
                              context: context,
                              text: 'Tài khoản',
                              icon: Icons.people,
                              textIconColor: (Get.isDarkMode
                                  ? AppColor.whiteColor
                                  : AppColor.helpBlue),
                              titleColor: (Get.isDarkMode
                                  ? AppColor.whiteColor
                                  : AppColor.whiteColor),
                              onTap: () {
                                navigate('user');
                              }),
                          buildDrawerItems(
                              context: context,
                              text: 'Đăng xuất',
                              icon: Icons.logout,
                              textIconColor: (Get.isDarkMode
                                  ? AppColor.whiteColor
                                  : AppColor.helpBlue),
                              titleColor: (Get.isDarkMode
                                  ? AppColor.whiteColor
                                  : AppColor.whiteColor),
                              onTap: () {
                                loginController.logout();
                              }),
                        ],
                      ))),
            ),
          )
        ]));
  }

  Widget _buildHeaderDrawer(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        decoration: BoxDecoration(
          color:
              Get.isDarkMode ? AppColor.yellowColor : AppColor.blueAccentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60, bottom: 20),
          child: Row(children: [
            InkWell(
              onTap: () {
                navigate('user');
              },
              child: const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("images/avatar_default.png"),
                backgroundColor: AppColor.blackColor,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: userProfileController.obx(
                  (user) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user?.surname ?? ''} ${user?.name ?? ''}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Get.isDarkMode
                                  ? AppColor.blackColor
                                  : AppColor.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      if (user?.email != null) ...[
                        const SizedBox(height: 5),
                        Text(
                          user!.email!,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Get.isDarkMode
                                        ? AppColor.blackColor.withOpacity(0.7)
                                        : AppColor.whiteColor.withOpacity(0.7),
                                  ),
                        ),
                      ]
                    ],
                  ),
                  onLoading: const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  onError: (error) => Text(
                    'Error loading profile',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.redColor,
                        ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }

  Widget buildDrawerItems(
      {required BuildContext context,
      required String text,
      required IconData? icon,
      required Color? textIconColor,
      required Color? titleColor,
      required VoidCallback onTap}) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.greyColor, width: 0.5),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Icon(icon, color: textIconColor),
              title: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textIconColor,
                    ),
              ),
              tileColor: titleColor,
              onTap: onTap,
            )));
  }

  navigate(String index) {
    switch (index) {
      case 'login':
        Get.offNamed(Routers.LOGIN);
        break;
      case 'trangchu':
        Get.offNamed(Routers.TRANGCHU);
        break;
      case 'danhsachchuongtrinh':
        Get.offNamed(Routers.DSCHUONGTRINH);
        break;
      case 'danhsachchuongtrinhchopheduyet':
        Get.offNamed(Routers.DSCHUONGTRINHCHOPHEDUYETKICHBAN);
        break;
      case 'danhsachchuongtrinhkhongduyetkb':
        Get.offNamed(Routers.DSCHUONGTRINHKHONGDUYETKICHBAN);
        break;
      case 'danhsachchuongtrinhdaxuatban':
        Get.offNamed(Routers.DSCHUONGTRINHDAXUATBAN);
        break;
      case 'danhsachbantin':
        Get.offNamed(Routers.DSBANTINCHOPHEDUYETVIDEO);
        break;
      case 'danhsachbantinchoduyettinbai':
        Get.offNamed(Routers.DSBANTINCHODUYETTINBAI);
        break;
      case 'danhsachbantinkhongduyettin':
        Get.offNamed(Routers.DSBANTINKHONGDUYETTIN);
        break;
      case 'danhsachbantindangsanxuat':
        Get.offNamed(Routers.DSBANTINDANGSANXUAT);
        break;
      case 'danhsachbantinkhongduyetvideo':
        Get.offNamed(Routers.DSBANTINKHONGDUYETVIDEO);
        break;
      case 'danhsachbantindaxuatban':
        Get.offNamed(Routers.DSBANTINDAXUATBAN);
        break;
      case 'danhba':
        Get.offNamed(Routers.DANHBA);
        break;
      case 'user':
        Get.offNamed(Routers.USER);
        break;

      default:
        break;
    }
  }
}
