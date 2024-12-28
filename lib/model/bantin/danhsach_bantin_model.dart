class DanhsachBantinModel {
  List<DanhsachBantinData>? items;
  int? totalCount;

  DanhsachBantinModel({this.items, this.totalCount});

  DanhsachBantinModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <DanhsachBantinData>[];
      json['items'].forEach((v) {
        items!.add(new DanhsachBantinData.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class DanhsachBantinData {
  String? id;
  int? soThuTu;
  String? ten;
  String? moTa;
  String? noiDungTin;
  String? hanXuLyVietTin;
  String? hanXuLyDuyetTin;
  String? hanXuLyQuayPhim;
  String? hanXuLySanXuat;
  String? hanXuLyDuyetSanXuat;
  String? chuongTrinhId;
  ChuongTrinh? chuongTrinh;
  String? trangThaiChuongTrinhBanTinId;
  String? trangThaiChuongTrinhBanTin;
  List<PhanCongThucHien>? phanCongThucHien;
  List<FileDinhKem>? fileDinhKem;
  String? ngayCapNhat;
  String? nguoiCapNhat;
  String? canBoCapNhatId;

  DanhsachBantinData(
      {this.id,
      this.soThuTu,
      this.ten,
      this.moTa,
      this.noiDungTin,
      this.hanXuLyVietTin,
      this.hanXuLyDuyetTin,
      this.hanXuLyQuayPhim,
      this.hanXuLySanXuat,
      this.hanXuLyDuyetSanXuat,
      this.chuongTrinhId,
      this.chuongTrinh,
      this.trangThaiChuongTrinhBanTinId,
      this.trangThaiChuongTrinhBanTin,
      this.phanCongThucHien,
      this.fileDinhKem,
      this.ngayCapNhat,
      this.nguoiCapNhat,
      this.canBoCapNhatId});

  DanhsachBantinData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    soThuTu = json['soThuTu'];
    ten = json['ten'];
    moTa = json['moTa'];
    noiDungTin = json['noiDungTin'];
    hanXuLyVietTin = json['hanXuLyVietTin'];
    hanXuLyDuyetTin = json['hanXuLyDuyetTin'];
    hanXuLyQuayPhim = json['hanXuLyQuayPhim'];
    hanXuLySanXuat = json['hanXuLySanXuat'];
    hanXuLyDuyetSanXuat = json['hanXuLyDuyetSanXuat'];
    chuongTrinhId = json['chuongTrinhId'];
    chuongTrinh = json['chuongTrinh'] != null
        ? new ChuongTrinh.fromJson(json['chuongTrinh'])
        : null;
    trangThaiChuongTrinhBanTinId = json['trangThaiChuongTrinhBanTinId'];
    trangThaiChuongTrinhBanTin = json['trangThaiChuongTrinhBanTin'];
    if (json['phanCongThucHien'] != null) {
      phanCongThucHien = <PhanCongThucHien>[];
      json['phanCongThucHien'].forEach((v) {
        phanCongThucHien!.add(new PhanCongThucHien.fromJson(v));
      });
    }
    if (json['fileDinhKem'] != null) {
      fileDinhKem = <FileDinhKem>[];
      json['fileDinhKem'].forEach((v) {
        fileDinhKem!.add(new FileDinhKem.fromJson(v));
      });
    }
    ngayCapNhat = json['ngayCapNhat'];
    nguoiCapNhat = json['nguoiCapNhat'];
    canBoCapNhatId = json['canBoCapNhatId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['soThuTu'] = this.soThuTu;
    data['ten'] = this.ten;
    data['moTa'] = this.moTa;
    data['noiDungTin'] = this.noiDungTin;
    data['hanXuLyVietTin'] = this.hanXuLyVietTin;
    data['hanXuLyDuyetTin'] = this.hanXuLyDuyetTin;
    data['hanXuLyQuayPhim'] = this.hanXuLyQuayPhim;
    data['hanXuLySanXuat'] = this.hanXuLySanXuat;
    data['hanXuLyDuyetSanXuat'] = this.hanXuLyDuyetSanXuat;
    data['chuongTrinhId'] = this.chuongTrinhId;
    if (this.chuongTrinh != null) {
      data['chuongTrinh'] = this.chuongTrinh!.toJson();
    }
    data['trangThaiChuongTrinhBanTinId'] = this.trangThaiChuongTrinhBanTinId;
    data['trangThaiChuongTrinhBanTin'] = this.trangThaiChuongTrinhBanTin;
    if (this.phanCongThucHien != null) {
      data['phanCongThucHien'] =
          this.phanCongThucHien!.map((v) => v.toJson()).toList();
    }
    if (this.fileDinhKem != null) {
      data['fileDinhKem'] = this.fileDinhKem!.map((v) => v.toJson()).toList();
    }
    data['ngayCapNhat'] = this.ngayCapNhat;
    data['nguoiCapNhat'] = this.nguoiCapNhat;
    data['canBoCapNhatId'] = this.canBoCapNhatId;
    return data;
  }
}

class ChuongTrinh {
  String? id;
  String? ten;
  String? moTa;
  String? loaiChuongTrinhId;
  String? loaiChuongTrinh;
  String? loaiQuyTrinhId;
  String? loaiQuyTrinh;
  String? chuyenMucId;
  String? chuyenMuc;
  String? noiDungKichBan;
  String? canBoChiDaoNoiDungId;
  String? canBoChiDaoNoiDung;
  String? canBoChiDaoSanXuatId;
  String? canBoChiDaoSanXuat;
  String? canBoToChucSanXuatId;
  String? canBoToChucSanXuat;
  String? ngayBatDau;
  String? hanXuLy;
  String? hanHoanThanhKichBan;
  String? trangThaiChuongTrinhBanTinId;
  String? trangThaiChuongTrinhBanTin;
  String? donViSanXuatId;
  String? donViSanXuat;
  String? tenantId;
  List<FileDinhKem>? fileDinhKem;
  String? ngayCapNhat;
  String? nguoiCapNhat;
  String? canBoCapNhatId;

  ChuongTrinh(
      {this.id,
      this.ten,
      this.moTa,
      this.loaiChuongTrinhId,
      this.loaiChuongTrinh,
      this.loaiQuyTrinhId,
      this.loaiQuyTrinh,
      this.chuyenMucId,
      this.chuyenMuc,
      this.noiDungKichBan,
      this.canBoChiDaoNoiDungId,
      this.canBoChiDaoNoiDung,
      this.canBoChiDaoSanXuatId,
      this.canBoChiDaoSanXuat,
      this.canBoToChucSanXuatId,
      this.canBoToChucSanXuat,
      this.ngayBatDau,
      this.hanXuLy,
      this.hanHoanThanhKichBan,
      this.trangThaiChuongTrinhBanTinId,
      this.trangThaiChuongTrinhBanTin,
      this.donViSanXuatId,
      this.donViSanXuat,
      this.tenantId,
      this.fileDinhKem,
      this.ngayCapNhat,
      this.nguoiCapNhat,
      this.canBoCapNhatId});

  ChuongTrinh.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    moTa = json['moTa'];
    loaiChuongTrinhId = json['loaiChuongTrinhId'];
    loaiChuongTrinh = json['loaiChuongTrinh'];
    loaiQuyTrinhId = json['loaiQuyTrinhId'];
    loaiQuyTrinh = json['loaiQuyTrinh'];
    chuyenMucId = json['chuyenMucId'];
    chuyenMuc = json['chuyenMuc'];
    noiDungKichBan = json['noiDungKichBan'];
    canBoChiDaoNoiDungId = json['canBoChiDaoNoiDungId'];
    canBoChiDaoNoiDung = json['canBoChiDaoNoiDung'];
    canBoChiDaoSanXuatId = json['canBoChiDaoSanXuatId'];
    canBoChiDaoSanXuat = json['canBoChiDaoSanXuat'];
    canBoToChucSanXuatId = json['canBoToChucSanXuatId'];
    canBoToChucSanXuat = json['canBoToChucSanXuat'];
    ngayBatDau = json['ngayBatDau'];
    hanXuLy = json['hanXuLy'];
    hanHoanThanhKichBan = json['hanHoanThanhKichBan'];
    trangThaiChuongTrinhBanTinId = json['trangThaiChuongTrinhBanTinId'];
    trangThaiChuongTrinhBanTin = json['trangThaiChuongTrinhBanTin'];
    donViSanXuatId = json['donViSanXuatId'];
    donViSanXuat = json['donViSanXuat'];
    tenantId = json['tenantId'];
    if (json['fileDinhKem'] != null) {
      fileDinhKem = <FileDinhKem>[];
      json['fileDinhKem'].forEach((v) {
        fileDinhKem!.add(new FileDinhKem.fromJson(v));
      });
    }
    ngayCapNhat = json['ngayCapNhat'];
    nguoiCapNhat = json['nguoiCapNhat'];
    canBoCapNhatId = json['canBoCapNhatId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten'] = this.ten;
    data['moTa'] = this.moTa;
    data['loaiChuongTrinhId'] = this.loaiChuongTrinhId;
    data['loaiChuongTrinh'] = this.loaiChuongTrinh;
    data['loaiQuyTrinhId'] = this.loaiQuyTrinhId;
    data['loaiQuyTrinh'] = this.loaiQuyTrinh;
    data['chuyenMucId'] = this.chuyenMucId;
    data['chuyenMuc'] = this.chuyenMuc;
    data['noiDungKichBan'] = this.noiDungKichBan;
    data['canBoChiDaoNoiDungId'] = this.canBoChiDaoNoiDungId;
    data['canBoChiDaoNoiDung'] = this.canBoChiDaoNoiDung;
    data['canBoChiDaoSanXuatId'] = this.canBoChiDaoSanXuatId;
    data['canBoChiDaoSanXuat'] = this.canBoChiDaoSanXuat;
    data['canBoToChucSanXuatId'] = this.canBoToChucSanXuatId;
    data['canBoToChucSanXuat'] = this.canBoToChucSanXuat;
    data['ngayBatDau'] = this.ngayBatDau;
    data['hanXuLy'] = this.hanXuLy;
    data['hanHoanThanhKichBan'] = this.hanHoanThanhKichBan;
    data['trangThaiChuongTrinhBanTinId'] = this.trangThaiChuongTrinhBanTinId;
    data['trangThaiChuongTrinhBanTin'] = this.trangThaiChuongTrinhBanTin;
    data['donViSanXuatId'] = this.donViSanXuatId;
    data['donViSanXuat'] = this.donViSanXuat;
    data['tenantId'] = this.tenantId;
    if (this.fileDinhKem != null) {
      data['fileDinhKem'] = this.fileDinhKem!.map((v) => v.toJson()).toList();
    }
    data['ngayCapNhat'] = this.ngayCapNhat;
    data['nguoiCapNhat'] = this.nguoiCapNhat;
    data['canBoCapNhatId'] = this.canBoCapNhatId;
    return data;
  }
}

class FileDinhKem {
  String? chuongTrinhId;
  String? banTinId;
  String? fileId;
  String? loaiFileId;
  String? loaiFile;
  String? tenFile;
  bool? xoa;

  FileDinhKem(
      {this.chuongTrinhId,
      this.banTinId,
      this.fileId,
      this.loaiFileId,
      this.loaiFile,
      this.tenFile,
      this.xoa});

  FileDinhKem.fromJson(Map<String, dynamic> json) {
    chuongTrinhId = json['chuongTrinhId'];
    banTinId = json['banTinId'];
    fileId = json['fileId'];
    loaiFileId = json['loaiFileId'];
    loaiFile = json['loaiFile'];
    tenFile = json['tenFile'];
    xoa = json['xoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chuongTrinhId'] = this.chuongTrinhId;
    data['banTinId'] = this.banTinId;
    data['fileId'] = this.fileId;
    data['loaiFileId'] = this.loaiFileId;
    data['loaiFile'] = this.loaiFile;
    data['tenFile'] = this.tenFile;
    data['xoa'] = this.xoa;
    return data;
  }
}

class PhanCongThucHien {
  String? userId;
  String? maVaiTroSanXuat;

  PhanCongThucHien({this.userId, this.maVaiTroSanXuat});

  PhanCongThucHien.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    maVaiTroSanXuat = json['maVaiTroSanXuat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['maVaiTroSanXuat'] = this.maVaiTroSanXuat;
    return data;
  }
}
