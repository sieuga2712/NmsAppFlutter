import 'package:nms_app/core/ultis/JsonNull.dart';

class LoginModel {
  bool? loginsuccess;
  int? nhomquyen;
  int? nhanvienid;
  String? email;
  String? manhanvien;
  String? tennhanvien;

  List<arrobjdonvi>? arrdv;

  LoginModel({
    this.loginsuccess,
    this.nhomquyen,
    this.nhanvienid,
    this.email,
    this.manhanvien,
    this.tennhanvien,
    this.arrdv,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    loginsuccess = Jsonnull.JsonBoolnull(json, 'loginsuccess');
    nhomquyen = Jsonnull.JsonIntnull(json, 'nhomquyen');
    nhanvienid = Jsonnull.JsonIntnull(json, 'nhanvienid');
    email = Jsonnull.JsonStringnull(json, 'email');
    manhanvien = Jsonnull.JsonStringnull(json, 'manhanvien');
    tennhanvien = Jsonnull.JsonStringnull(json, 'tennhanvien');
    if (json['arrobjdonvi'] != null) {
      arrdv = <arrobjdonvi>[];
      json['arrobjdonvi'].forEach((v) {
        arrdv!.add(arrobjdonvi.fromJson(v));
      });
    }
    // ignore: unnecessary_new
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loginsuccess'] = loginsuccess;
    data['nhomquyen'] = nhomquyen;
    data['nhanvienid'] = nhanvienid;
    data['email'] = email;
    data['manhanvien'] = manhanvien;
    data['tennhanvien'] = tennhanvien;
    if (this.arrdv != null) {
      data['arrdv'] = this.arrdv!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class arrobjdonvi {
  int? donvi_id;
  String? ten_dv;

  arrobjdonvi({this.donvi_id, this.ten_dv});

  arrobjdonvi.fromJson(Map<String, dynamic> json) {
    donvi_id = Jsonnull.JsonIntnull(json, 'donvi_id');
    ten_dv = Jsonnull.JsonStringnull(json, 'ten_dv');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['donvi_id'] = donvi_id;
    data['ten_dv'] = ten_dv;
    return data;
  }
}
