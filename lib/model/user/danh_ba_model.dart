class DanhBaModel {
  bool? success;
  String? message;
  String? storeName;
  int? storeType;
  List<DetailDanhBa>? data;
  Param? param;

  DanhBaModel(
      {this.success,
      this.message,
      this.storeName,
      this.storeType,
      this.data,
      this.param});

  DanhBaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    storeName = json['store_name'];
    storeType = json['store_type'];
    if (json['data'] != null) {
      data = <DetailDanhBa>[];
      json['data'].forEach((v) {
        data!.add(new DetailDanhBa.fromJson(v));
      });
    }
    param = json['param'] != null ? new Param.fromJson(json['param']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['store_name'] = this.storeName;
    data['store_type'] = this.storeType;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.param != null) {
      data['param'] = this.param!.toJson();
    }
    return data;
  }
}

class DetailDanhBa {
  String? id;
  String? parent;
  String? text;
  String? icon;
  LiAttr? liAttr;
  State? state;

  DetailDanhBa(
      {this.id, this.parent, this.text, this.icon, this.liAttr, this.state});

  DetailDanhBa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parent = json['parent'];
    text = json['text'];
    icon = json['icon'];
    liAttr =
        json['li_attr'] != null ? new LiAttr.fromJson(json['li_attr']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent'] = this.parent;
    data['text'] = this.text;
    data['icon'] = this.icon;
    if (this.liAttr != null) {
      data['li_attr'] = this.liAttr!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class LiAttr {
  String? dataId;
  String? dataTenCanBo;
  String? dataChucVu;
  String? dataPhone;
  String? dataEmail;

  LiAttr(
      {this.dataId,
      this.dataTenCanBo,
      this.dataChucVu,
      this.dataPhone,
      this.dataEmail});

  LiAttr.fromJson(Map<String, dynamic> json) {
    dataId = json['data_id'];
    dataTenCanBo = json['data_ten_can_bo'];
    dataChucVu = json['data_chuc_vu'];
    dataPhone = json['data_phone'];
    dataEmail = json['data_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_id'] = this.dataId;
    data['data_ten_can_bo'] = this.dataTenCanBo;
    data['data_chuc_vu'] = this.dataChucVu;
    data['data_phone'] = this.dataPhone;
    data['data_email'] = this.dataEmail;
    return data;
  }
}

class State {
  bool? loaded;
  bool? opened;
  bool? selected;
  bool? disabled;

  State({this.loaded, this.opened, this.selected, this.disabled});

  State.fromJson(Map<String, dynamic> json) {
    loaded = json['loaded'];
    opened = json['opened'];
    selected = json['selected'];
    disabled = json['disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loaded'] = this.loaded;
    data['opened'] = this.opened;
    data['selected'] = this.selected;
    data['disabled'] = this.disabled;
    return data;
  }
}

class Param {
  List<String>? parameternames;

  Param({this.parameternames});

  Param.fromJson(Map<String, dynamic> json) {
    parameternames = json['parameternames'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parameternames'] = this.parameternames;
    return data;
  }
}
