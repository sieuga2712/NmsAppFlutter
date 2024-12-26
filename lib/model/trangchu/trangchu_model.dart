class TrangchuModel {
  String? tenDonVi;
  int? donViId;
  String? linkDanhSach;
  List<TrangchuData>? items;

  TrangchuModel({this.tenDonVi, this.donViId, this.linkDanhSach, this.items});

  TrangchuModel.fromJson(Map<String, dynamic> json) {
    tenDonVi = json['tenDonVi'];
    donViId = json['donViId'];
    linkDanhSach = json['linkDanhSach'];
    if (json['items'] != null) {
      items = <TrangchuData>[];
      json['items'].forEach((v) {
        items!.add(TrangchuData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenDonVi'] = this.tenDonVi;
    data['donViId'] = this.donViId;
    data['linkDanhSach'] = this.linkDanhSach;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrangchuData {
  int? count;
  String? description;
  String? bgColor;
  String? iconClass;
  String? url;

  TrangchuData(
      {this.count, this.description, this.bgColor, this.iconClass, this.url});

  TrangchuData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    description = json['description'];
    bgColor = json['bgColor'];
    iconClass = json['iconClass'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['bgColor'] = this.bgColor;
    data['iconClass'] = this.iconClass;
    data['url'] = this.url;
    return data;
  }
}
