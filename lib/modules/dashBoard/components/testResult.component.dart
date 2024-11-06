import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestResult extends StatelessWidget {
  const TestResult({
    super.key,
    required this.text1,
    required this.text2,
    required this.img,
  });

  final String text1, text2, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: context.theme.colorScheme.onPrimary,
      ),
      child: Row(
        children: [
          Image.asset(img, height: 24, width: 24, fit: BoxFit.cover,),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1.tr,
                style: TextStyle(
                  fontSize:14,
                  fontWeight: FontWeight.w700,
                  color: context.theme.colorScheme.primary,
                ),
              ),
              Text(
                  text2.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.primary,
                  ),
              ),
                ],
          ),
        ],
      ),
    );
  }
}