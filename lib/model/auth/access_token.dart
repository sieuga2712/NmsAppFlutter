// To parse this JSON data, do
//
//     final accessToken = accessTokenFromJson(jsonString);

import 'dart:convert';

AccessToken accessTokenFromJson(String str) =>
    AccessToken.fromJson(json.decode(str));

String accessTokenToJson(AccessToken data) => json.encode(data.toJson());

class AccessToken {
  bool success;
  String message;
  Data data;
  dynamic storeName;
  int storeType;
  dynamic param;

  AccessToken({
    required this.success,
    required this.message,
    required this.data,
    this.storeName,
    required this.storeType,
    this.param,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        storeName: json["store_name"],
        storeType: json["store_type"],
        param: json["param"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
        "store_name": storeName,
        "store_type": storeType,
        "param": param,
      };
}

class Data {
  String accessToken;
  int expire;
  String refreshToken;

  Data({
    required this.accessToken,
    required this.expire,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        expire: json["expire"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "expire": expire,
        "refresh_token": refreshToken,
      };
}
