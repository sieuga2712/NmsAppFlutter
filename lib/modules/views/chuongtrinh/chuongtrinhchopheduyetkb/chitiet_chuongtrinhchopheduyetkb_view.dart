import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/core/theme/app_theme.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:intl/intl.dart';
import 'package:nms_app/core/ultis/read_more_text.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/danhsachchuongtrinhchopd/chitiet_chuongtrinhchopd_controller.dart';

class ChitietChuongtrinhChoPheDuyetKBView extends StatefulWidget {
  const ChitietChuongtrinhChoPheDuyetKBView({super.key});

  @override
  _ChitietChuongtrinhChoPheDuyetKBViewState createState() =>
      _ChitietChuongtrinhChoPheDuyetKBViewState();
}

class _ChitietChuongtrinhChoPheDuyetKBViewState
    extends State<ChitietChuongtrinhChoPheDuyetKBView> {
  final ChitietChuongtrinhChopdController controller = Get.find();

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
                (chiTietChuongTrinhChoPheDuyet) {
                  final statusInfo = TrangthaiColos[
                      chiTietChuongTrinhChoPheDuyet
                          ?.trangThaiChuongTrinhBanTin];
                  final hanXuLySanXuat = DateTime.tryParse(
                      chiTietChuongTrinhChoPheDuyet?.hanXuLy ?? "");
                  final hanXuLySanXuatDate = hanXuLySanXuat != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLySanXuat)
                      : "Chưa có hạn xử lý";
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0), // Padding cho các Row
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
                                    chiTietChuongTrinhChoPheDuyet?.ten ??
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
                                    chiTietChuongTrinhChoPheDuyet?.ten ??
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
                            Row(
                              children: [
                                Text(
                                  'Mô Tả: ',
                                  style: TextStyle(
                                    fontSize: FontSizeSmall,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blackColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Expanded(
                                  child: Text(
                                    chiTietChuongTrinhChoPheDuyet?.moTa ??
                                        'Không có mô tả',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      color: AppColor.blackColor,
                                    ),
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
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: statusInfo?.backgroundColor ??
                                          AppColor.greyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      '${chiTietChuongTrinhChoPheDuyet?.trangThaiChuongTrinhBanTin}',
                                      style: TextStyle(
                                        color: statusInfo?.textColor ??
                                            AppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  'Kịch bản chương trình: ',
                                  style: TextStyle(
                                    fontSize: FontSizeSmall,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                Expanded(
                                  child: ReadMoreText(
                                    text: chiTietChuongTrinhChoPheDuyet
                                            ?.noiDungKichBan ??
                                        '',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
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