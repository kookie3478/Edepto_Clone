import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/helper/cacheNetworkImage.helper%20.dart';
import 'package:edepto_app/modules/dashBoard/controllers/dashBoard.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../drawer/components/drawer.component.dart';
import '../../../utils/assets.util.dart';
import '../components/dasBoardBtn.component.dart';
import '../components/testCardForDashedBoard.component.dart';
import '../components/testResult.component.dart';

class DashBoardView extends StatelessWidget {
  DashBoardView({super.key});

  final DashBoardController dashBoardController = DashBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: dashBoardController.scaffoldKey,
      drawer: DrawerComponent(scaffoldKey: dashBoardController.scaffoldKey!),
      appBar: AppbarComponent.buildAppBar(
        showDrawer: true,
        titleShown: true,
        title: "Dashboard",
        showChangeCourse: true,
        onChangeCourse: dashBoardController.onChangeCourseClick,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          // Greeting the user

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dashBoardController.greetingToTheUser().tr,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),

          // User name and an emoji

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                "${dashBoardController.studentService.studentData.name} 👋", // Pass a variable here, the name of the user
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: context.theme.colorScheme.onSurface,
                )),
          ),

          const SizedBox(height: 5),

          //A wrap of elements having clickable pages leading to different views

          Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              DashBoardbtn(
                text: 'Current Affairs',
                width: 94,
                onClick: ()=>dashBoardController.onCurrentAffairsClick(),
                img: "assets/images/current.png",
                color: context.theme.colorScheme.secondary,
              ),
              DashBoardbtn(
                text: "Tips & tricks",
                width: 85,
                onClick: ()=>dashBoardController.onTipsAndTricksClick(),
                img: "assets/images/tips&tricks.png",
                color: context.theme.colorScheme.secondary,
              ),
              DashBoardbtn(
                text: "Videos & Documents",
                width: 109,
                onClick: () {},
                img: "assets/images/video&doc.png",
                color: context.theme.colorScheme.scrim.withOpacity(0.75),
              ),
              DashBoardbtn(
                text: "Webinar",
                width: 95,
                onClick: ()=>dashBoardController.onWebinarClick(),
                img: "assets/images/webinar.png",
                color: context.theme.colorScheme.surfaceContainer,
              ),
              DashBoardbtn(
                text: "Job Updates",
                width: 97,
                onClick: () => dashBoardController.onJobUpdates(),
                img: "assets/images/jobupdates.png",
                color: context.theme.colorScheme.primary.withOpacity(0.95),
              ),
              DashBoardbtn(
                text: "Daily Quiz",
                width: 78,
                onClick: () {},
                img: "assets/images/dailyquiz.png",
                color: context.theme.colorScheme.inversePrimary,
              ),
              DashBoardbtn(
                text: "Quiz\nLeaderboard",
                width: 127,
                onClick: () {},
                img: "assets/images/quizleaderboard.png",
                color: context.theme.colorScheme.inversePrimary,
              ),
              DashBoardbtn(
                text: "Q&A Community",
                width: 118,
                img: "assets/images/q&a.png",
                color: context.theme.colorScheme.primary.withOpacity(0.50),
                onClick: () {},
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Course Details".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.colorScheme.primaryContainer,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Obx(
                        () => SizedBox(
                          height: 23,
                          width: 23,
                          child: CacheNetworkImageHelper.getImage(
                              dashBoardController.dashboardData.value.icon ??
                                  ""),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: Obx(
                            () => Text(
                              "${dashBoardController.dashboardData.value.subCategoryName}"
                                  .tr, // Change the name here to course name
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 23,
                        width: 23,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          color: context.theme.colorScheme.surfaceTint,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.theme.colorScheme.primary,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Available in: "
                            .tr, // pass a string here from the response, for languages
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: TestResult(
                              text1: "Enrolled",
                              text2: "0",
                              img: AssetsUtil.getAir(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Obx(
                              () => TestResult(
                                text1: "Total Test",
                                text2:
                                    "${(dashBoardController.dashboardData.value.freeTestCount ?? 0) + (dashBoardController.dashboardData.value.paidTestCount ?? 0)}",
                                img: AssetsUtil.getAverageScore(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Material Button for attempted test series
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dashBoardController.dashboardData.value.testSections?.length ?? 0,
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemBuilder: (context, index) => TestCardForDashedBoard(
                  testSectionData: dashBoardController.dashboardData.value.testSections![index],
                onClickChapterTest: ()=>dashBoardController.onClickingTestCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
