import 'package:nms_app/core/ultis/JsonNull.dart';

class Dsnguyennhan {
  int? nn_id;
  String? ten_nn;

  Dsnguyennhan({this.nn_id, this.ten_nn});

  Dsnguyennhan.fromJson(Map<String, dynamic> json) {
    nn_id = Jsonnull.JsonIntnull(json, 'nn_id');
    ten_nn = Jsonnull.JsonStringnull(json, 'ten_nn');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nn_id'] = nn_id;
    data['ten_nn'] = ten_nn;
    return data;
  }
}
