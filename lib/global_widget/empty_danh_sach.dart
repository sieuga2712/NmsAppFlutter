import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nms_app/core/values/app_color.dart';

class EmptyDanhSach extends StatelessWidget {
  const EmptyDanhSach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("lottie/emptyBox.json", height: 200, width: 200),
        Text(
          "Không tìm thấy dữ liệu!",
          style: TextStyle(color: AppColor.greyColor),
        )
      ])),
    );
  }
}
