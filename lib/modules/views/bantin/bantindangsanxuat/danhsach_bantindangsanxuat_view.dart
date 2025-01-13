import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:intl/intl.dart';
import 'package:nms_app/global_widget/tra_cuu_box.dart';
import 'package:nms_app/modules/controllers/bantin/dsbantindangsanxuat/danhsach_bantindangsanxuat_controller.dart';

class DanhsachBantinDangsanxuatView
    extends GetView<DanhsachBantinDangsanxuatController> {
  const DanhsachBantinDangsanxuatView({super.key});

  Future<void> _onRefresh() async {
    controller.clearSearch();
    controller.loadDanhSachBantinDangsanxuat();
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TraCuuBox(
            onChanged: controller.setSearchKey,
            controller: controller.searchController,
            focusNode: controller.searchFocusNode,
          ),
          Expanded(
            child: controller.obx(
              (filteredDsBanTinDangSX) =>
                  NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!controller.isLoadingMore.value &&
                      scrollInfo.metrics.pixels >=
                          scrollInfo.metrics.maxScrollExtent * 0.8) {
                    controller.loadMore();
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  displacement: 20.0,
                  strokeWidth: 3,
                  color: AppColor.blueAccentColor,
                  backgroundColor: AppColor.whiteColor,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    itemCount: filteredDsBanTinDangSX!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == filteredDsBanTinDangSX.length) {
                        return Obx(() => controller.isLoadingMore.value
                            ? const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: SpinKitThreeBounce(
                                  color: AppColor.helpBlue,
                                  size: 24.0,
                                ),
                              )
                            : const SizedBox());
                      }

                      var banTin = filteredDsBanTinDangSX[index];
                      final statusInfo =
                          TrangthaiColos[banTin.trangThaiChuongTrinhBanTin];

                      final hanXuLyVietTin =
                          DateTime.tryParse(banTin.hanXuLyVietTin ?? "");
                      final formattedDate = hanXuLyVietTin != null
                          ? DateFormat('dd/MM/yyyy').format(hanXuLyVietTin)
                          : "Chưa có hạn xử lý";

                      return _buildListItem(
                          context, banTin, statusInfo, formattedDate);
                    },
                  ),
                ),
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

  Widget _buildListItem(BuildContext context, dynamic banTin,
      dynamic statusInfo, String formattedDate) {
    return GestureDetector(
      onTap: () => controller.onSwitchPage(banTin.id),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: const Border(bottom: BorderSide(width: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tên bản tin: ${banTin.ten ?? ""}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tên chương trình: ${banTin.chuongTrinh?.ten ?? "Không có"}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.blackColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Hạn hoàn thành: $formattedDate',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.blackColor,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color:
                            statusInfo?.backgroundColor ?? AppColor.greyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${banTin.trangThaiChuongTrinhBanTin}',
                        style: TextStyle(
                          color: statusInfo?.textColor ?? AppColor.blackColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
