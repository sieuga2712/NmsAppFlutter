import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:intl/intl.dart';
import 'package:nms_app/global_widget/tra_cuu_box.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantinchopheduyettinbai/danhsach_bantinchoduyettinbai_controller.dart';

class DanhsachBantinChoDuyetTinBaiView
    extends GetView<DanhsachBantinChoduyetTinbaiController> {
  const DanhsachBantinChoDuyetTinBaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Thanh tìm kiếm
          TraCuuBox(onChanged: controller.setSearchKey),
          // Danh sách bản tin
          Expanded(
            child: controller.obx(
              (dsBanTinChoDuyetTinBai) => ListView.builder(
                itemCount: dsBanTinChoDuyetTinBai!.length,
                itemBuilder: (context, index) {
                  var banTin = dsBanTinChoDuyetTinBai[index];

                  final statusInfo =
                      TrangthaiColos[banTin.trangThaiChuongTrinhBanTin];

                  final hanXuLyVietTin =
                      DateTime.tryParse(banTin.hanXuLyVietTin ?? "");
                  final formattedDate = hanXuLyVietTin != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLyVietTin)
                      : "Chưa có hạn xử lý";

                  return GestureDetector(
                    onTap: () => controller.onSwitchPage(banTin.id),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        border: Border(bottom: BorderSide(width: 0.3)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên bản tin: ${banTin.ten ?? ""}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tên chương trình: ${banTin.chuongTrinh?.ten ?? "Không có"}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColor.blackColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Hạn hoàn thành: $formattedDate',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColor.blackColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: statusInfo?.backgroundColor ??
                                    AppColor.greyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${banTin.trangThaiChuongTrinhBanTin}',
                                style: TextStyle(
                                  color: statusInfo?.textColor ??
                                      AppColor.blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              onEmpty: EmptyDanhSach(),

              onLoading: SpinKitCircle(
                color: AppColor.blueAccentColor,
              ),

              onError: (error) => Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
