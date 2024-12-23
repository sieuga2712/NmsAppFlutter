import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/trangchu/trangchu_model.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/network/dio_exception.dart' as dioError;
import 'package:nms_app/provider/api/trangchu_api.dart';

class TrangChuProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();

  Future<TrangchuModel> getTrangChu() async {
    try {
      final response = await dio.get(TrangchuApi.TRANG_CHU);
      return TrangchuModel.fromJson(response.data);
    } on DioError catch (err) {
      final errorMessage =
          dioError.DioException.fromDioError(err).errorMessage.toString();
      print('errorMessage: $errorMessage');
      return Future.error(errorMessage);
    } catch (exception) {
      print('errorMessage: ${exception.toString()}');
      return Future.error(exception.toString());
    }
  }
}
