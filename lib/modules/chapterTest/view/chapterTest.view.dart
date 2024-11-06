import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/models/dashboard.model.dart';
import 'package:edepto_app/modules/chapterTest/controller/chapterTest.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/chapterTestComponent.dart';

class ChapterTestView extends StatelessWidget {
  ChapterTestView({super.key, required this.testSections});

  ChapterTestController chapterTestController = ChapterTestController();
  final List<TestSections> testSections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        title: "Chapter Tests",
        titleShown: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: testSections.length ?? 0,
              itemBuilder: (context, index) => Obx(
                () => MaterialButton(
                  onPressed: () => chapterTestController.onClick(index),
                  minWidth: 0,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: chapterTestController.val.value == index
                              ? context.theme.colorScheme.primary
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      testSections[index].subsections?[index].name ?? "",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: chapterTestController.val.value == index
                            ? Colors.blue
                            : context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: testSections.length ?? 0,
              itemBuilder: (context, index) => ChapterTestCardComponent(
                subSections: testSections[index].subsections ?? [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
