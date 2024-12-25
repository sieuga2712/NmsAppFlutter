import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was Cancled';
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = 'Connect time out';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receing timeout occured';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout';
        break;
      case DioErrorType.connectionError:
        errorMessage = 'No Internet';
        break;
      case DioErrorType.badResponse:
        errorMessage = _handleStatuscode(dioError.response?.statusCode);
        break;
      default:
        errorMessage = 'Something went wrong';
    }
  }
  String _handleStatuscode(int? statuscode) {
    switch (statuscode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Unauthorized';
      case 404:
        return 'The requested resource does not exsist.';
      case 405:
        return 'Medthod not allowed. Please check the Allow header for the allowed HTTP';
      case 415:
        return 'Unsupport Media type. The request content type or version number is';
      case 422:
        return 'Data validation field';
      case 429:
        return 'Too many requests.';
      case 500:
        return 'Internal server error.';
      default:
        return 'Oops something went wrong';
    }
  }
}
