import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nms_app/core/theme/app_theme.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/empty_danh_sach.dart';
import 'package:nms_app/global_widget/tra_cuu_box.dart';
import 'package:nms_app/modules/controllers/user/danh_ba_controlller.dart';

class DanhBaView extends GetView<DanhBaControlller> {
  const DanhBaView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TraCuuBox(onChanged: controller.searchCanBo),
          Expanded(
              child: controller.obx(
            (danhBa) => ListView.builder(
              itemCount: danhBa!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.makePhoneCall(
                        'tel:+84${danhBa[index].dataPhone!.substring(1)}');
                  },
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${danhBa[index].dataTenCanBo} - ${danhBa[index].dataPhone}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontSize: FontSizeSmall,
                                  color: AppColor.blackColor),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (danhBa[index].dataEmail != null)
                              Row(
                                children: [
                                  Text(
                                    'Email: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColor.greyColor),
                                  ),
                                  Expanded(
                                    child: Text(
                                      danhBa[index].dataEmail ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: FontSizeSmall),
                                    ),
                                  ),
                                ],
                              ),
                            if (danhBa[index].dataChucVu != null)
                              Row(
                                children: [
                                  Text(
                                    'Chức vụ: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: AppColor.greyColor),
                                  ),
                                  Expanded(
                                    child: Text(
                                      danhBa[index].dataChucVu ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: FontSizeSmall),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        dense: true,
                      ),
                      const Divider(
                        height: 1,
                        color: AppColor.greyColor,
                      )
                    ],
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
          ))
        ],
      ),
    );
  }
}
