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
import 'package:nms_app/global_widget/status_config.dart';
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
      child: Container(
        color: AppColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: controller.obx(
                  (chiTietChuongTrinh) {
                    final statusInfo = TrangthaiColos[
                        chiTietChuongTrinh
                            ?.trangThaiChuongTrinhBanTin];
                    final hanXuLySanXuat = DateTime.tryParse(
                        chiTietChuongTrinh?.hanXuLy ?? "");
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
                                        chiTietChuongTrinh?.ten ??
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
                                        chiTietChuongTrinh?.ten ??
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
                                      chiTietChuongTrinh?.moTa ??
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
                                        '${chiTietChuongTrinh?.trangThaiChuongTrinhBanTin}',
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
                                      'Kịch bản chương trình:',
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
                                        color: AppColor.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: ReadMoreText(
                                        text: (chiTietChuongTrinh
                                                    ?.noiDungKichBan
                                                    ?.trim()
                                                    .isNotEmpty ??
                                                false)
                                            ? chiTietChuongTrinh!
                                                .noiDungKichBan!
                                            : 'Chưa có nội dung kịch bản',
                                        maxLength: 50,
                                        style: TextStyle(
                                          fontSize: FontSizeSmall,
                                          color: AppColor.blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Hiển thị danh sách bản tin cần xử lý
                                Obx(() {
                                  final dsBanTin =
                                      controller.dsBanTinCanXuLyByChuongTrinhId;
                                  if (dsBanTin.isEmpty) {
                                    return const SizedBox.shrink();
                                  }

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Danh sách bản tin cần xử lý',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Obx(() {
                                            return Checkbox(
                                              value: controller
                                                  .isAllSelected.value,
                                              onChanged: (bool? value) {
                                                controller.isAllSelected.value =
                                                    value ?? false;
                                                if (controller
                                                    .isAllSelected.value) {
                                                  // Chọn tất cả các bản tin
                                                  controller.selectedBanTinIds
                                                      .clear();
                                                  controller.selectedBanTinIds
                                                      .addAll(dsBanTin
                                                          .map((banTin) =>
                                                              banTin.id)
                                                          .whereType<String>());
                                                } else {
                                                  // Bỏ chọn tất cả
                                                  controller.selectedBanTinIds
                                                      .clear();
                                                }
                                              },
                                            );
                                          }),
                                          const Text('Chọn tất cả'),
                                        ],
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  AppColor.greyColor.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: dsBanTin.length,
                                          itemBuilder: (context, index) {
                                            final banTin = dsBanTin[index];

                                            return Obx(() {
                                              final isSelected = controller
                                                  .selectedBanTinIds
                                                  .contains(banTin.id);
                                              final statusInfo = statusConfig[
                                                  banTin.trangThaiChuongTrinhBanTin ??
                                                      ''];

                                              return Container(
                                                decoration: BoxDecoration(
                                                  border: index <
                                                          dsBanTin.length - 1
                                                      ? Border(
                                                          bottom: BorderSide(
                                                              color: AppColor
                                                                  .greyColor
                                                                  .shade300),
                                                        )
                                                      : null,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Checkbox(
                                                      value: isSelected,
                                                      onChanged: (bool? value) {
                                                        controller
                                                            .toggleBanTinSelection(
                                                                banTin.id ??
                                                                    '');
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: ListTile(
                                                        onTap: () {
                                                          controller
                                                              .onSwitchPage(
                                                                  banTin.id);
                                                        },
                                                        title: Text(
                                                          banTin.ten ??
                                                              'Không có tên',
                                                          style: TextStyle(
                                                            fontSize:
                                                                FontSizeSmall,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColor
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        subtitle: Row(
                                                          children: [
                                                            Text(
                                                              'Trạng Thái: ',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    FontSizeSmall,
                                                                color: AppColor
                                                                    .blackColor,
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          6,
                                                                      vertical:
                                                                          2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: statusInfo
                                                                        ?.backgroundColor ??
                                                                    Colors.grey
                                                                        .shade400,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Text(
                                                                statusInfo
                                                                        ?.name ??
                                                                    (banTin.trangThaiChuongTrinhBanTin ??
                                                                        'Chưa xác định'),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      FontSizeSmall,
                                                                  color: statusInfo
                                                                          ?.textColor ??
                                                                      AppColor
                                                                          .blackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  );
                                }),

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
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, top: 4.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    _getButtonColor(
                                                        item.mauSac),
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

                                // Hiển thị danh sách bản tin của chương trình
                                Obx(() {
                                  final dsBanTin =
                                      controller.dsBanTinByChuongTrinhId;
                                  if (dsBanTin.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          'Danh sách bản tin của chương trình',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  AppColor.greyColor.shade300),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: dsBanTin.length,
                                          itemBuilder: (context, index) {
                                            final banTin = dsBanTin[index];

                                            return Obx(() {
                                              final isSelected = controller
                                                  .selectedBanTinIds
                                                  .contains(banTin.id);
                                              final statusInfo = statusConfig[
                                                  banTin.trangThaiChuongTrinhBanTin ??
                                                      ''];

                                              return Container(
                                                decoration: BoxDecoration(
                                                  border: index <
                                                          dsBanTin.length - 1
                                                      ? Border(
                                                          bottom: BorderSide(
                                                              color: AppColor
                                                                  .greyColor
                                                                  .shade300),
                                                        )
                                                      : null,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: ListTile(
                                                        onTap: () {
                                                          controller
                                                              .onSwitchPage(
                                                                  banTin.id);
                                                        },
                                                        title: Text(
                                                          banTin.ten ??
                                                              'Không có tên',
                                                          style: TextStyle(
                                                            fontSize:
                                                                FontSizeSmall,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColor
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        subtitle: Row(
                                                          children: [
                                                            Text(
                                                              'Trạng Thái: ',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    FontSizeSmall,
                                                                color: AppColor
                                                                    .blackColor,
                                                              ),
                                                            ),
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          6,
                                                                      vertical:
                                                                          2),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: statusInfo
                                                                        ?.backgroundColor ??
                                                                    Colors.grey
                                                                        .shade400,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Text(
                                                                statusInfo
                                                                        ?.name ??
                                                                    (banTin.trangThaiChuongTrinhBanTin ??
                                                                        'Chưa xác định'),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      FontSizeSmall,
                                                                  color: statusInfo
                                                                          ?.textColor ??
                                                                      AppColor
                                                                          .blackColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                    ],
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
        ), // màu nền bạn muốn
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
