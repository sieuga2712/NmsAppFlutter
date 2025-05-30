import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/global_widget/approval_popup.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/provider/chucnangthuchien/chucnangthuchien_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';

class ChitietBantinKhongDuyetTinController extends GetxController
    with StateMixin<ChitietBantinModel>, WidgetsBindingObserver {
  var storage = GetStorage();
  var banTinProvider = BantinProvider();
  var chucNangThucHienProvider = ChucnangthuchienProvider();
  String? banTinId = Get.arguments["banTinId"];
  String? chuongTrinhId = "";

  Rx<ChitietBantinModel?> chiTietBanTin = Rx<ChitietBantinModel?>(null);
  Rx<ChucnangthuchienModel?> danhSachChucNang =
      Rx<ChucnangthuchienModel?>(null);

  void loadChiTietBanTinKhongDuyetTin() async {
    change(null, status: RxStatus.loading());
    print('banTinId loadChiTietBanTin: $banTinId');
    try {
      await banTinProvider.getChiTietBanTin(banTinId).then((response) async {
        chiTietBanTin.value = response;
        chuongTrinhId = chiTietBanTin.value?.chuongTrinhId;
        await loadChucNangThucHien(banTinId, chuongTrinhId);
        change(chiTietBanTin.value, status: RxStatus.success());
        loadVideos();
      });
    } catch (exception) {
      print('Lỗi: $exception');
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  Future<void> loadChucNangThucHien(
      String? banTinId, String? chuongTrinhId) async {
    try {
      await chucNangThucHienProvider
          .getChucNangThucHien(banTinId, chuongTrinhId)
          .then((response) {
        danhSachChucNang.value = response;
      });
    } catch (exception) {
      print('Lỗi: $exception');
    }
  }

  void xuLyChucNang(chucNang) async {
    print('chucNang: ${chucNang.tenChucNang}');

    Get.dialog(
      ApprovalPopup(
        title: chucNang.tenChucNang ?? '',
        onConfirm: (String noiDungXuLy) {
          chucNang.ghiChu = noiDungXuLy;
          _processChucNang(chucNang);
        },
        onCancel: () {},
      ),
    );
  }

  void _processChucNang(chucNang) async {
    var data = {
      "chuongTrinhId": chuongTrinhId,
      "banTinId": banTinId,
      "userId": "00000000-0000-0000-0000-000000000000",
      "chucNang": {
        "tenChucNang": chucNang.tenChucNang,
        "maTrangThaiTuongUngVoiChucNang":
            chucNang.maTrangThaiTuongUngVoiChucNang,
        "ghiChu": chucNang.ghiChu,
        "mauSac": chucNang.mauSac,
        "dungOTrangChiTiet": chucNang.dungOTrangChiTiet,
        "dungOTrangChinhSua": chucNang.dungOTrangChinhSua,
      },
    };

    print('data: $data');

    try {
      var value =
          await chucNangThucHienProvider.xuLyChuongTrinhBanTinByInput(data);

      if (value['isSuccess'] == true) {
        CustomSnackBar.showSuccessSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: value['message'],
        );
        loadChiTietBanTinKhongDuyetTin();
      } else {
        CustomSnackBar.showErrorSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: value['error'] ?? 'Có lỗi xảy ra. Vui lòng thử lại sau.',
        );
      }
    } catch (exception) {
      print('Lỗi: $exception');
      CustomSnackBar.showErrorSnackBar(
        context: Get.context,
        title: "Thông báo",
        message: 'Có lỗi xảy ra. Vui lòng thử lại sau.',
      );
    }
  }

  List<VideoPlayerController> _controllers = [];
  RxList<bool> _isPlaying = <bool>[].obs;
  RxList<bool> _showControls = <bool>[].obs;

  List<VideoPlayerController> get controllers => _controllers;
  List<bool> get isPlaying => _isPlaying;
  List<bool> get showControls => _showControls;
  RxBool isVideoLoading = true.obs;

  // Hàm tải video từ server
  Future<void> loadVideos() async {
    isVideoLoading.value = true;
    for (var controller in _controllers) {
      controller.pause();
      controller.dispose();
    }
    _controllers.clear();
    _isPlaying.clear();
    _showControls.clear();
    var fileVideos = chiTietBanTin.value?.fileVideo;
    if (fileVideos != null && fileVideos.isNotEmpty) {
      List<String> fileIds = fileVideos.map((e) => e.fileId!).toList();

      try {
        final videoDataList = await banTinProvider.downloadVideoBanTin(fileIds);

        for (int i = 0; i < videoDataList.length; i++) {
          var videoData = videoDataList[i];
          print("Element $i type: ${videoData.runtimeType}");
          print("Element $i length: ${videoData.length}");

          if (videoData is String) {
            final response = await Dio().get<List<int>>(
              videoData,
              options: Options(responseType: ResponseType.bytes),
            );
            videoData = response.data!;
          }

          // Lưu video vào bộ nhớ tạm
          final directory = await getTemporaryDirectory();
          final file = File('${directory.path}/video_${fileIds[i]}.mp4');
          await file.writeAsBytes(videoData);
          print("Video saved at: ${file.path}");

          bool fileExists = await file.exists();
          print("Video file exists: $fileExists");

          if (fileExists) {
            print("Video file path: ${file.path}");
          }

          VideoPlayerController controller = VideoPlayerController.file(file);
          await controller.initialize();
          controller.setLooping(true);
          print("Video initialized: ${controller.value.isInitialized}");

          if (controller.value.isInitialized) {
            print("Video duration: ${controller.value.duration}");
            _controllers.add(controller);
            _isPlaying.add(false);
            _showControls.add(true);
            controller.setLooping(true);
          } else {
            print("Failed to initialize video controller");
          }
        }
      } catch (e) {
        print("Lỗi tải video: $e");
      }
    } else {
      print('Không có video để tải.');
    }
    isVideoLoading.value = false;
  }

  void togglePlayPause(int index) {
    // Dừng tất cả các video khác
    for (int i = 0; i < _controllers.length; i++) {
      if (i != index && _isPlaying[i]) {
        _controllers[i].pause();
        _isPlaying[i] = false;
      }
    }

    if (_isPlaying[index]) {
      _controllers[index].pause();
      _showControls[index] = true;
    } else {
      _controllers[index].play();
      _showControls[index] = true;

      Future.delayed(const Duration(seconds: 2), () {
        if (_isPlaying[index]) {
          _showControls[index] = false;
        }
      });
    }

    _isPlaying[index] = !_isPlaying[index];
    _isPlaying.refresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      for (var controller in _controllers) {
        controller.pause();
        controller.seekTo(Duration.zero);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadChiTietBanTinKhongDuyetTin();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.pause();
      controller.dispose();
    }
  }

  @override
  void onClose() {
    for (var controller in _controllers) {
      controller.pause();
      controller.seekTo(Duration.zero);
      controller.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }
}
