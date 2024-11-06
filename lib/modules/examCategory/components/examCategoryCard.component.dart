import 'package:edepto_app/helper/cacheNetworkImage.helper%20.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamCategoryCardComponent extends StatelessWidget {
  const ExamCategoryCardComponent({
    super.key,
    required this.onClick,
    required this.text,
    required this.img,
  });

  final Function onClick;
  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () => onClick(),
        visualDensity: VisualDensity.compact,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        minWidth: 0,
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.theme.colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CacheNetworkImageHelper.getImage(img),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: context.theme.colorScheme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
