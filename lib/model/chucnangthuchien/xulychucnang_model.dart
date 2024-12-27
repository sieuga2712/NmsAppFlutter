class XulychucnangModel {
  String? chuongTrinhId;
  String? banTinId;
  String? userId;
  ChucNang? chucNang;

  XulychucnangModel(
      {this.chuongTrinhId, this.banTinId, this.userId, this.chucNang});

  XulychucnangModel.fromJson(Map<String, dynamic> json) {
    chuongTrinhId = json['chuongTrinhId'];
    banTinId = json['banTinId'];
    userId = json['userId'];
    chucNang = json['chucNang'] != null
        ? new ChucNang.fromJson(json['chucNang'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chuongTrinhId'] = this.chuongTrinhId;
    data['banTinId'] = this.banTinId;
    data['userId'] = this.userId;
    if (this.chucNang != null) {
      data['chucNang'] = this.chucNang!.toJson();
    }
    return data;
  }
}

class ChucNang {
  String? tenChucNang;
  String? maTrangThaiTuongUngVoiChucNang;
  String? ghiChu;
  String? mauSac;
  bool? dungOTrangChiTiet;
  bool? dungOTrangChinhSua;

  ChucNang(
      {this.tenChucNang,
      this.maTrangThaiTuongUngVoiChucNang,
      this.ghiChu,
      this.mauSac,
      this.dungOTrangChiTiet,
      this.dungOTrangChinhSua});

  ChucNang.fromJson(Map<String, dynamic> json) {
    tenChucNang = json['tenChucNang'];
    maTrangThaiTuongUngVoiChucNang = json['maTrangThaiTuongUngVoiChucNang'];
    ghiChu = json['ghiChu'];
    mauSac = json['mauSac'];
    dungOTrangChiTiet = json['dungOTrangChiTiet'];
    dungOTrangChinhSua = json['dungOTrangChinhSua'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tenChucNang'] = this.tenChucNang;
    data['maTrangThaiTuongUngVoiChucNang'] =
        this.maTrangThaiTuongUngVoiChucNang;
    data['ghiChu'] = this.ghiChu;
    data['mauSac'] = this.mauSac;
    data['dungOTrangChiTiet'] = this.dungOTrangChiTiet;
    data['dungOTrangChinhSua'] = this.dungOTrangChinhSua;
    return data;
  }
}
