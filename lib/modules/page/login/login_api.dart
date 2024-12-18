import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  static String accessToken = "";
  static const String _baseUrl = "https://your-api/api";
  static Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    HttpHeaders.authorizationHeader: "Bearer $accessToken",
  };

  static Future<Response> getUserDetails() async {
    final url = '$_baseUrl/Accont/Login';
    Uri uri = Uri.parse(url);
    final response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: "Bearer $accessToken"},
    );

    return response;
  }
}
