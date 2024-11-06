import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultCardComponent extends StatelessWidget {
  const ResultCardComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Free
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Free".tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          // Test name + result
          Padding(
            padding: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Inventore aut esse test 1".tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Result".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.theme.colorScheme.primary.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "12/15 Marks".tr,
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
                  "256/759 Rank".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
                Spacer(),
                Text(
                  "Attempted 04 Aug, 2023".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            child: Container(
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.shadow
                    .withOpacity(0.95),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Text(
                "Reattempt".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}