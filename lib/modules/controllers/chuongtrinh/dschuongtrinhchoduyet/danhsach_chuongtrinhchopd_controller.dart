import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nms_app/model/chuongtrinh/danhsach_chuongtrinh_model.dart';
import 'package:nms_app/provider/chuongtrinh/chuongtrinh_provider.dart';
import 'package:nms_app/router.dart';

class DanhsachChuongtrinhChopdController extends GetxController
    with StateMixin<List<DanhsachChuongtrinhData>> {
  var storage = GetStorage();
  var chuongTrinhProvider = ChuongtrinhProvider();

  late TextEditingController searchController;
  late FocusNode searchFocusNode;

  // Main data list
  var dsChuongTrinhChoPheDuyetData = <DanhsachChuongtrinhData>[].obs;
  // Filtered list for display
  var filteredDsChuongTrinhChoPheDuyetData = <DanhsachChuongtrinhData>[].obs;

  String? keyWord = "";
  var isLoadingMore = false.obs;
  var currentPage = 0.obs;
  final int itemsPerPage = 10;
  var hasMoreItems = true.obs;

  String removeVietnameseDiacritics(String str) {
    return removeDiacritics(str);
  }

  bool _itemMatchesSearch(DanhsachChuongtrinhData item) {
    if (keyWord == null || keyWord!.isEmpty) return true;
    return removeVietnameseDiacritics(item.ten!.toLowerCase())
        .contains(removeVietnameseDiacritics(keyWord!));
  }

  void _updateFilteredList() {
    if (keyWord == null || keyWord!.isEmpty) {
      filteredDsChuongTrinhChoPheDuyetData
          .assignAll(dsChuongTrinhChoPheDuyetData);
    } else {
      filteredDsChuongTrinhChoPheDuyetData.assignAll(
        dsChuongTrinhChoPheDuyetData.where(_itemMatchesSearch),
      );
    }
  }

  void loadDanhSachChuongTrinhChopd({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      resetController();
      change(null, status: RxStatus.loading());
    }

    try {
      if (isLoadMore) {
        isLoadingMore.value = true;
      }

      await Future.delayed(const Duration(milliseconds: 1200));
      final result = await chuongTrinhProvider.dsChuongTrinhChoPheDuyet(
        skipCount: currentPage.value * itemsPerPage,
        maxResultCount: itemsPerPage,
      );

      if (result.items == null || result.items!.isEmpty) {
        hasMoreItems.value = false;
      } else {
        // Add new items to main list
        dsChuongTrinhChoPheDuyetData.addAll(result.items!);

        // Update filtered list
        _updateFilteredList();

        // Update pagination
        currentPage.value++;
      }

      // Update status based on filtered results
      if (filteredDsChuongTrinhChoPheDuyetData.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(filteredDsChuongTrinhChoPheDuyetData,
            status: RxStatus.success());
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
      loadDanhSachChuongTrinhChopd(isLoadMore: true);
    }
  }

  void setSearchKey(String? text) {
    keyWord = text?.toLowerCase();
    print('keyWord : $keyWord');

    // Apply filter to existing data
    _updateFilteredList();

    // Update status based on filtered results
    if (filteredDsChuongTrinhChoPheDuyetData.isEmpty) {
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
      change(filteredDsChuongTrinhChoPheDuyetData, status: RxStatus.success());
    }
  }

  Future<void> onSwitchPage(chuongTrinhId) async {
    print('chuongtrinhId: $chuongTrinhId');
    Get.toNamed(Routers.CHITIETCHUONGTRINHCHOPHEDUYETKICHBAN, arguments: {
      'chuongTrinhId': chuongTrinhId,
    });
  }

  void resetController() {
    dsChuongTrinhChoPheDuyetData.clear();
    filteredDsChuongTrinhChoPheDuyetData.clear();
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
      loadDanhSachChuongTrinhChopd();
    });
  }

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    loadDanhSachChuongTrinhChopd();
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
