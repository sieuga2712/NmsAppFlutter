import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/core/values/app_theme_values.dart';
import 'package:nms_app/model/ultis/thuebaohong.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemListPhieu extends StatelessWidget {
  final thuebaohong thuebao;
  final VoidCallback onClickItem;
  const ItemListPhieu({
    super.key,
    required this.thuebao,
    required this.onClickItem,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(thuebao.thoi_gian_bao_hong
        .toString()); // Chuyển chuỗi sang đối tượng DateTime

    // Định dạng ngày theo dd/mm/yyyy
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    // Định dạng giờ theo hh:mm:ss
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5, // Độ dày của viền
                ),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  formattedTime,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: AppSizeValues.FontSizeMedium,
                                      color: AppColor.helpBlue),
                                ),
                                Text(
                                  formattedDate,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColor.greyColor,
                                      fontSize: AppSizeValues.FontSizeTiny),
                                )
                              ],
                            )))),
                Expanded(
                    flex: 7,
                    child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  thuebao.ten_tb.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: AppSizeValues.FontSizeSmall,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  thuebao.dia_chi.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: AppColor.greyColor,
                                      fontSize: AppSizeValues.FontSizeTiny),
                                )
                              ],
                            ))))
              ],
            )));
  }
}
