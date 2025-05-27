import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/values/app_color.dart';
import 'package:nms_app/global_widget/trangchu/oval_clipper.dart';
import 'package:nms_app/global_widget/trangchu/stat_card.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:nms_app/modules/controllers/chuongtrinh/dschuongtrinh/danhsach_chuongtrinh_controller.dart';
import 'package:nms_app/modules/controllers/trangchu/trangchu_controller.dart';
import 'package:nms_app/router.dart';

class TrangchuView extends GetView<TrangchuController> {
  @override
  final TrangchuController controller = Get.find();
  TrangchuView({super.key});

  final double _scale = 2;

  Future<void> _onRefresh() async {
    controller.getTrangChu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        color: AppColor.blueAccentColor,
        backgroundColor: Colors.white,
        strokeWidth: 3,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  _buildBackgroundCurve(constraints, context),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                          controller.obx(
                            (data) => _buildContent(data, context),
                            onLoading: const Center(
                                child: CircularProgressIndicator()),
                            onError: (error) =>
                                Center(child: Text('Đã xảy ra lỗi: $error')),
                            onEmpty:
                                const Center(child: Text('Không có dữ liệu')),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundCurve(
      BoxConstraints constraints, BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: -screenHeight * 0.355,
      left: 0,
      right: 0,
      child: Transform.scale(
        scale: _scale,
        child: ClipPath(
          clipper: OvalClipper(borderRadiusPercentage: 0.99),
          child: Container(
            height: screenHeight * 0.34,
            decoration: const BoxDecoration(
              color: Color(0xFF0277BD),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(76, 0, 0, 0),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<TrangchuModel?>? data, BuildContext context) {
    if (data == null || data.isEmpty) {
      return const Center(child: Text('Không có dữ liệu'));
    }

    final items = (data.first?.items ?? []).take(4).toList(); // Giới hạn 4 item

    // Mapping từ description → trangThaiChuongTrinh
    final Map<String, String> trangThaiMapping = {
      'Chương trình đang SX': 'ChuongTrinhDangSanXuat',
      'Chờ phê duyệt KB': 'ChuongTrinhCanLanhDaoPheDuyet',
      'Chờ duyệt tin bài': 'ChuongTrinhCanLanhDaoPheDuyet',
      'Chờ duyệt Video': 'ChoDuyetVideo',
      'Chương trình soạn thảo': 'ChuongTrinhDangSoanThao',
      'Đã xuất bản': 'DaXuatBan',
      'Chương trình đang chờ duyệt': 'ChuongTrinhDangChoDuyet',
      'Không phê duyệt kịch bản': 'KhongPheDuyetKichBan',
      'Kịch bản bị trả': 'KhongPheDuyetKichBan',
    };

    final cardSpacing = 12.0;

    List<Color> _getCardColors(int index) {
      const defaultColors = [
        [Color(0xFF1565C0), Color(0xFF90CAF9)],
        [Color(0xFFC62828), Color(0xFFFFCDD2)],
        [Color(0xFF2E7D32), Color(0xFFA5D6A7)],
        [Color(0xFF6A1B9A), Color(0xFFE1BEE7)],
      ];

      return defaultColors[index % defaultColors.length];
    }

    List<Widget> _buildRows() {
      List<Widget> rows = [];

      for (int i = 0; i < items.length; i += 2) {
        final rowChildren = <Widget>[];

        for (int j = i; j < i + 2 && j < items.length; j++) {
          final item = items[j];
          final desc = item.description ?? '';
          final trangThai = trangThaiMapping[desc];

          rowChildren.add(
            Expanded(
              child: StatCard(
                title: desc,
                value: item.count?.toString() ?? '0',
                colors: _getCardColors(j),
                progress: (item.count ?? 0) / 56,
                onTap: () {
                  if (trangThai != null) {
                    GetStorage().write('trangThaiChuongTrinh', trangThai);
                    if (Get.isRegistered<DanhsachChuongtrinhController>()) {
                      final controller =
                          Get.find<DanhsachChuongtrinhController>();
                      controller.trangThaiChuongTrinh.value = trangThai;
                      controller.loadDanhSachChuongTrinh();
                    }
                    navigator('danhsachchuongtrinh');
                  }
                },
              ),
            ),
          );

          if (j < i + 1 && j + 1 < items.length) {
            rowChildren.add(SizedBox(width: cardSpacing));
          }
        }

        rows.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: rowChildren,
              ),
            ),
          ),
        );
      }

      return rows;
    }

    return Column(
      children: _buildRows(),
    );
  }

  void navigator(String maScreen) {
    switch (maScreen) {
      case 'danhsachchuongtrinh':
        Get.offNamed(Routers.DSCHUONGTRINH);
        break;
      default:
        break;
    }
  }
}
