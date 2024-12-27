class ChucnangthuchienModel {
  String? chuongTrinhId;
  String? banTinId;
  String? userId;
  List<DanhSachChucNang>? danhSachChucNang;

  ChucnangthuchienModel(
      {this.chuongTrinhId, this.banTinId, this.userId, this.danhSachChucNang});

  ChucnangthuchienModel.fromJson(Map<String, dynamic> json) {
    chuongTrinhId = json['chuongTrinhId'];
    banTinId = json['banTinId'];
    userId = json['userId'];
    if (json['danhSachChucNang'] != null) {
      danhSachChucNang = <DanhSachChucNang>[];
      json['danhSachChucNang'].forEach((v) {
        danhSachChucNang!.add(new DanhSachChucNang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chuongTrinhId'] = this.chuongTrinhId;
    data['banTinId'] = this.banTinId;
    data['userId'] = this.userId;
    if (this.danhSachChucNang != null) {
      data['danhSachChucNang'] =
          this.danhSachChucNang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DanhSachChucNang {
  String? tenChucNang;
  String? maTrangThaiTuongUngVoiChucNang;
  String? ghiChu;
  String? mauSac;
  bool? dungOTrangChiTiet;
  bool? dungOTrangChinhSua;

  DanhSachChucNang(
      {this.tenChucNang,
      this.maTrangThaiTuongUngVoiChucNang,
      this.ghiChu,
      this.mauSac,
      this.dungOTrangChiTiet,
      this.dungOTrangChinhSua});

  DanhSachChucNang.fromJson(Map<String, dynamic> json) {
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
