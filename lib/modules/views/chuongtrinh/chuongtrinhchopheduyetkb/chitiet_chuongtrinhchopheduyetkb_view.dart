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
                  return SingleChildScrollView(
                    child: Column(
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
                              // Row(
                              //   children: [
                              //     Text(
                              //       'Kịch bản chương trình: ',
                              //       style: TextStyle(
                              //         fontSize: FontSizeSmall,
                              //         fontWeight: FontWeight.bold,
                              //         color: AppColor.blackColor,
                              //       ),
                              //     ),
                              //     Expanded(
                              //       child: ReadMoreText(
                              //         text: chiTietChuongTrinhChoPheDuyet
                              //                 ?.noiDungKichBan ??
                              //             '',
                              //         style: TextStyle(
                              //           fontSize: FontSizeSmall,
                              //           color: AppColor.blackColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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
                                      border: Border.all(
                                        color: AppColor.greyColor,
                                        width: 1,
                                      ),
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
                                      text: chiTietChuongTrinhChoPheDuyet
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
                              const SizedBox(height: 12),
                              // Hiển thị danh sách nút
                              Obx(() {
                                final chucNang = controller
                                    .danhSachChucNang.value?.danhSachChucNang;
                                if (chucNang == null || chucNang.isEmpty) {
                                  return const SizedBox.shrink();
                                }

                                return Column(
                                  children: chucNang.map((item) {
                                    if (item.tenChucNang == "Lưu") {
                                      return const SizedBox.shrink();
                                    }
                                    return Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  _getButtonColor(item.mauSac),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            onPressed: () {
                                              print(
                                                  'Nhấn nút: ${item.tenChucNang}');
                                              controller.xuLyChucNang(item);
                                            },
                                            child: Text(
                                              item.tenChucNang ??
                                                  'Nút không tên',
                                              style: const TextStyle(
                                                  color: AppColor.whiteColor),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }),
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

// Hàm lấy màu cho nút
Color _getButtonColor(String? mauSac) {
  switch (mauSac) {
    case "btn-danger":
      return AppColor.redColor;
    case "btn-primary":
      return AppColor.helpBlue;
    case "btn-warning":
      return AppColor.yellowColor;
    default:
      return AppColor.greyColor;
  }
}

String removeHtmlTags(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = document.body?.text ?? '';
  return parsedString;
}
