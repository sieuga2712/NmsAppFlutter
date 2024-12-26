import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nms_app/network/api_provider.dart';
import 'package:nms_app/model/login/login_model.dart';

class LoginProvider {
  final dio = ApiRoot().dio;
  static const String _tokenEndpoint = '/connect/token';
  static const int maxRetries = 3;

  Future<LoginModel?> exchangeCodeForToken(
      String code, String clientId, String redirectUri) async {
    try {
      final formData = {
        'grant_type': 'authorization_code',
        'code': code,
        'redirect_uri': redirectUri,
        'client_id': clientId,
      };

      final response = await _makeTokenRequest(formData);

      return response;
    } catch (e) {
      debugPrint('Final error in exchangeCodeForToken: $e');
      return null;
    }
  }

  Future<LoginModel?> refreshAccessToken(
      String refreshToken, String clientId) async {
    try {
      final formData = {
        'grant_type': 'refresh_token',
        'refresh_token': refreshToken,
        'client_id': clientId,
      };

      final response = await _makeTokenRequest(formData);
      return response;
    } catch (e) {
      debugPrint('Final error in refreshAccessToken: $e');
      return null;
    }
  }

  Future<LoginModel?> _makeTokenRequest(Map<String, dynamic> formData,
      {int retryCount = 0}) async {
    try {
      final response = await dio.post(
        _tokenEndpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          validateStatus: (status) => status != null && status < 500,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        return LoginModel.fromJson(response.data);
      } else if (response.statusCode == 401 && retryCount < maxRetries) {
        await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
        return _makeTokenRequest(formData, retryCount: retryCount + 1);
      } else {
        debugPrint('Error response: ${response.statusCode} - ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        if (retryCount < maxRetries) {
          await Future.delayed(Duration(seconds: pow(2, retryCount).toInt()));
          return _makeTokenRequest(formData, retryCount: retryCount + 1);
        }
      }
      debugPrint('DioError: ${e.message}');
      debugPrint('Error response: ${e.response?.data}');
      rethrow;
    }
  }
}
