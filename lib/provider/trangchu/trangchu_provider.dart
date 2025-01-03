import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:nms_app/network/api_provider.dart';

class TrangChuProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<List<TrangchuModel>> getTrangChu() async {
    try {
      final response =
          await dio.get('/api/app/chuong-trinh/dashboard-xu-ly-ca-nhan');

      if (response.data is List) {
        return (response.data as List)
            .map((item) => TrangchuModel.fromJson(item))
            .toList();
      } else {
        throw Exception('Data format is not correct');
      }
    } catch (exception) {
      print('Provider error: $exception');
      rethrow;
    }
  }
}
