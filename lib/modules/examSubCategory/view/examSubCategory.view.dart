import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../components/examSubCategoryCard.component.dart';
import '../controller/examSubCategory.controller.dart';

class ExamSubCategoryView extends StatelessWidget {
  ExamSubCategoryView({
    super.key,
    required this.title,
    required this.categoryId,
  });

  final ExamSubCategoryController examsSubCategoryController =
      ExamSubCategoryController();
  final String categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    examsSubCategoryController.init(categoryId);
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        title: title,
      ),
      body: Obx(
        () => examsSubCategoryController.examSubCategoryDataList.isEmpty
            ? const Center(
                child: Text("No data found"),
              )
            : ScrollShadow(
                color: context.theme.colorScheme.outline,
                child: LazyLoadScrollView(
                  scrollOffset: 80,
                  isLoading: examsSubCategoryController.isLoading.value,
                  onEndOfPage: () => examsSubCategoryController.onScrollEnd(),
                  child: ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: examsSubCategoryController.examSubCategoryDataList.length,
                        itemBuilder: (context, index) => ExamSubCategoryCard(
                          examSubCategoryData: examsSubCategoryController.examSubCategoryDataList[index],
                          onCardClick: examsSubCategoryController.onCardClick,
                          getLanguages: examsSubCategoryController.getLanguages,
                        ),
                      ),
                      Visibility(
                        visible: examsSubCategoryController.isLoading.value,
                        child: LoadingPage.listLoading(),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
