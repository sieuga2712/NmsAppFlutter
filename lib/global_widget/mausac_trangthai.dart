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
};
