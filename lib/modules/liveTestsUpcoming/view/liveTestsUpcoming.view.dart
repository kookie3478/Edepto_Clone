import 'package:edepto_app/components/testCard/testCard.component.dart';
import 'package:edepto_app/modules/liveTestsUpcoming/controllers/liveTestsUpcoming.controller.dart';
import 'package:edepto_app/modules/liveTestsUpcoming/view/completed.page.dart';
import 'package:edepto_app/modules/liveTestsUpcoming/view/live.page.dart';
import 'package:edepto_app/modules/liveTestsUpcoming/view/upcoming.page.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_stack/image_stack.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import '../../../components/appBar/appbar.component.dart';
import '../../../components/buttons/pageButton.component.dart';
import '../../../components/testCard/resultCard.component.dart';
import '../components/notifications.component.dart';

class LiveTestView extends StatelessWidget {
  LiveTestView({super.key});

  List<String> img = [
    AssetsUtil.getLoginImage(),
    AssetsUtil.getLoginImage(),
    AssetsUtil.getLoginImage(),
    AssetsUtil.getLoginImage(),
    AssetsUtil.getLoginImage(),
  ];
  final LiveTestUpcomingController liveTestUpcomingController = LiveTestUpcomingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        titleShown: true,
        title: "Live Test",
      ),
      body: Column(
        children: [
          // Upcoming + Live + Completed (Sticky, not scrollable)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Obx(
                  () => PageButtonComponent(
                    text: "Upcoming",
                    onClick: () => liveTestUpcomingController.onPageButtonClick(0),
                    isSelected:
                        liveTestUpcomingController.selectedButton.value == 0,
                  ),
                ),
                Obx(
                  () => PageButtonComponent(
                    text: "Live",
                    onClick: () => liveTestUpcomingController.onPageButtonClick(1),
                    isSelected:
                        liveTestUpcomingController.selectedButton.value == 1,
                  ),
                ),
                Obx(
                  () => PageButtonComponent(
                    text: "Completed",
                    onClick: () => liveTestUpcomingController.onPageButtonClick(2),
                    isSelected:
                        liveTestUpcomingController.selectedButton.value == 2,
                  ),
                ),
              ],
            ),
          ),
          // A List View (scrollable) for viewing the test cards
          Flexible(
            child: PageView(
              controller: liveTestUpcomingController.pageController,
              onPageChanged: (value) => liveTestUpcomingController.onPageChanged(value),
              children: const [
                UpcomingPage(),
                LivePage(),
                CompletedPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}






