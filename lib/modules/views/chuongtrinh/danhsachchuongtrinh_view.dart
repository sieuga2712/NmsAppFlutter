import 'package:nms_app/core/values/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nms_app/modules/controllers/danhsachchuongtrinh/danhsachchuongtrinh_controller.dart';

class DanhsachchuongtrinhView extends GetView<DanhsachchuongtrinhController> {
  @override
  final DanhsachchuongtrinhController controller = Get.find();

  DanhsachchuongtrinhView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SingleChildScrollView(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return Container(
                child: Column(children: const [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Danh sách chương trình",
                        style: TextStyle(color: AppColor.whiteColor),
                      )
                    ],
                  ),
                ),
              )
            ]));
          }),
        ),
      ),
    );
  }
}
