import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageButtonComponent extends StatelessWidget {
  const PageButtonComponent({
    super.key,
    required this.text,
    required this.onClick,
    required this.isSelected,
  });

  final String text;
  final Function onClick;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: MaterialButton(
        onPressed: () => onClick(),
        minWidth: 0,
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? context.theme.colorScheme.primary
                    : Colors.transparent,
              ),
            ),
          ),
          child: Text(
            text.tr,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? Colors.blue
                  : context.theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
