import 'package:edepto_app/modules/allExam/controller/allExam.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets.util.dart';
import '../../home/components/bottomNavBar.component.dart';

class AllExamView extends StatelessWidget {
  AllExamView({super.key});

  final AllExamController allExamController = AllExamController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {},
          minWidth: 0,
          padding: EdgeInsets.zero,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: context.theme.colorScheme.onPrimaryContainer,
              iconSize: 20,
            ),
            //color: context.theme.colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          // Row having all exams + state exams
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: MaterialButton(
                  onPressed: () => allExamController.onClick(0),
                  padding: EdgeInsets.zero,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.blue,
                  visualDensity: VisualDensity.compact,
                  minWidth: 0,
                  child: Obx(
                    () => Container(
                        height: 79,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: allExamController.selectedButton.value == 0
                              ? context.theme.colorScheme.primary
                              : context.theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Text(
                                "All Exams".tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      allExamController.selectedButton.value == 0
                                          ? context.theme.colorScheme.onPrimary
                                          : context.theme.colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                "10 category".tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      allExamController.selectedButton.value ==
                                              0
                                          ? context.theme.colorScheme.onPrimary
                                          : context.theme.colorScheme.outline,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: MaterialButton(
                  onPressed: () => allExamController.onClick(1),
                  padding: EdgeInsets.zero,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.blue,
                  visualDensity: VisualDensity.compact,
                  minWidth: 0,
                  child: Obx(
                    () => Container(
                      height: 79,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: allExamController.selectedButton.value == 1
                            ? context.theme.colorScheme.primary
                            : context.theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text(
                              "State Exams".tr,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color:
                                    allExamController.selectedButton.value == 1
                                        ? context.theme.colorScheme.onPrimary
                                        : context.theme.colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "28 states & UTs".tr,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color:
                                    allExamController.selectedButton.value == 1
                                        ? context.theme.colorScheme.onPrimary
                                        : context.theme.colorScheme.outline,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Obx(
            () => Text(
              allExamController.selectedButton.value == 0
                  ? "All Exams".tr
                  : "State Exams".tr,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // a text field with a prefix icon and text
          TextField(
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: context.theme.colorScheme.outline),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: context.theme.colorScheme.outline),
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding: EdgeInsets.all(10),
                filled: true,
                fillColor: context.theme.colorScheme.primaryContainer,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                  color: context.theme.colorScheme.outline,
                ),
                hintText: "Search here".tr,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: context.theme.colorScheme.outline,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => allExamController.selectedButton.value == 0
                ? ListView.separated(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    separatorBuilder: (context, index) => Container(height: 20),
                    itemBuilder: (context, index) => Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Image.asset(
                                  AssetsUtil.getTeachingExams(),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Teaching Exams",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: context.theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    ),
                  )
                : GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: Get.width / 3,
                      mainAxisExtent: 135,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          minWidth: 0,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          visualDensity: VisualDensity.compact,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: context.theme.colorScheme.primaryContainer,
                            ),
                            child: Image.asset(AssetsUtil.getTeachingExams()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "State".tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: context.theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          // Wrap(
          //   spacing: 10,
          //   runSpacing: 20,
          //   children: [
          //     AssetsUtil.getTeachingExams(),
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //     "assets/images/telangana.png",
          //   ]
          //       .map(
          //         (img) => Column(
          //           children: [
          //             MaterialButton(onPressed: (){},
          //               padding: EdgeInsets.zero,
          //               minWidth: 0,
          //               splashColor: Colors.transparent,
          //               highlightColor: Colors.transparent,
          //               visualDensity: VisualDensity.compact,
          //               child: Container(
          //                 height:100,
          //                 width: 100,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: context.theme.colorScheme.primaryContainer,
          //                 ),
          //                 child: Image.asset(img),
          //               ),
          //             ),
          //             const SizedBox( height: 10,),
          //             Text(
          //               "State".tr,
          //               style: TextStyle(
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w500,
          //                 color: context.theme.colorScheme.onSurface,
          //               ),
          //             ),
          //           ],
          //         )
          //       ).toList(),
          // ),
        ],
      ),
    );
  }
}
