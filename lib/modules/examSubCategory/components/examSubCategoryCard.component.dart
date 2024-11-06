import 'package:edepto_app/models/examSubCategory.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/moreLanguage/moreLanguage.component.dart';
import '../../../helper/cacheNetworkImage.helper .dart';

class ExamSubCategoryCard extends StatelessWidget {
  const ExamSubCategoryCard({
    super.key,
    required this.onCardClick,
    required this.examSubCategoryData,
    required this.getLanguages,
  });

  final ExamSubCategoryData examSubCategoryData;
  final Function onCardClick;
  final Function getLanguages;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onCardClick(examSubCategoryData.id),
      minWidth: 0,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CacheNetworkImageHelper.getImage(
                      examSubCategoryData.icon ?? ""),
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (examSubCategoryData.subCategoryName ?? "").tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Text(
                              "${(examSubCategoryData.paidTestCount ?? 0) + (examSubCategoryData.freeTestCount ?? 0)} total"
                                  .tr,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: context.theme.colorScheme.outline,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 1,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              color: context.theme.colorScheme.outline,
                            ),
                            Text(
                              "${examSubCategoryData.freeTestCount} free",
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed:
                              (examSubCategoryData.languages?.length ?? 0) > 2
                                  ? () => MoreLanguageComponent.show(context: context, languagesList: examSubCategoryData.languages!)
                                  : () {},
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Row(
                            children: [
                              Text(
                                getLanguages(examSubCategoryData),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: context.theme.colorScheme.outline,
                                ),
                              ),
                              (examSubCategoryData.languages?.length ?? 0) > 2
                                  ? const SizedBox(width: 5)
                                  : const SizedBox.shrink(),
                              (examSubCategoryData.languages?.length ?? 0) > 2
                                  ? Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        color: context
                                            .theme.colorScheme.outlineVariant,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            context.theme.colorScheme.primary,
                                        size: 11,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.add_circle_outline,
                  size: 20,
                  color: context.theme.colorScheme.primary,
                )
              ],
            )),
      ),
    );
  }
}
