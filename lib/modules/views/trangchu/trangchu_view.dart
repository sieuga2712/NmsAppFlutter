import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrangchuView extends GetView<TrangchuController> {
  @override
  final TrangchuController controller = Get.find();

  TrangchuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
            children: [
              Text(
                'Trang chủ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
