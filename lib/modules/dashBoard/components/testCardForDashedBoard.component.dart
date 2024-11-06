import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/dashboard.model.dart';
import '../../../utils/assets.util.dart';

class TestCardForDashedBoard extends StatelessWidget {
  const TestCardForDashedBoard({
    super.key,
    required this.testSectionData,
    required this.onClickChapterTest,
  });

  final TestSections testSectionData;
  final Function onClickChapterTest;

  @override
  Widget build(BuildContext context) {
    num totalTestCount = (testSectionData.paidTestCount ?? 0) + (testSectionData.freeTestCount ?? 0);
    num attemptedTestPercentage = ((testSectionData.attemptedTest??0) / (totalTestCount<=0 ? 1 : totalTestCount)) * 100;

    // if(totalTestCount>0){
    //   attemptedTestPercentage== ((testSectionData.attemptedTest ?? 0) / totalTestCount) * 100;
    // }

    return MaterialButton(
      onPressed: ()=>onClickChapterTest(),
      minWidth: 0,
      padding:EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              Image.asset(
                AssetsUtil.getTestIcon(),
                height: 28,
                width: 28,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 5),
              // Text + Text
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Test Title
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        "${testSectionData.name}".tr,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),

                      // Text Body
                      Text(
                        "$totalTestCount Papers".tr,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Dashed Progress Bar + Text
              Column(
                children: [
                  DashedCircularProgressBar(
                    width: 30,
                    height: 30,
                    progress: attemptedTestPercentage.toDouble(),
                    foregroundStrokeWidth: 4,
                    backgroundStrokeWidth: 4,
                    maxProgress: 100,
                    backgroundColor: context.theme.colorScheme.outline.withOpacity(0.5),
                    foregroundColor: context.theme.colorScheme.scrim,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "$attemptedTestPercentage%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w400,
                            color: context.theme.colorScheme.scrim,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "${testSectionData.attemptedTest}",
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            color: context.theme.colorScheme.scrim,
                          ),
                        ),
                        TextSpan(
                          text: "/$totalTestCount",
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w600,
                            color: context.theme.colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              // Dashed Progress Bar + Text
              Column(
                children: [
                  DashedCircularProgressBar(
                    width: 30,
                    height: 30,
                    progress: (testSectionData.accuracy??0).toDouble(),
                    foregroundStrokeWidth: 4,
                    backgroundStrokeWidth: 4,
                    maxProgress: 100,
                    backgroundColor: context.theme.colorScheme.outline.withOpacity(0.5),
                    foregroundColor: context.theme.colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${testSectionData.accuracy}%",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w400,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Accuracy",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              // Arrow inside a container
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.outline.withOpacity(0.40),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 10,
                  color: context.theme.colorScheme.outline,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
