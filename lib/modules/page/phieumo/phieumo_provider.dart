import 'dart:io';
import 'package:nms_app/network/api_list.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/network/dio_exception.dart' as dioError;
import 'package:dio/dio.dart';
// ignore: implementation_imports, library_prefixes
import 'package:dio/src/form_data.dart' as fromData;
import 'package:get_storage/get_storage.dart';

class PhieumoProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();
}
