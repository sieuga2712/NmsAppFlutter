import 'dart:io';
import 'package:cskhpto/network/api_list.dart';
import 'package:cskhpto/network/api_provider.dart';
import 'package:cskhpto/network/dio_exception.dart' as dioError;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
// ignore: implementation_imports, library_prefixes
import 'package:dio/src/form_data.dart' as fromData;
import 'package:get_storage/get_storage.dart';

class HomeProvider {
  final dio = ApiRoot().dio;
  final GetStorage _store = GetStorage();
}
