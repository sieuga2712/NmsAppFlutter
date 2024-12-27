import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/core/ultis/custom_snack_bar.dart';
import 'package:nms_app/model/chucnangthuchien/chucnangthuchien_model.dart';
import 'package:nms_app/provider/chucnangthuchien/chucnangthuchien_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';

class ChitietBantinController extends GetxController
    with StateMixin<ChitietBantinModel> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();
  var chucNangThucHienProvider = ChucnangthuchienProvider();
  String? banTinId = Get.arguments["banTinId"];
  String? chuongTrinhId = "";

  Rx<ChitietBantinModel?> chiTietBanTin = Rx<ChitietBantinModel?>(null);
  Rx<ChucnangthuchienModel?> danhSachChucNang =
      Rx<ChucnangthuchienModel?>(null);

  void loadChiTietBanTin() async {
    change(null, status: RxStatus.loading());
    print('banTinId loadChiTietBanTin: $banTinId');
    try {
      await bantinProvider.getChiTietBanTin(banTinId).then((response) async {
        chiTietBanTin.value = response;
        chuongTrinhId = chiTietBanTin.value?.chuongTrinhId;
        await loadVideos();
        await loadChucNangThucHien(banTinId, chuongTrinhId);
        change(chiTietBanTin.value, status: RxStatus.success());
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
            message: value['message']);
        this.loadChiTietBanTin();
      } else {
        CustomSnackBar.showErrorSnackBar(
            context: Get.context,
            title: "Thông báo",
            message: value['error'] ?? 'Có lỗi xảy ra. Vui lòng thử lại sau.');
      }
    } catch (exception) {
      CustomSnackBar.showErrorSnackBar(
          context: Get.context,
          title: "Thông báo",
          message: 'Có lỗi xảy ra. Vui lòng thử lại sau.');
      print('Lỗi: $exception');
    }
  }

  List<VideoPlayerController> _controllers = [];
  List<bool> _isPlaying = [];

  List<VideoPlayerController> get controllers => _controllers;
  List<bool> get isPlaying => _isPlaying;

  // Hàm tải video từ server
  Future<void> loadVideos() async {
    var fileVideos = chiTietBanTin.value?.fileVideo;
    if (fileVideos != null && fileVideos.isNotEmpty) {
      List<String> fileIds = fileVideos.map((e) => e.fileId!).toList();

      try {
        final videoDataList = await bantinProvider.downloadVideoBanTin(fileIds);

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
          print("Video initialized: ${controller.value.isInitialized}");

          if (controller.value.isInitialized) {
            print("Video duration: ${controller.value.duration}");
            _controllers.add(controller);
            _isPlaying.add(false);
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
  }

  void togglePlayPause(int index) {
    if (_isPlaying[index]) {
      _controllers[index].pause(); // Dừng video
    } else {
      _controllers[index].play(); // Phát video
    }
    _isPlaying[index] = !_isPlaying[index];
  }

  @override
  void onInit() {
    super.onInit();
    loadChiTietBanTin();
  }

  @override
  void dispose() {
    super.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
  }
}
