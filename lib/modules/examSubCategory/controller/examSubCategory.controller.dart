import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/examSubCategory.model.dart';
import 'package:edepto_app/models/response.model.dart';
import 'package:edepto_app/services/app.service.dart';
import 'package:get/get.dart';

import '../../../api/call.api.dart';
import '../../../api/url.api.dart';
import '../../../components/loadingPage/loadingPage.component.dart';

class ExamSubCategoryController extends GetxController {
  AppService appService = Get.find<AppService>();
  RxList<ExamSubCategoryData> examSubCategoryDataList =
      <ExamSubCategoryData>[].obs;
  int currentPage = 1;
  int futurePage = 1;
  RxBool isLoading = false.obs;
  String categoryId = "";

  init(String id) {
    categoryId = id;
  }

  ExamSubCategoryController() {
    Future.delayed(const Duration(milliseconds: 200), () {
      getExamSubCategory();
    });
  }

  onScrollEnd() {
    if (futurePage > currentPage) {
      currentPage = futurePage;
      isLoading.value = true;
      getExamSubCategory();
    }
    return;
  }

  getExamSubCategory() async {
    if (currentPage == 1) {
      LoadingPage.show();
    }
    final resp = await ApiCall.get(
        "${UrlApi.examSubCategory}/$categoryId/$currentPage/10?encryption=false");

    if (currentPage == 1) {
      LoadingPage.close();
    }
    isLoading.value = false;

    ExamSubCategoryModel examSubCategoryModel =
        ExamSubCategoryModel.fromJson(resp);

    if (examSubCategoryModel.responseCode == 200) {
      examSubCategoryDataList.addAll(examSubCategoryModel.data ?? []);
      examSubCategoryDataList.refresh();
      futurePage++;
    }
  }

  String getLanguages(ExamSubCategoryData examData) {
    String availableLanguages = "";

    if (examData.languages != null && (examData.languages ?? []).isNotEmpty) {
      for (int i = 0; i < examData.languages!.length; i++) {
        if (i == 0) {
          availableLanguages += examData.languages?[i].language ?? "";
        }
        if (i == 1) {
          availableLanguages += ", ${examData.languages?[i].language ?? ""}";
          break;
        }
      }
    }

    return availableLanguages;
  }

  onCardClick(String id) async {
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.selectExamSubCategory}/$id?encryption=false");
    LoadingPage.close();

    ResponseModel responseModel = ResponseModel.fromJson(resp);

    if (responseModel.responseCode == 200) {
      appService.autoLoginCheck(showLoading: true);
    }
    else {
      SnackBarHelper.error(responseModel.message);
    }
  }
}
