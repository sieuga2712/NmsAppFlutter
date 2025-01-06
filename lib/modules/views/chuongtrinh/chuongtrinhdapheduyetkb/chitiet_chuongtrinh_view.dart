import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:nms_app/core/ultis/read_more_text.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/core/theme/app_theme.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:intl/intl.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/chitiet_chuongtrinh_controller.dart';

class ChitietChuongtrinhView extends StatefulWidget {
  const ChitietChuongtrinhView({super.key});

  @override
  _ChitietChuongtrinhViewState createState() => _ChitietChuongtrinhViewState();
}

class _ChitietChuongtrinhViewState extends State<ChitietChuongtrinhView> {
  final ChitietChuongtrinhController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: controller.obx(
                (chiTietChuongTrinhDaPheDuyet) {
                  final statusInfo = TrangthaiColos[
                      chiTietChuongTrinhDaPheDuyet?.trangThaiChuongTrinhBanTin];
                  final hanXuLySanXuat = DateTime.tryParse(
                      chiTietChuongTrinhDaPheDuyet?.hanXuLy ?? "");
                  final hanXuLySanXuatDate = hanXuLySanXuat != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLySanXuat)
                      : "Chưa có hạn xử lý";
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Tên Chương Trình: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      chiTietChuongTrinhDaPheDuyet?.ten ??
                                          'Không có tên chương trình',
                                      style: TextStyle(
                                        fontSize: FontSizeSmall,
                                        color: AppColor.redColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Tên Bản Tin: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      chiTietChuongTrinhDaPheDuyet?.ten ??
                                          'Không có tên',
                                      style: TextStyle(
                                        fontSize: FontSizeSmall,
                                        color: AppColor.blackColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // Modified Mô Tả section
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Mô Tả: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    chiTietChuongTrinhDaPheDuyet?.moTa ??
                                        'Không có mô tả',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Hạn Xử Lý: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      hanXuLySanXuatDate,
                                      style: TextStyle(
                                        fontSize: FontSizeSmall,
                                        color: AppColor.redColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Trạng Thái: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: statusInfo?.backgroundColor ??
                                          AppColor.greyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${chiTietChuongTrinhDaPheDuyet?.trangThaiChuongTrinhBanTin}',
                                      style: TextStyle(
                                        color: statusInfo?.textColor ??
                                            AppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kịch bản chương trình: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ReadMoreText(
                                      text: chiTietChuongTrinhDaPheDuyet
                                              ?.noiDungKichBan ??
                                          '',
                                      maxLength: 50,
                                      style: TextStyle(
                                        fontSize: FontSizeSmall,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onEmpty: EmptyDanhSach(),
                onLoading: SpinKitCircle(
                  color: AppColor.blueAccentColor,
                ),
                onError: (error) {
                  return Center(child: Text(error.toString()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String removeHtmlTags(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = document.body?.text ?? '';
  return parsedString;
}
