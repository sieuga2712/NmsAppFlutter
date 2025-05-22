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

    var items = data.first?.items ?? [];
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardSpacing = 12.0;

        return Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (items.isNotEmpty)
                    Expanded(
                      child: StatCard(
                          title: items[0].description ?? 'N/A',
                          value: items[0].count?.toString() ?? '0',
                          colors: const [
                            Color(0xFF4328EA),
                            Color.fromARGB(255, 182, 168, 254)
                          ],
                          progress:
                              items[0].count != null ? items[0].count! / 56 : 0,
                          onTap: () {
                            GetStorage().write('trangThaiChuongTrinh',
                                'ChuongTrinhDangSoanThao');
                            if (Get.isRegistered<
                                DanhsachChuongtrinhController>()) {
                              final controller =
                                  Get.find<DanhsachChuongtrinhController>();
                              controller.trangThaiChuongTrinh.value =
                                  'ChuongTrinhDangSoanThao';
                              controller.loadDanhSachChuongTrinh();
                            }

                            navigator('danhsachchuongtrinh');
                          }),
                    ),
                  SizedBox(width: cardSpacing),
                  if (items.length > 1)
                    Expanded(
                      child: StatCard(
                          title: items[1].description ?? 'N/A',
                          value: items[1].count?.toString() ?? '0',
                          colors: const [
                            Color(0xFFEA3F28),
                            Color.fromARGB(255, 249, 166, 155)
                          ],
                          progress:
                              items[1].count != null ? items[1].count! / 56 : 0,
                          onTap: () {
                            GetStorage()
                                .write('trangThaiChuongTrinh', 'DaXuatBan');
                            if (Get.isRegistered<
                                DanhsachChuongtrinhController>()) {
                              final controller =
                                  Get.find<DanhsachChuongtrinhController>();
                              controller.trangThaiChuongTrinh.value =
                                  'DaXuatBan';
                              controller.loadDanhSachChuongTrinh();
                            }
                            navigator('danhsachchuongtrinh');
                          }),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (items.length > 2)
                    Expanded(
                      child: StatCard(
                          title: items[2].description ?? 'N/A',
                          value: items[2].count?.toString() ?? '0',
                          colors: const [
                            Color(0xFF0084FF),
                            Color.fromARGB(255, 165, 210, 252)
                          ],
                          progress:
                              items[2].count != null ? items[2].count! / 56 : 0,
                          onTap: () {
                            GetStorage().write('trangThaiChuongTrinh',
                                'ChuongTrinhDangChoDuyet');
                            if (Get.isRegistered<
                                DanhsachChuongtrinhController>()) {
                              final controller =
                                  Get.find<DanhsachChuongtrinhController>();
                              controller.trangThaiChuongTrinh.value =
                                  'ChuongTrinhDangChoDuyet';
                              controller.loadDanhSachChuongTrinh();
                            }
                            navigator('danhsachchuongtrinh');
                          }),
                    ),
                  SizedBox(width: cardSpacing),
                  if (items.length > 3)
                    Expanded(
                      child: StatCard(
                          title: items[3].description ?? 'N/A',
                          value: items[3].count?.toString() ?? '0',
                          colors: const [
                            Color(0xFFEA2891),
                            Color.fromARGB(255, 249, 161, 209)
                          ],
                          progress:
                              items[3].count != null ? items[3].count! / 56 : 0,
                          onTap: () {
                            GetStorage().write(
                                'trangThaiChuongTrinh', 'KhongPheDuyetKichBan');
                            if (Get.isRegistered<
                                DanhsachChuongtrinhController>()) {
                              final controller =
                                  Get.find<DanhsachChuongtrinhController>();
                              controller.trangThaiChuongTrinh.value =
                                  'KhongPheDuyetKichBan';
                              controller.loadDanhSachChuongTrinh();
                            }
                            navigator('danhsachchuongtrinh');
                          }),
                    ),
                ],
              ),
            ),
          ],
        );
      },
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
