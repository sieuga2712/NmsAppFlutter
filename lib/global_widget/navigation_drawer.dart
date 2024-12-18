import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/modules/page/home/home_controller.dart';
import 'package:nms_app/router.dart';
import 'package:nms_app/setup/setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class NavigationDrawer extends StatelessWidget {
  final getStorage = GetStorage();
  final SetupController setupController = Get.find();
  final HomeController homeController = Get.find();

  NavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    var nhomquyen = getStorage.read(GetStorageKey.nhomquyen);
    return Drawer(
        backgroundColor: AppColor.whiteColor,
        child: Column(children: [
          buidHearderDrawer(context,
              accountName: getStorage.read(GetStorageKey.hoVaTen) ?? '',
              accountPosition: getStorage.read(GetStorageKey.tendonvi) ?? ''),
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
                          if (nhomquyen != 11)
                            buildDrawerItems(
                                context: context,
                                text: 'Tra cứu ONT',
                                icon: Icons.list,
                                textIconColor: (Get.isDarkMode
                                    ? AppColor.whiteColor
                                    : AppColor.helpBlue),
                                titleColor: (Get.isDarkMode
                                    ? AppColor.whiteColor
                                    : AppColor.whiteColor),
                                onTap: () {
                                  navigate('tracuuONT');
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
                                setupController.logOut();
                              }),
                        ],
                      ))),
            ),
          )
        ]));
  }

  Widget buidHearderDrawer(BuildContext context,
      {required String accountName, required String accountPosition}) {
    List<DropdownMenuItem<String>> listDropDownDV = [];

    
    return Container(
        margin: EdgeInsets.only(bottom: 0.0),
        decoration: BoxDecoration(
          color:
              Get.isDarkMode ? AppColor.yellowColor : AppColor.blueAccentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60, bottom: 20),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "123",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Get.isDarkMode
                                  ? AppColor.blackColor
                                  : AppColor.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
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
      // Cài đặt
      case 'home':
        Get.offNamed(Routers.HOME);
        break;
      default:
        break;
    }
  }
}
