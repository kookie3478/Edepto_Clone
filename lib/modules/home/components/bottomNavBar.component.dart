import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarComponent extends StatelessWidget {
  const BottomNavBarComponent({
    super.key,
    required this.text,
    required this.image,
    required this.onClick,
  });

  final String text;
  final String image;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      minWidth: 0,
      visualDensity: VisualDensity.compact,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
            fit: BoxFit.contain,
          ),
          Text(
            text.tr,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: context.theme.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}