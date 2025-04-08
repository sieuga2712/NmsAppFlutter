import 'package:nms_app/model/bantin/chitiet_bantin_model.dart';

class DanhsachBantinCanxulyModel {
  String? id;
  String? ten;
  String? moTa;
  int? soThuTu;
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
  List<FileDinhKemTin>? fileDinhKemTin;
  List<FileVideo>? fileVideo;
  String? thongTinNhuanBut;
  String? khuVucTinId;
  String? khuVucTin;
  String? theLoaiTinId;
  String? theLoaiTin;
  String? viTriFile;
  bool? fanpage;

  DanhsachBantinCanxulyModel(
      {this.id,
      this.ten,
      this.moTa,
      this.soThuTu,
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
      this.fileDinhKemTin,
      this.fileVideo,
      this.thongTinNhuanBut,
      this.khuVucTinId,
      this.khuVucTin,
      this.theLoaiTinId,
      this.theLoaiTin,
      this.viTriFile,
      this.fanpage});

  DanhsachBantinCanxulyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ten = json['ten'];
    moTa = json['moTa'];
    soThuTu = json['soThuTu'];
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
    if (json['fileDinhKemTin'] != null) {
      fileDinhKemTin = <FileDinhKemTin>[];
      json['fileDinhKemTin'].forEach((v) {
        fileDinhKemTin!.add(new FileDinhKemTin.fromJson(v));
      });
    }
    if (json['fileVideo'] != null) {
      fileVideo = <FileVideo>[];
      json['fileVideo'].forEach((v) {
        fileVideo!.add(new FileVideo.fromJson(v));
      });
    }
    thongTinNhuanBut = json['thongTinNhuanBut'];
    khuVucTinId = json['khuVucTinId'];
    khuVucTin = json['khuVucTin'];
    theLoaiTinId = json['theLoaiTinId'];
    theLoaiTin = json['theLoaiTin'];
    viTriFile = json['viTriFile'];
    fanpage = json['fanpage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ten'] = this.ten;
    data['moTa'] = this.moTa;
    data['soThuTu'] = this.soThuTu;
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
    if (this.fileDinhKemTin != null) {
      data['fileDinhKemTin'] =
          this.fileDinhKemTin!.map((v) => v.toJson()).toList();
    }
    if (this.fileVideo != null) {
      data['fileVideo'] = this.fileVideo!.map((v) => v.toJson()).toList();
    }
    data['thongTinNhuanBut'] = this.thongTinNhuanBut;
    data['khuVucTinId'] = this.khuVucTinId;
    data['khuVucTin'] = this.khuVucTin;
    data['theLoaiTinId'] = this.theLoaiTinId;
    data['theLoaiTin'] = this.theLoaiTin;
    data['viTriFile'] = this.viTriFile;
    data['fanpage'] = this.fanpage;
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
  String? thongTinNhuanBut;
  bool? tinhNhuanBut;
  bool? khoTinCuaPhong;
  bool? expand;

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
      this.canBoCapNhatId,
      this.thongTinNhuanBut,
      this.tinhNhuanBut,
      this.khoTinCuaPhong,
      this.expand});

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
    thongTinNhuanBut = json['thongTinNhuanBut'];
    tinhNhuanBut = json['tinhNhuanBut'];
    khoTinCuaPhong = json['khoTinCuaPhong'];
    expand = json['expand'];
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
    data['thongTinNhuanBut'] = this.thongTinNhuanBut;
    data['tinhNhuanBut'] = this.tinhNhuanBut;
    data['khoTinCuaPhong'] = this.khoTinCuaPhong;
    data['expand'] = this.expand;
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
  String? id;
  String? userId;
  String? userName;
  String? maVaiTroSanXuat;
  String? tenVaiTroSanXuat;
  String? vaiTroSanXuatId;
  String? khuVucTin;
  String? khuVucTinId;
  String? bacNhuanBut;
  String? bacNhuanButId;
  String? loaiNhuanBut;
  String? loaiNhuanButId;
  int? diemNhuanBut;
  int? donGiaNhuanBut;
  int? heSoKhuVuc;
  bool? coThayDoiDiemNhuanBut;
  String? ghiChuNhuanBut;

  PhanCongThucHien(
      {this.id,
      this.userId,
      this.userName,
      this.maVaiTroSanXuat,
      this.tenVaiTroSanXuat,
      this.vaiTroSanXuatId,
      this.khuVucTin,
      this.khuVucTinId,
      this.bacNhuanBut,
      this.bacNhuanButId,
      this.loaiNhuanBut,
      this.loaiNhuanButId,
      this.diemNhuanBut,
      this.donGiaNhuanBut,
      this.heSoKhuVuc,
      this.coThayDoiDiemNhuanBut,
      this.ghiChuNhuanBut});

  PhanCongThucHien.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userName = json['userName'];
    maVaiTroSanXuat = json['maVaiTroSanXuat'];
    tenVaiTroSanXuat = json['tenVaiTroSanXuat'];
    vaiTroSanXuatId = json['vaiTroSanXuatId'];
    khuVucTin = json['khuVucTin'];
    khuVucTinId = json['khuVucTinId'];
    bacNhuanBut = json['bacNhuanBut'];
    bacNhuanButId = json['bacNhuanButId'];
    loaiNhuanBut = json['loaiNhuanBut'];
    loaiNhuanButId = json['loaiNhuanButId'];
    diemNhuanBut = json['diemNhuanBut'];
    donGiaNhuanBut = json['donGiaNhuanBut'];
    heSoKhuVuc = json['heSoKhuVuc'];
    coThayDoiDiemNhuanBut = json['coThayDoiDiemNhuanBut'];
    ghiChuNhuanBut = json['ghiChuNhuanBut'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['maVaiTroSanXuat'] = this.maVaiTroSanXuat;
    data['tenVaiTroSanXuat'] = this.tenVaiTroSanXuat;
    data['vaiTroSanXuatId'] = this.vaiTroSanXuatId;
    data['khuVucTin'] = this.khuVucTin;
    data['khuVucTinId'] = this.khuVucTinId;
    data['bacNhuanBut'] = this.bacNhuanBut;
    data['bacNhuanButId'] = this.bacNhuanButId;
    data['loaiNhuanBut'] = this.loaiNhuanBut;
    data['loaiNhuanButId'] = this.loaiNhuanButId;
    data['diemNhuanBut'] = this.diemNhuanBut;
    data['donGiaNhuanBut'] = this.donGiaNhuanBut;
    data['heSoKhuVuc'] = this.heSoKhuVuc;
    data['coThayDoiDiemNhuanBut'] = this.coThayDoiDiemNhuanBut;
    data['ghiChuNhuanBut'] = this.ghiChuNhuanBut;
    return data;
  }
}
