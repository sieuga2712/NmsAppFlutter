import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/global_widget/mausac_trangthai.dart';
import 'package:nms_app/modules/controllers/bantin/danhsachbantin/danhsach_bantin_controller.dart';
import 'package:intl/intl.dart';

class DanhsachBantinView extends GetView<DanhsachBantinController> {
  const DanhsachBantinView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: controller.obx(
              (dsBanTin) => ListView.builder(
                itemCount: dsBanTin!.length,
                itemBuilder: (context, index) {
                  var banTin = dsBanTin[index];

                  final statusInfo =
                      TrangthaiColos[banTin.trangThaiChuongTrinhBanTin];

                  final hanXuLyVietTin =
                      DateTime.tryParse(banTin.hanXuLyVietTin ?? "");
                  final formattedDate = hanXuLyVietTin != null
                      ? DateFormat('dd/MM/yyyy').format(hanXuLyVietTin)
                      : "Chưa có hạn xử lý";

                  List<Widget> children = [
                    Text('Tên bản tin: ${banTin.ten ?? ""}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                        'Tên chương trình: ${banTin.chuongTrinh?.ten ?? "Không có"}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColor.blackColor,
                            )),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      'Hạn hoàn thành: $formattedDate',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColor.blackColor,
                          ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color:
                            statusInfo?.backgroundColor ?? AppColor.greyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${banTin.trangThaiChuongTrinhBanTin}',
                        style: TextStyle(
                          color: statusInfo?.textColor ?? AppColor.blackColor,
                        ),
                      ),
                    ),
                  ];

                  return GestureDetector(
                    onTap: () => controller.onSwitchPage(banTin.id),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        border: Border(bottom: BorderSide(width: 0.3)),
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
                                children: children,
                              ),
                            ),
                          ),
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

  // Hàm xử lý sự kiện khi nhấn vào item
  void onClickItem(banTin) {
    // Logic xử lý khi nhấn vào item
  }
}
