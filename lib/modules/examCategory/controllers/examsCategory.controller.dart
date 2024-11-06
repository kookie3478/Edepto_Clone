import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/examCategory.model.dart';
import 'package:edepto_app/modules/examSubCategory/view/examSubCategory.view.dart';
import 'package:edepto_app/utils/routes.util.dart';
import 'package:get/get.dart';
import '../../../components/moreLanguage/moreLanguage.component.dart';
import '../../../services/app.service.dart';

class ExamsCategoryController extends GetxController {
  RxList<ExamCategoryData> examCategoryDataList = <ExamCategoryData>[].obs;
  int currentPage = 1;
  int futurePage = 1;
  RxBool isLoading = false.obs;

  ExamsCategoryController() {
    Future.delayed(const Duration(milliseconds: 200), () {
      getExamCategory();
    });
  }

  onScrollEnd() {
    if(futurePage > currentPage) {
      currentPage = futurePage;
      isLoading.value = true;
      getExamCategory();
    }
    return;
  }

  getExamCategory() async {
    if(currentPage==1) {
      LoadingPage.show();
    }
    final resp = await ApiCall.get("${UrlApi.examCategory}/$currentPage/10?encryption=false");
    if(currentPage ==1) {
      LoadingPage.close();
    }
    isLoading.value = false;

    ExamCategoryModel examCategoryModel = ExamCategoryModel.fromJson(resp);

    if (examCategoryModel.responseCode == 200) {
      examCategoryDataList.addAll(examCategoryModel.data ?? []);
      examCategoryDataList.refresh();
      futurePage++;
    }
  }


  onExamCategoryClick(String id, String categoryName) {
    RoutesUtil.to(() => ExamSubCategoryView(categoryId: id, title: categoryName));
  }
}
