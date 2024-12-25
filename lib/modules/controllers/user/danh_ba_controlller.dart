import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nms_app/model/user/danh_ba_model.dart';
import 'package:nms_app/provider/user/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DanhBaControlller extends GetxController with StateMixin<List<LiAttr>> {
  var userProvider = UserProvider();
  TextEditingController searchDanhBa = TextEditingController();
  List<DetailDanhBa> listDanhBa = <DetailDanhBa>[];
  List<LiAttr> listCanBo = <LiAttr>[];

  void loadDanhBa() async {
    change(null, status: RxStatus.loading());
    try {
      await userProvider.getDanhDaTheoDonVi().then((user) {
        if (user.data != null && user.data!.isNotEmpty) {
          listDanhBa.addAll(user.data!);
          for (var element in listDanhBa) {
            if (element.id!.contains('CB')) {
              listCanBo.add(element.liAttr!);
            }
          }
          change(listCanBo, status: RxStatus.success());
        } else {
          change(listCanBo, status: RxStatus.success());
        }
      });

      listCanBo = [
        LiAttr(
          dataId: "1",
          dataTenCanBo: "Nguyễn Văn A",
          dataChucVu: "Trưởng phòng",
          dataPhone: "0123456789",
          dataEmail: "nguyenvana@example.com",
        ),
        LiAttr(
          dataId: "2",
          dataTenCanBo: "Trần Thị B",
          dataChucVu: "Nhân viên",
          dataPhone: "0987654321",
          dataEmail: "tranthib@example.com",
        ),
        LiAttr(
          dataId: "3",
          dataTenCanBo: "Lê Văn C",
          dataChucVu: "Phó giám đốc",
          dataPhone: "0909090909",
          dataEmail: "levanc@example.com",
        ),
      ];
    } catch (exception) {
      // Trường hợp lỗi xảy ra
      change(null, status: RxStatus.error(exception.toString()));
    }
  }

  void searchCanBo() {
    if (searchDanhBa.text.isEmpty) {
      change(listCanBo, status: RxStatus.success());
    } else {
      var query = searchDanhBa.text.toLowerCase();
      var resultSearch = listCanBo.where((item) {
        var tenCanBo = item.dataTenCanBo?.toLowerCase() ?? '';
        var soDienThoai = item.dataPhone?.toLowerCase() ?? '';
        var email = item.dataEmail?.toLowerCase() ?? '';

        return tenCanBo.contains(query) ||
            soDienThoai.contains(query) ||
            email.contains(query);
      }).toList();
      change(resultSearch, status: RxStatus.success());
    }
  }

  void makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      final call = Uri.parse(url);
      await launchUrl(call);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadDanhBa();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    searchDanhBa.dispose();
  }
}
