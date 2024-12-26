import 'package:nms_app/core/values/app_images.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrangchuView extends GetView<TrangchuController> {
  @override
  final TrangchuController controller = Get.find();

  TrangchuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 26),
              controller.obx(
                (data) => _buildContent(data),
                onLoading: const Center(child: CircularProgressIndicator()),
                onError: (error) => Center(
                  child: Text('Đã xảy ra lỗi: $error'),
                ),
                onEmpty: const Center(
                  child: Text('Không có dữ liệu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<TrangchuModel?>? data) {
    if (data == null || data.isEmpty) {
      return const Center(child: Text('Không có dữ liệu'));
    }

    var items = data.first?.items ?? [];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.length >= 2
              ? [
                  _buildCard(
                    items[0].count?.toString() ?? '0',
                    items[0].description ?? '',
                    const [Color(0xFF4328EA), Color(0xFFF5F3FF)],
                  ),
                  _buildCard(
                    items[1].count?.toString() ?? '0',
                    items[1].description ?? '',
                    const [Color(0xFFEA3F28), Color(0xFFFDEAE7)],
                  ),
                ]
              : [],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.length >= 4
              ? [
                  _buildCard(
                    items[2].count?.toString() ?? '0',
                    items[2].description ?? '',
                    const [Color(0xFF0084FF), Color(0xFFE3F1FF)],
                  ),
                  _buildCard(
                    items[3].count?.toString() ?? '0',
                    items[3].description ?? '',
                    const [Color(0xFFEA2891), Color(0xFFFDE7F3)],
                  ),
                ]
              : [],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset(
          AppImages.logoPTV,
          width: 162,
          height: 70,
          fit: BoxFit.fill,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Image.asset(
            AppImages.iconUser,
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String number, String title, List<Color> gradientColors) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          begin: const Alignment(-1, 1),
          end: const Alignment(3, 1),
          colors: gradientColors,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          const SizedBox(height: 26),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 40),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.2,
              ),
            ),
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {
              // Add action here
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 3),
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chi tiết",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward, size: 13, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
