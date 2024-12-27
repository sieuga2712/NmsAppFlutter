import 'package:nms_app/core/values/get_storage_key.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/provider/trangchu/trangchu_provider.dart';

class TrangchuController extends GetxController
    with StateMixin<List<TrangchuModel?>> {
  final trangChuProvider = TrangChuProvider();
  var storage = GetStorage();
  var selectDonVi = "".obs;
  var dataList = <TrangchuModel?>[].obs;
  var isLoading = true.obs;

  void saveInfoAccount() async {
    selectDonVi.value = storage.read(GetStorageKey.donviId)?.toString() ?? "";
  }

  void getTrangChu() async {
    try {
      isLoading(true);
      final response = await trangChuProvider.getTrangChu();

      dataList.clear();
      dataList.addAll(response);

      print('Controller Data: $dataList');
      change(dataList, status: RxStatus.success());
    } catch (e) {
      print('Controller error: $e');
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    saveInfoAccount();
    getTrangChu();
  }
}