import 'package:flutter/material.dart';
import 'package:nms_app/core/values/app_color.dart';

class StatusInfo {
  final String name;
  final Color textColor;
  final Color backgroundColor;

  const StatusInfo({
    required this.name,
    required this.textColor,
    required this.backgroundColor,
  });
}

final Map<String, StatusInfo> statusConfig = {
  'Chờ GĐ duyệt video': StatusInfo(
    name: 'Chờ GĐ duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFFC107),
  ),
  'Chờ GĐ duyệt kịch bản': StatusInfo(
    name: 'Chờ GĐ duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFFC107),
  ),
  'GĐ không duyệt video': StatusInfo(
    name: 'GĐ không duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'Đang soạn thảo': StatusInfo(
    name: 'Đang soạn thảo',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF388E3C),
  ),
  'Đã xuất bản': StatusInfo(
    name: 'Đã xuất bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF1976D2),
  ),
  'Phòng không duyệt video': StatusInfo(
    name: 'Phòng không duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'Chờ phòng duyệt tin bài': StatusInfo(
    name: 'Chờ phòng duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'Phòng không duyệt tin bài': StatusInfo(
    name: 'Phòng không duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'GĐ không duyệt tin bài': StatusInfo(
    name: 'GĐ không duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'GĐ không duyệt kịch bản': StatusInfo(
    name: 'GĐ không duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'PGĐ không duyệt tin bài': StatusInfo(
    name: 'PGĐ không duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'Chờ PGĐ duyệt tin bài': StatusInfo(
    name: 'Chờ PGĐ duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'Chờ phòng duyệt video': StatusInfo(
    name: 'Chờ phòng duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'PGĐ không duyệt video': StatusInfo(
    name: 'PGĐ không duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'Đang sản xuất': StatusInfo(
    name: 'Đang sản xuất',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF607D8B),
  ),
  'Chờ phòng duyệt kịch bản': StatusInfo(
    name: 'Chờ phòng duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'Chờ PGĐ duyệt kịch bản': StatusInfo(
    name: 'Chờ PGĐ duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'Đang viết tin bài': StatusInfo(
    name: 'Đang viết tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF388E3C),
  ),
  'Hủy sản xuất': StatusInfo(
    name: 'Hủy sản xuất',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'CHILUUTHONGTIN': StatusInfo(
    name: 'CHILUUTHONGTIN',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFF2C6B3D),
  ),
  'Chờ PGĐ duyệt video': StatusInfo(
    name: 'Chờ PGĐ duyệt video',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'Phòng không duyệt kịch bản': StatusInfo(
    name: 'Phòng không duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
  'Chờ GĐ duyệt tin bài': StatusInfo(
    name: 'Chờ GĐ duyệt tin bài',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFFF9800),
  ),
  'PGĐ không duyệt kịch bản': StatusInfo(
    name: 'PGĐ không duyệt kịch bản',
    textColor: AppColor.whiteColor,
    backgroundColor: Color(0xFFD32F2F),
  ),
};
