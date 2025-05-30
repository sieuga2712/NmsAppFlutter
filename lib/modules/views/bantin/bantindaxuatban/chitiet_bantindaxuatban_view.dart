import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/core/theme/app_theme.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:intl/intl.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindaxuatban/chitiet_bantindaxuatban_controller.dart';
import 'package:video_player/video_player.dart';

class ChitietBantinDaxuatbanView extends StatefulWidget {
  const ChitietBantinDaxuatbanView({super.key});

  @override
  _ChitietBantinDaxuatbanViewState createState() =>
      _ChitietBantinDaxuatbanViewState();
}

class _ChitietBantinDaxuatbanViewState
    extends State<ChitietBantinDaxuatbanView> {
  final ChitietBantinDaXuatBanController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.loadVideos();
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
                (chiTietBanTin) {
                  final statusInfo =
                      TrangthaiColos[chiTietBanTin?.trangThaiChuongTrinhBanTin];
                  final hanXuLySanXuat =
                      DateTime.tryParse(chiTietBanTin?.hanXuLyVietTin ?? "");
                  final hanXuLySanXuatDate = hanXuLySanXuat != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLySanXuat)
                      : "Chưa có hạn xử lý";

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Các thông tin chương trình
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
                              const SizedBox(height: 4),
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
                                    chiTietBanTin?.moTa ?? 'Không có mô tả',
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
                                    'Thể loại: ',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${chiTietBanTin?.theLoaiTin}',
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
                                      '${chiTietBanTin?.trangThaiChuongTrinhBanTin}',
                                      style: TextStyle(
                                        color: statusInfo?.textColor ??
                                            AppColor.blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    'Video bản tin:',
                                    style: TextStyle(
                                      fontSize: FontSizeSmall,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                              // Nội dung video
                              Obx(() {
                                if (controller.isVideoLoading.value) {
                                  return Container(
                                    height: 200,
                                    color: AppColor.blackColor,
                                    child: Center(
                                      child: SpinKitCircle(
                                        color: AppColor.blueAccentColor,
                                      ),
                                    ),
                                  );
                                }

                                if (controller.controllers.isEmpty) {
                                  return const Center(
                                    child:
                                        Text('Không có video nào để hiển thị.'),
                                  );
                                }

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: controller.controllers.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final videoController =
                                          controller.controllers[index];

                                      return Obx(() {
                                        final isPlaying =
                                            controller.isPlaying[index];
                                        final showControls =
                                            controller.showControls[index];

                                        return MouseRegion(
                                          onEnter: (_) {
                                            // Hiển thị nút khi hover
                                            controller.showControls[index] =
                                                true;
                                          },
                                          onExit: (_) {
                                            // Ẩn nút khi rời chuột
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              if (!isPlaying) {
                                                controller.showControls[index] =
                                                    false;
                                              }
                                            });
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              // Hiển thị nút và đặt hẹn giờ ẩn nếu video đang phát
                                              controller.showControls[index] =
                                                  true;

                                              if (isPlaying) {
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  if (controller
                                                      .isPlaying[index]) {
                                                    controller.showControls[
                                                        index] = false;
                                                  }
                                                });
                                              }
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 16),
                                              height: 200,
                                              color: AppColor.blackColor,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  videoController
                                                          .value.isInitialized
                                                      ? AspectRatio(
                                                          aspectRatio:
                                                              videoController
                                                                  .value
                                                                  .aspectRatio,
                                                          child: VideoPlayer(
                                                              videoController),
                                                        )
                                                      : const Center(
                                                          child: Text(
                                                              'Video không thể phát.'),
                                                        ),
                                                  // Hiển thị nút Play/Pause khi `hover` hoặc trong trạng thái showControls
                                                  if (showControls)
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              const CircleBorder(),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16),
                                                          backgroundColor:
                                                              AppColor
                                                                  .blackColor
                                                                  .withOpacity(
                                                                      0.5),
                                                        ),
                                                        onPressed: videoController
                                                                .value
                                                                .isInitialized
                                                            ? () {
                                                                controller
                                                                    .togglePlayPause(
                                                                        index);
                                                              }
                                                            : null,
                                                        child: Icon(
                                                          isPlaying
                                                              ? Icons.pause
                                                              : Icons
                                                                  .play_arrow,
                                                          size: 32,
                                                          color: AppColor
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                );
                              }),

                              const SizedBox(height: 8),
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
      return AppColor.orangecolor;
    default:
      return AppColor.greyColor;
  }
}

String removeHtmlTags(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = document.body?.text ?? '';
  return parsedString;
}
