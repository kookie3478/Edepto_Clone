import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/currentAffairs.model.dart';
import 'package:edepto_app/models/currentAffairsCategory.model.dart';
import 'package:edepto_app/modules/currentAffairs/components/filterCurrentAffairs.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentAffairsControllers extends GetxController {
  RxList<CurrentAffaiirsData> currentAffairsDataList =
      <CurrentAffaiirsData>[].obs;
  List<CurrentAffairsCategoryData> categoryDataList =
      <CurrentAffairsCategoryData>[];
  int currentPage = 1;
  int futurePage = 1;
  RxBool isLoading = false.obs;
  RxString selectedCategoryId = "".obs;
  RxString selectedDate = "".obs;

  CurrentAffairsControllers() {
    Future.delayed(200.milliseconds, () {
      getCategoryList();
      getCurrentAffairsList();
    });
  }

  void getCategoryList() async {
    var resp = await ApiCall.get(
        "${UrlApi.getCurrentAffairsCategoryList}?encryption=false&langCode=en");

    CurrentAffairsCategoryModel currentAffairsCategoryModel =
        CurrentAffairsCategoryModel.fromJson(resp);

    if (currentAffairsCategoryModel.responseCode == 200) {
      categoryDataList.addAll(currentAffairsCategoryModel.data ?? []);
    }
  }

  // Fetching the api data and storing it in a CurrentAffairsData data type container
  void getCurrentAffairsList() async {
    String url = "${UrlApi.getCurrentAffairs}?encryption=false&langCode=en&page=$currentPage&limit=20";

    if (selectedCategoryId.value != "") {
      url += "&categoryId=${selectedCategoryId.value}";
    }

    if (selectedDate.value != "") {
      url += "&filterByDate=${selectedDate.value}";
    }

    print(url);

    LoadingPage.show();
    var resp = await ApiCall.get(url);
    LoadingPage.close();

    CurrentAffairsModel currentAffairsModel =
        CurrentAffairsModel.fromJson(resp);
    if (currentAffairsModel.responseCode == 200) {
      currentAffairsDataList.addAll(currentAffairsModel.data?.value ?? []);
      currentAffairsDataList.refresh();
    } else {
      SnackBarHelper.error(currentAffairsModel.message);
    }
  }

  showOnClick() {

    FilterCurrentAffairs.showOnClick(
      categoryList: categoryDataList,
      onCategoryClick: onCategoryClick,
      onApplyClick: onApplyClick,
      onClearClick: onClearClick,
      onDateClick: onDateClick,
      selectedCategoryId: selectedCategoryId,
      selectedDate: selectedDate
    );
  }

  onCategoryClick(String id) {
    selectedCategoryId.value = id;
  }

  onApplyClick() {
    Get.back();

    currentAffairsDataList.clear();
    currentPage = 1;
    futurePage = 1;
    getCurrentAffairsList();
  }

  onClearClick() {
    Get.back();
    selectedCategoryId.value = "";
    currentPage = 1;
    futurePage = 1;
    currentAffairsDataList.clear();
    getCurrentAffairsList();
  }

  onDateClick() async {
    DateTime? pickedDate = await showDialog(
      context: Get.context!,
      builder: (context) => DatePickerDialog(
        firstDate: DateTime(2024),
        lastDate: DateTime.now(),
      ),
    );

    selectedDate.value = pickedDate.toString().split(" ")[0];
    //print(selectedDate.value);
  }
}
