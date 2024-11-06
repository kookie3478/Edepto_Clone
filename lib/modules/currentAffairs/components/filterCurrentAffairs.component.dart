import 'package:edepto_app/components/buttons/primaryButton.component.dart';
import 'package:edepto_app/helper/date.helper.dart';
import 'package:edepto_app/models/currentAffairsCategory.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterCurrentAffairs {
  static showOnClick({
    required List<CurrentAffairsCategoryData> categoryList,
    required Function onCategoryClick,
    required onClearClick,
    required onApplyClick,
    required onDateClick,
    required RxString selectedCategoryId,
    required RxString selectedDate,
  }) {
    return showModalBottomSheet(
        context: Get.context!,
        builder: (context) => Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 5,
                    width: 50,
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.onSurface,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Sort By".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () => onDateClick(),
                    minWidth: 0,
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: context.theme.colorScheme.primaryContainer,
                        border: Border.all(color: context.theme.colorScheme.outline),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                          ()=> Text(
                            selectedDate.value=="" ? DateHelper().dateFormatNull(date: DateTime.now().toString(), format: "yyyy-MM-dd") : selectedDate.value,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: context.theme.colorScheme.onSurface,
                            ),
                            ),
                          ),
                          Icon(Icons.date_range, size: 20, color: context.theme.colorScheme.outline,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: categoryList
                        .map(
                          (category) => MaterialButton(
                            onPressed: () => onCategoryClick(category.id ?? ""),
                            minWidth: 0,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Obx(
                              () => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  color: selectedCategoryId.value == category.id
                                      ? context.theme.colorScheme.primary
                                      : context.theme.colorScheme.outline,
                                ),
                                child: Text(
                                  category.name ?? "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: context.theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: PrimaryButtonComponent(
                          onClick: () => onClearClick(),
                          text: "Clear",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: PrimaryButtonComponent(
                          onClick: () => onApplyClick(),
                          text: "Apply",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
