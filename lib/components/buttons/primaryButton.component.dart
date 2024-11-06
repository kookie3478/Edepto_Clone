import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/login/controller/login.controller.dart';

class PrimaryButtonComponent extends StatelessWidget {
  const PrimaryButtonComponent({
    super.key,
    required this.onClick, required this.text,
  });

  final Function onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onClick(),
      minWidth: 0,
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          text.tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: context.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}