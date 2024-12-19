import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/app_theme_values.dart';
import 'package:nms_app/global_widget/button_custom.dart';
import 'package:nms_app/model/ultis/dsdoituong.dart';
import 'package:nms_app/model/ultis/dsnguyennhan.dart';
import 'package:nms_app/modules/items/items_ds_phieumo.dart';
import 'package:nms_app/modules/page/phieumo/phieumo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:ui';

// ignore: use_key_in_widget_ructors
class PhieumoView extends GetView<PhieumoController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return Container(
              color: AppColor.whiteColor,
              child: Column(children: [
                Container(
                    height: 200,
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                        child: Center(
                            child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonCustom(
                                title: "Chưa xử lý",
                                onPressed: () {
                                  controller.ChonTrangThaiXuLy(0);
                                },
                                backgroundColor:
                                    controller.choicebutton.value == "chuaxuly"
                                        ? AppColor.blueAccentColor
                                        : AppColor.whiteColor,
                                textColor:
                                    controller.choicebutton.value == "chuaxuly"
                                        ? AppColor.whiteColor
                                        : AppColor.blueAccentColor,
                              ),
                              SizedBox(width: 5.0),
                              ButtonCustom(
                                title: "Đã xử lý",
                                onPressed: () {
                                  controller.ChonTrangThaiXuLy(1);
                                },
                                backgroundColor:
                                    controller.choicebutton.value != "chuaxuly"
                                        ? AppColor.blueAccentColor
                                        : AppColor.whiteColor,
                                textColor:
                                    controller.choicebutton.value != "chuaxuly"
                                        ? AppColor.whiteColor
                                        : AppColor.blueAccentColor,
                              )
                            ],
                          ),
                        )),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                          child: dropNguyenNhan(context)),
                      Padding(
                          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                          child: dropDoiTuong(context))
                    ])),
                Expanded(
                    child: Obx(() => (controller.isloading.value == true)
                        ? Padding(
                            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                            child: WillPopScope(
                                child: Center(
                                  child: SpinKitCircle(
                                      color: Get.isDarkMode
                                          ? AppColor.yellowColor
                                          : AppColor.blueAccentColor,
                                      size: 40),
                                ),
                                onWillPop: () => Future.value(false)),
                          )
                        : Obx(
                            () => RefreshIndicator(
                                onRefresh: () async {
                                  controller.loadmoredata();
                                },
                                child: ListView.builder(
                                    controller:
                                        controller.scrollerControllerChuaXuLy,
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    itemCount: controller.dsthuebao.length,
                                    itemBuilder: ((context, index) =>
                                        ItemListPhieu(
                                            thuebao:
                                                controller.dsthuebao[index],
                                            onClickItem: () {})))),
                          )))
              ]));
        }),
      ),
    );
  }

  Widget dropNguyenNhan(BuildContext context) {
    return Obx(() => DropdownButtonFormField<String>(
          isExpanded: true,
          value: controller.NNDuocChon.toString(),
          onChanged: (String? newValue) {
            controller.ChangeNguyenNhan(newValue.toString());
          },
          items: controller.dsnguyennhan
              .map<DropdownMenuItem<String>>((Dsnguyennhan value) {
            return DropdownMenuItem<String>(
              value: value.nn_id.toString() ?? "-1",
              child: Text(
                value.ten_nn ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          validator: (value) {
            if (value == null) {
              return 'Vui lòng chọn một mục';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
              color: AppColor.blueAccentColor,
              fontSize: AppSizeValues.FontSizeSmall),
        ));
  }

  Widget dropDoiTuong(BuildContext context) {
    return Obx(() => DropdownButtonFormField<String>(
          isExpanded: true,
          value: controller.DTDuocChon.toString(),
          onChanged: (String? newValue) {
            controller.ChangeDoiTuong(newValue.toString());
          },
          items: controller.dsdoituong
              .map<DropdownMenuItem<String>>((Dsdoituong value) {
            return DropdownMenuItem<String>(
              value: value.loai_kh_id.toString() ?? "-1",
              child: Text(
                value.ten_loai_kh_id ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          validator: (value) {
            if (value == null) {
              return 'Vui lòng chọn một mục';
            }
            return null;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
              color: AppColor.blueAccentColor,
              fontSize: AppSizeValues.FontSizeSmall),
        ));
  }
}
