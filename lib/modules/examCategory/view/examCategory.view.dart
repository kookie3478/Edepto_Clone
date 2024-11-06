import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/modules/examCategory/components/examCategoryCard.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../controllers/examsCategory.controller.dart';

class ExamCategoryView extends StatelessWidget {
  ExamCategoryView({super.key});

  final ExamsCategoryController examsController = ExamsCategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        title: "All Exams",
        titleShown: true,
      ),
      body: Obx(
        () => examsController.examCategoryDataList.isEmpty
            ? const Center(
                child: Text("No data found"),
              )
            : ScrollShadow(
                color: context.theme.colorScheme.shadow,
                child: LazyLoadScrollView(
                  scrollOffset: 80,
                  isLoading: examsController.isLoading.value,
                  onEndOfPage: () => examsController.onScrollEnd(),
                  child: ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: examsController.examCategoryDataList.length,
                        itemBuilder: (context, index) =>
                            ExamCategoryCardComponent(
                          onClick: () => examsController.onExamCategoryClick(
                              examsController.examCategoryDataList[index].id ??
                                  "",
                              examsController.examCategoryDataList[index]
                                      .categoryName ??
                                  ""),
                          text: examsController
                                  .examCategoryDataList[index].categoryName ??
                              "",
                          img: examsController
                                  .examCategoryDataList[index].icon ??
                              "",
                        ),
                      ),
                      Visibility(
                        visible: examsController.isLoading.value,
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
