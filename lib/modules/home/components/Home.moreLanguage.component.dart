import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreLanguageComponent {
  static show() {
    return showModalBottomSheet(
      context: Get.context!,
      builder: (context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: context.theme.colorScheme.primaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // a small box above
            Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: context.theme.colorScheme.shadow,
              ),
            ),
            const SizedBox(height: 10,
            ),
            // Language text
            Text(
              "Language".tr,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ["Hindi", "English", "Bengali", "Marathi", "Gujurati"].map(
                    (language) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    color: context.theme.colorScheme.shadow.withOpacity(0.75),
                  ),
                  child: Text(
                    language,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.outline,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}