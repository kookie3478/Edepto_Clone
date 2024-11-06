import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets.util.dart';

class DashBoardbtn extends StatelessWidget {
  const DashBoardbtn({
    super.key,
    required this.text,
    required this.onClick,
    required this.img,
    required this.width,
    required this.color,
  });

  final String text;
  final Function onClick;
  final String img;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onClick(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      minWidth: 0,
      padding: EdgeInsets.zero,
      child: Container(
        height: 60,
        width: width,
        padding: const EdgeInsets.only(left: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color,
          //border: Border.all(color: context.theme.colorScheme.primary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize .min, // Wrap the container around its content
          children: [
            Image.asset(img, height: 36,width: 36, fit: BoxFit.contain,),
            Flexible(
              child: Text(
                text.tr,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}