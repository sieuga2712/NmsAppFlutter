import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/core/theme/app_theme.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:nms_app/modules/controllers/danhsachbantin/chitiet_bantin_controller.dart';
import 'package:intl/intl.dart';
import 'package:html/parser.dart'; // Thư viện để parse HTML

class ChitietBantinView extends GetView<ChitietBantinController> {
  const ChitietBantinView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: controller.obx(
              (chiTietBanTin) => ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final statusInfo =
                      TrangthaiColos[chiTietBanTin?.trangThaiChuongTrinhBanTin];
                  final hanXuLySanXuat =
                      DateTime.tryParse(chiTietBanTin?.hanXuLyVietTin ?? "");
                  final hanXuLySanXuatDate = hanXuLySanXuat != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLySanXuat)
                      : "Chưa có hạn xử lý";
                  // final danhSachChucNang =
                  //     controller.danhSachChucNang?.danhSachChucNang ?? [];

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                  chiTietBanTin?.chuongTrinh?.ten ??
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
                          SizedBox(height: 4),
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
                                  chiTietBanTin?.ten ?? 'Không có tên',
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
                          SizedBox(height: 4),
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
                                  chiTietBanTin?.moTa ?? 'Không có mô tả',
                                  style: TextStyle(
                                    fontSize: FontSizeSmall,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Hạn Sản Xuất: ',
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
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Trạng Thái: ',
                                style: TextStyle(
                                  fontSize: FontSizeSmall,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor
                                      .blackColor, // Tiêu đề màu đen và in đậm
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
                                    '${chiTietBanTin?.trangThaiChuongTrinhBanTin}',
                                    style: TextStyle(
                                      color: statusInfo?.textColor ??
                                          AppColor.blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'File Video Đính Kèm: ',
                          //       style: TextStyle(
                          //         fontSize: FontSizeSmall,
                          //         fontWeight: FontWeight.bold,
                          //         color: AppColor.blackColor,
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         '${chiTietBanTin?.fileVideo ?? 'Không có file video'}',
                          //         style: TextStyle(
                          //           fontSize: FontSizeSmall,
                          //           color: AppColor.blackColor,
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                'Nội dung bản tin: ',
                                style: TextStyle(
                                  fontSize: FontSizeSmall,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  removeHtmlTags(
                                      chiTietBanTin?.noiDungTin ?? ''),
                                  style: TextStyle(
                                    fontSize: FontSizeSmall,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          // Hiển thị danh sách nút
                          Obx(() {
                            final chucNang = controller
                                .danhSachChucNang.value?.danhSachChucNang;
                            if (chucNang == null || chucNang.isEmpty) {
                              return Text("Không có chức năng nào.");
                            }
                            return Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: chucNang.map((item) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        _getButtonColor(item.mauSac),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('Nhấn nút: ${item.tenChucNang}');
                                    controller.xuLyChucNang(item);
                                  },
                                  child: Text(
                                    item.tenChucNang ?? 'Nút không tên',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
    );
  }
}

// Hàm lấy màu cho nút
Color _getButtonColor(String? mauSac) {
  switch (mauSac) {
    case "btn-danger":
      return Colors.red;
    case "btn-primary":
      return Colors.blue;
    case "btn-warning":
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

String removeHtmlTags(String htmlString) {
  final document = parse(htmlString); // Parse HTML thành DOM
  final String parsedString = document.body?.text ?? ''; // Trích xuất text
  return parsedString;
}
