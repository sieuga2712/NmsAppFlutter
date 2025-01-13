import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/bantin/danhsach_bantin_model.dart';
import 'package:nms_app/provider/bantin/bantin_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachBantinDangsanxuatController extends GetxController
    with StateMixin<List<DanhsachBantinData>> {
  var storage = GetStorage();
  var bantinProvider = BantinProvider();

  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  var dsBanTinDangsanxuatData = <DanhsachBantinData>[].obs;

  var filteredDsBanTinDangsanxuatData = <DanhsachBantinData>[].obs;

  String? keyWord = "";
  var isLoadingMore = false.obs;
  var currentPage = 0.obs;
  final int itemsPerPage = 10;
  var hasMoreItems = true.obs;

  String removeVietnameseDiacritics(String str) {
    return removeDiacritics(str);
  }

  bool _itemMatchesSearch(DanhsachBantinData item) {
    if (keyWord == null || keyWord!.isEmpty) return true;
    return removeVietnameseDiacritics(item.ten!.toLowerCase())
        .contains(removeVietnameseDiacritics(keyWord!));
  }

  void _updateFilteredList() {
    if (keyWord == null || keyWord!.isEmpty) {
      filteredDsBanTinDangsanxuatData.assignAll(dsBanTinDangsanxuatData);
    } else {
      filteredDsBanTinDangsanxuatData.assignAll(
        dsBanTinDangsanxuatData.where(_itemMatchesSearch),
      );
    }
  }

  void loadDanhSachBantinDangsanxuat({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      resetController();
      change(null, status: RxStatus.loading());
    }
    try {
      if (isLoadMore) {
        isLoadingMore.value = true;
      }
      await Future.delayed(const Duration(milliseconds: 1200));
      final result = await bantinProvider.dsBanTinDangSanXuat(
        skipCount: currentPage.value * itemsPerPage,
        maxResultCount: itemsPerPage,
      );

      if (result.items == null || result.items!.isEmpty) {
        hasMoreItems.value = false;
      } else {
        dsBanTinDangsanxuatData.addAll(result.items!);

        _updateFilteredList();

        currentPage.value++;
      }
      if (filteredDsBanTinDangsanxuatData.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(filteredDsBanTinDangsanxuatData, status: RxStatus.success());
      }
    } catch (error) {
      print('Lỗi khi tải dữ liệu bản tin: $error');
      if (!isLoadMore) {
        change(null, status: RxStatus.error('Đã xảy ra lỗi khi tải dữ liệu.'));
      }
    } finally {
      isLoadingMore.value = false;
    }
  }

  void loadMore() {
    if (!isLoadingMore.value && hasMoreItems.value) {
      loadDanhSachBantinDangsanxuat(isLoadMore: true);
    }
  }

  void setSearchKey(String? text) {
    keyWord = text?.toLowerCase();
    print('keyWord : $keyWord');

    _updateFilteredList();

    if (filteredDsBanTinDangsanxuatData.isEmpty) {
      if (keyWord?.isNotEmpty == true) {
        // If we have a search term and no results, try loading more
        if (hasMoreItems.value) {
          loadMore();
        } else {
          change(null, status: RxStatus.empty());
        }
      } else {
        change(null, status: RxStatus.empty());
      }
    } else {
      change(filteredDsBanTinDangsanxuatData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(banTinId) async {
    print('banTinId: $banTinId');
    Get.toNamed(Routers.CHITIETBANTINDANGSANXUAT, arguments: {
      'banTinId': banTinId,
    });
  }

  void resetController() {
    dsBanTinDangsanxuatData.clear();
    filteredDsBanTinDangsanxuatData.clear();
    keyWord = "";
    isLoadingMore.value = false;
    currentPage.value = 0;
    hasMoreItems.value = true;
    change(null, status: RxStatus.loading());
  }

  void clearSearch() {
    searchController.clear();
    searchFocusNode.unfocus();
    keyWord = "";
  }

  void refreshFromDetail() {
    Future.delayed(const Duration(milliseconds: 1), () {
      clearSearch();
      loadDanhSachBantinDangsanxuat();
    });
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    loadDanhSachBantinDangsanxuat();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
