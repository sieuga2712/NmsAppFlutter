import 'package:nms_app/core/ultis/JsonNull.dart';

class Dsdoituong {
  int? loai_kh_id;
  String? ten_loai_kh_id;
  String? mau_sms;

  Dsdoituong({this.loai_kh_id, this.ten_loai_kh_id, this.mau_sms});

  Dsdoituong.fromJson(Map<String, dynamic> json) {
    loai_kh_id = Jsonnull.JsonIntnull(json, 'loai_kh_id');
    ten_loai_kh_id = Jsonnull.JsonStringnull(json, 'ten_loai_kh_id');
    mau_sms = Jsonnull.JsonStringnull(json, 'mau_sms');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loai_kh_id'] = loai_kh_id;
    data['ten_loai_kh_id'] = ten_loai_kh_id;
    data['mau_sms'] = mau_sms;

    return data;
  }
}
