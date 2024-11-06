import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChapterTestCardComponentForEachSubsections extends StatelessWidget {
  const ChapterTestCardComponentForEachSubsections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.theme.colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Maths",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: "(Number System)",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "120 Questions",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: context.theme.colorScheme.outline),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "30 Marks",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: context.theme.colorScheme.outline),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "10 Mins",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: context.theme.colorScheme.outline),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Hin,Eng",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.outline),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {},
              minWidth: 0,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.theme.colorScheme.primary,
                ),
                child: Text(
                  "Enroll Now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: context.theme.colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}