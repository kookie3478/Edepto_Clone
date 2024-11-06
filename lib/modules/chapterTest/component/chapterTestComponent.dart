import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:edepto_app/models/dashboard.model.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chapterTestCardForEachSubsections.component.dart';

class ChapterTestCardComponent extends StatelessWidget {
  const ChapterTestCardComponent({
    super.key, required this.subSections,
  });

  final List<Subsections> subSections;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Stack(
              children: [
                DashedCircularProgressBar(
                    width: 90,
                    height: 90,
                    maxProgress: 100,
                    progress: 10,
                    backgroundColor: context.theme.colorScheme.outline.withOpacity(0.75),
                    backgroundStrokeWidth: 8,
                    foregroundColor: context.theme.colorScheme.primary,
                    foregroundStrokeWidth: 8,
                ),
                Positioned(
                  top: 12,
                  left: 13,
                  child: Image.asset(
                    AssetsUtil.getBookForChapterTest(),
                    height: 60,
                    width: 60,
                    alignment: Alignment.center,
                    //color: context.theme.colorScheme.,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 2),
            ChapterTestCardComponentForEachSubsections(),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}


