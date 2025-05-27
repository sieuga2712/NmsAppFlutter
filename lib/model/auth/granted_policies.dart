class ChinhSachDuocCapModel {
  bool? nMSBanTin;
  bool? nMSMenu;
  bool? nMSMenuCongViecCaNhan;
  bool? nMSMenuBanTin;
  bool? nMSMenuDangVietTinBai;
  bool? nMSMenuChoDuyetTinBai;
  bool? nMSMenuTinKhongPheDuyet;
  bool? nMSMenuDangSanXuat;
  bool? nMSMenuChoPheDuyetVideo;
  bool? nMSMenuVideoKhongPheDuyet;
  bool? nMSMenuTinDaXuatBan;
  bool? nMSMenuBaoCao;
  bool? nMSMenuBaoCaoChuongTrinh;
  bool? nMSChuongTrinh;
  bool? nMSChuongTrinhCreate;
  bool? nMSMenuChuongTrinh;
  bool? nMSMenuThemMoiChuongTrinh;
  bool? nMSMenuChuongTrinhSoanThao;
  bool? nMSMenuChuongTrinhChoDuyet;
  bool? nMSMenuChuongTrinhDaPheDuyetKichBan;
  bool? nMSMenuChuongTrinhKhongPheDuyetKichBan;
  bool? nMSMenuChuongTrinhDaXuatBan;
  bool? nMSMenuChuongTrinhCanLanhDaoPheDuyet;
  bool? nMSMenuChuongTrinhKhongPheDuyet;
  bool? nMSChuongTrinhEdit;
  bool? nMSChuongTrinhPheDuyetKichBanCapPhong;
  bool? nMSChuongTrinhPheDuyetTinBaiCapPhong;
  bool? nMSChuongTrinhPheDuyetFileThanhPhamCapPhong;
  bool? nMSChuongTrinhPheDuyetKichBanCapGD;
  bool? nMSChuongTrinhPheDuyetTinBaiCapGD;
  bool? nMSChuongTrinhPheDuyetFileThanhPhamCapGD;
  bool? nMSChuongTrinhPheDuyetKichBanCapPGD;
  bool? nMSChuongTrinhPheDuyetTinBaiCapPGD;
  bool? nMSChuongTrinhPheDuyetFileThanhPhamCapPGD;

  ChinhSachDuocCapModel(
      {this.nMSBanTin,
      this.nMSMenu,
      this.nMSMenuCongViecCaNhan,
      this.nMSMenuBanTin,
      this.nMSMenuDangVietTinBai,
      this.nMSMenuChoDuyetTinBai,
      this.nMSMenuTinKhongPheDuyet,
      this.nMSMenuDangSanXuat,
      this.nMSMenuChoPheDuyetVideo,
      this.nMSMenuVideoKhongPheDuyet,
      this.nMSMenuTinDaXuatBan,
      this.nMSMenuBaoCao,
      this.nMSMenuBaoCaoChuongTrinh,
      this.nMSMenuChuongTrinhCanLanhDaoPheDuyet,
      this.nMSMenuChuongTrinhKhongPheDuyet,
      this.nMSChuongTrinh,
      this.nMSChuongTrinhCreate,
      this.nMSMenuChuongTrinh,
      this.nMSMenuThemMoiChuongTrinh,
      this.nMSMenuChuongTrinhSoanThao,
      this.nMSMenuChuongTrinhChoDuyet,
      this.nMSMenuChuongTrinhDaPheDuyetKichBan,
      this.nMSMenuChuongTrinhKhongPheDuyetKichBan,
      this.nMSMenuChuongTrinhDaXuatBan,
      this.nMSChuongTrinhEdit,
      this.nMSChuongTrinhPheDuyetKichBanCapPhong,
      this.nMSChuongTrinhPheDuyetTinBaiCapPhong,
      this.nMSChuongTrinhPheDuyetFileThanhPhamCapPhong,
      this.nMSChuongTrinhPheDuyetKichBanCapGD,
      this.nMSChuongTrinhPheDuyetTinBaiCapGD,
      this.nMSChuongTrinhPheDuyetFileThanhPhamCapGD,
      this.nMSChuongTrinhPheDuyetKichBanCapPGD,
      this.nMSChuongTrinhPheDuyetTinBaiCapPGD,
      this.nMSChuongTrinhPheDuyetFileThanhPhamCapPGD});

  ChinhSachDuocCapModel.fromJson(Map<String, dynamic> json) {
    nMSBanTin = json['NMS.BanTin'];
    nMSMenu = json['NMS.Menu'];
    nMSMenuCongViecCaNhan = json['NMS.Menu.CongViecCaNhan'];
    nMSMenuBanTin = json['NMS.Menu.BanTin'];
    nMSMenuDangVietTinBai = json['NMS.Menu.DangVietTinBai'];
    nMSMenuChoDuyetTinBai = json['NMS.Menu.ChoDuyetTinBai'];
    nMSMenuTinKhongPheDuyet = json['NMS.Menu.TinKhongPheDuyet'];
    nMSMenuDangSanXuat = json['NMS.Menu.DangSanXuat'];
    nMSMenuChoPheDuyetVideo = json['NMS.Menu.ChoPheDuyetVideo'];
    nMSMenuVideoKhongPheDuyet = json['NMS.Menu.VideoKhongPheDuyet'];
    nMSMenuTinDaXuatBan = json['NMS.Menu.TinDaXuatBan'];
    nMSMenuBaoCao = json['NMS.Menu.BaoCao'];
    nMSMenuBaoCaoChuongTrinh = json['NMS.Menu.BaoCaoChuongTrinh'];
    nMSMenuChuongTrinhCanLanhDaoPheDuyet = json['NMS.Menu.ChuongTrinhCanLanhDaoPheDuyet'];
    nMSMenuChuongTrinhKhongPheDuyet = json['NMS.Menu.ChuongTrinhKhongPheDuyet'];
    nMSChuongTrinh = json['NMS.ChuongTrinh'];
    nMSChuongTrinhCreate = json['NMS.ChuongTrinh.Create'];
    nMSMenuChuongTrinh = json['NMS.Menu.ChuongTrinh'];
    nMSMenuThemMoiChuongTrinh = json['NMS.Menu.ThemMoiChuongTrinh'];
    nMSMenuChuongTrinhSoanThao = json['NMS.Menu.ChuongTrinhSoanThao'];
    nMSMenuChuongTrinhChoDuyet = json['NMS.Menu.ChuongTrinhChoDuyet'];
    nMSMenuChuongTrinhDaPheDuyetKichBan =
        json['NMS.Menu.ChuongTrinhDaPheDuyetKichBan'];
    nMSMenuChuongTrinhKhongPheDuyetKichBan =
        json['NMS.Menu.ChuongTrinhKhongPheDuyetKichBan'];
    nMSMenuChuongTrinhDaXuatBan = json['NMS.Menu.ChuongTrinhDaXuatBan'];
    nMSChuongTrinhEdit = json['NMS.ChuongTrinh.Edit'];
    nMSChuongTrinhPheDuyetKichBanCapPhong =
        json['NMS.ChuongTrinh.PheDuyetKichBanCapPhong'];
    nMSChuongTrinhPheDuyetTinBaiCapPhong =
        json['NMS.ChuongTrinh.PheDuyetTinBaiCapPhong'];
    nMSChuongTrinhPheDuyetFileThanhPhamCapPhong =
        json['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapPhong'];
    nMSChuongTrinhPheDuyetKichBanCapGD =
        json['NMS.ChuongTrinh.PheDuyetKichBanCapGD'];
    nMSChuongTrinhPheDuyetTinBaiCapGD =
        json['NMS.ChuongTrinh.PheDuyetTinBaiCapGD'];
    nMSChuongTrinhPheDuyetFileThanhPhamCapGD =
        json['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapGD'];
    nMSChuongTrinhPheDuyetKichBanCapPGD =
        json['NMS.ChuongTrinh.PheDuyetKichBanCapPGD'];
    nMSChuongTrinhPheDuyetTinBaiCapPGD =
        json['NMS.ChuongTrinh.PheDuyetTinBaiCapPGD'];
    nMSChuongTrinhPheDuyetFileThanhPhamCapPGD =
        json['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapPGD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NMS.BanTin'] = this.nMSBanTin;
    data['NMS.Menu'] = this.nMSMenu;
    data['NMS.Menu.CongViecCaNhan'] = this.nMSMenuCongViecCaNhan;
    data['NMS.Menu.BanTin'] = this.nMSMenuBanTin;
    data['NMS.Menu.DangVietTinBai'] = this.nMSMenuDangVietTinBai;
    data['NMS.Menu.ChoDuyetTinBai'] = this.nMSMenuChoDuyetTinBai;
    data['NMS.Menu.TinKhongPheDuyet'] = this.nMSMenuTinKhongPheDuyet;
    data['NMS.Menu.DangSanXuat'] = this.nMSMenuDangSanXuat;
    data['NMS.Menu.ChoPheDuyetVideo'] = this.nMSMenuChoPheDuyetVideo;
    data['NMS.Menu.VideoKhongPheDuyet'] = this.nMSMenuVideoKhongPheDuyet;
    data['NMS.Menu.TinDaXuatBan'] = this.nMSMenuTinDaXuatBan;
    data['NMS.Menu.BaoCao'] = this.nMSMenuBaoCao;
    data['NMS.Menu.BaoCaoChuongTrinh'] = this.nMSMenuBaoCaoChuongTrinh;
    data['NMS.Menu.ChuongTrinhCanLanhDaoPheDuyet'] = this.nMSMenuChuongTrinhCanLanhDaoPheDuyet;
    data['NMS.Menu.ChuongTrinhKhongPheDuyet'] = this.nMSMenuChuongTrinhKhongPheDuyet;
    data['NMS.ChuongTrinh'] = this.nMSChuongTrinh;
    data['NMS.ChuongTrinh.Create'] = this.nMSChuongTrinhCreate;
    data['NMS.Menu.ChuongTrinh'] = this.nMSMenuChuongTrinh;
    data['NMS.Menu.ThemMoiChuongTrinh'] = this.nMSMenuThemMoiChuongTrinh;
    data['NMS.Menu.ChuongTrinhSoanThao'] = this.nMSMenuChuongTrinhSoanThao;
    data['NMS.Menu.ChuongTrinhChoDuyet'] = this.nMSMenuChuongTrinhChoDuyet;
    data['NMS.Menu.ChuongTrinhDaPheDuyetKichBan'] =
        this.nMSMenuChuongTrinhDaPheDuyetKichBan;
    data['NMS.Menu.ChuongTrinhKhongPheDuyetKichBan'] =
        this.nMSMenuChuongTrinhKhongPheDuyetKichBan;
    data['NMS.Menu.ChuongTrinhDaXuatBan'] = this.nMSMenuChuongTrinhDaXuatBan;
    data['NMS.ChuongTrinh.Edit'] = this.nMSChuongTrinhEdit;
    data['NMS.ChuongTrinh.PheDuyetKichBanCapPhong'] =
        this.nMSChuongTrinhPheDuyetKichBanCapPhong;
    data['NMS.ChuongTrinh.PheDuyetTinBaiCapPhong'] =
        this.nMSChuongTrinhPheDuyetTinBaiCapPhong;
    data['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapPhong'] =
        this.nMSChuongTrinhPheDuyetFileThanhPhamCapPhong;
    data['NMS.ChuongTrinh.PheDuyetKichBanCapGD'] =
        this.nMSChuongTrinhPheDuyetKichBanCapGD;
    data['NMS.ChuongTrinh.PheDuyetTinBaiCapGD'] =
        this.nMSChuongTrinhPheDuyetTinBaiCapGD;
    data['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapGD'] =
        this.nMSChuongTrinhPheDuyetFileThanhPhamCapGD;
    data['NMS.ChuongTrinh.PheDuyetKichBanCapPGD'] =
        this.nMSChuongTrinhPheDuyetKichBanCapPGD;
    data['NMS.ChuongTrinh.PheDuyetTinBaiCapPGD'] =
        this.nMSChuongTrinhPheDuyetTinBaiCapPGD;
    data['NMS.ChuongTrinh.PheDuyetFileThanhPhamCapPGD'] =
        this.nMSChuongTrinhPheDuyetFileThanhPhamCapPGD;
    return data;
  }
}
