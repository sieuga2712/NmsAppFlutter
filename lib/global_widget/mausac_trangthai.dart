import 'package:flutter/material.dart';
import 'package:nms_app/core/values/app_color.dart';

class MausacTrangthai {
  final Color textColor;
  final Color backgroundColor;

  const MausacTrangthai({
    required this.textColor,
    required this.backgroundColor,
  });
}

const Map<String, MausacTrangthai> TrangthaiColos = {
  'Chờ GĐ đài phê duyệt file thành phẩm': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFFC107), // Vàng
  ),
  'Chờ PGĐ phê duyệt video': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFFC107), // Vàng
  ),
  'Chờ GĐ đài phê duyệt kịch bản': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFFC107), // Vàng
  ),
  'GĐ không duyệt file thành phẩm': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F), // Đỏ
  ),
  'Đang soạn thảo': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF388E3C), // Xanh lá
  ),
  'Đã xuất bản': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF1976D2), // Xanh dương
  ),
  'Đang sản xuất': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color.fromARGB(255, 96, 125, 139), // Xám
  ),
  'Đang viết tin bài': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color.fromARGB(255, 56, 142, 60), // Xanh lá
  ),
  'Chờ PGĐ phê duyệt kịch bản': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color.fromARGB(255, 255, 152, 0), // Cam
  ),
  'Chờ PGĐ phê duyệt tin bài': MausacTrangthai(
    textColor: AppColor.whiteColor,
    backgroundColor: Color.fromARGB(255, 255, 152, 0), // Cam
  ),
};
