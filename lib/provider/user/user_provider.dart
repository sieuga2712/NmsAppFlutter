import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/user/danh_ba_model.dart';
import 'package:nms_app/network/api_provider.dart';

class UserProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<DanhBaModel> getDanhDaTheoDonVi() async {
    try {
      final response =
          await dio.get('/api/app/chuong-trinh/dashboard-xu-ly-ca-nhan');
      print('response: $response');
      return DanhBaModel.fromJson(response.data);
    } catch (exception) {
      print('response: $exception');
      return Future.error(exception.toString());
    }
  }
}
