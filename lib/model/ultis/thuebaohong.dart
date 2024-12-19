import 'package:nms_app/core/ultis/JsonNull.dart';

class thuebaohong {
  String? ma_phieu_bh;
  String? ma_tb;
  String? ten_tb;
  String? dia_chi;
  String? ma_db_pt;
  String? ten_db_pt;
  String? thoi_gian_bao_hong;
  String? sdt;
  String? ma_nv;
  String? can_bo_xl;
  String? ghi_chu;
  String? nguoi_giao_phieu;
  int? loai_kh;
  int? ma_dv_pt;
  int? tt_phieu;
  int? trang_thai_xl;

  thuebaohong({
    this.ma_tb,
    this.ten_tb,
    this.dia_chi,
    this.ma_db_pt,
    this.ten_db_pt,
    this.thoi_gian_bao_hong,
    this.sdt,
    this.ma_nv,
    this.can_bo_xl,
    this.ghi_chu,
    this.nguoi_giao_phieu,
    this.loai_kh,
    this.ma_dv_pt,
    this.tt_phieu,
    this.trang_thai_xl,
  });

  thuebaohong.fromJson(Map<String, dynamic> json) {
    ma_phieu_bh = Jsonnull.JsonStringnull(json, 'ma_phieu_bh');
    ma_tb = Jsonnull.JsonStringnull(json, 'ma_tb');
    ten_tb = Jsonnull.JsonStringnull(json, 'ten_tb');
    dia_chi = Jsonnull.JsonStringnull(json, 'dia_chi');
    ma_db_pt = Jsonnull.JsonStringnull(json, 'ma_db_pt');
    ten_db_pt = Jsonnull.JsonStringnull(json, 'ten_db_pt');
    thoi_gian_bao_hong = Jsonnull.JsonStringnull(json, 'thoi_gian_bao_hong');
    sdt = Jsonnull.JsonStringnull(json, 'sdt');
    ma_nv = Jsonnull.JsonStringnull(json, 'ma_nv');
    can_bo_xl = Jsonnull.JsonStringnull(json, 'can_bo_xl');
    ghi_chu = Jsonnull.JsonStringnull(json, 'ghi_chu');
    nguoi_giao_phieu = Jsonnull.JsonStringnull(json, 'nguoi_giao_phieu');
    loai_kh = Jsonnull.JsonIntnull(json, 'loai_kh');
    ma_dv_pt = Jsonnull.JsonIntnull(json, 'ma_dv_pt');
    tt_phieu = Jsonnull.JsonIntnull(json, 'tt_phieu');
    trang_thai_xl = Jsonnull.JsonIntnull(json, 'trang_thai_xl');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ma_phieu_bh'] = ma_phieu_bh;
    data['ma_tb'] = ma_tb;
    data['ten_tb'] = ten_tb;
    data['ma_db_pt'] = ma_db_pt;
    data['ten_db_pt'] = ten_db_pt;
    data['thoi_gian_bao_hong'] = thoi_gian_bao_hong;
    data['sdt'] = sdt;
    data['ma_nv'] = ma_nv;
    data['can_bo_xl'] = can_bo_xl;
    data['ghi_chu'] = ghi_chu;
    data['nguoi_giao_phieu'] = nguoi_giao_phieu;
    data['loai_kh'] = loai_kh;
    data['ma_dv_pt'] = ma_dv_pt;
    data['tt_phieu'] = tt_phieu;
    data['trang_thai_xl'] = trang_thai_xl;

    return data;
  }
}
