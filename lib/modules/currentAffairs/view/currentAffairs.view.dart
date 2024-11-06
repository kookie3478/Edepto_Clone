import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/helper/lottie.helper.dart';
import 'package:edepto_app/modules/currentAffairs/components/filterCurrentAffairs.component.dart';
import 'package:edepto_app/modules/currentAffairs/controllers/currentAffairs.controllers.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/currentAffairs.component.dart';

class CurrentAffairsView extends StatelessWidget {
  CurrentAffairsView({super.key});

  final CurrentAffairsControllers currentAffairsControllers =
      CurrentAffairsControllers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent.buildAppBar(
        title: "Current Affairs",
        titleShown: true,
        showFilter: true,
        onFilterClick: currentAffairsControllers.showOnClick,
      ),
      body: Obx(
        () => currentAffairsControllers.currentAffairsDataList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieHelper.lottie(
                      animationAsset: AssetsUtil.getNotFoundAnimation(),
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      "No Data Found",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: context.theme.colorScheme.outline.withOpacity(0.75),
                      ),
                    )
                  ],
                ),
              )
            : ListView.separated(
                itemCount:
                    currentAffairsControllers.currentAffairsDataList.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemBuilder: (context, index) => CurrentAffairsComponent(
                  onCurrentAffairsCardClick: () {},
                  currentAffairsData:
                      currentAffairsControllers.currentAffairsDataList[index],
                ),
              ),
      ),
    );
  }
}
