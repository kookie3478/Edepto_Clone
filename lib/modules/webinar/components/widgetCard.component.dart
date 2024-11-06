import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons/primaryButton.component.dart';
import '../../../utils/assets.util.dart';

class WidgetCard extends StatelessWidget {
  const WidgetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {  },
        minWidth: 0,
        padding: EdgeInsets.zero,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        child: Container(
          decoration:BoxDecoration(
            color: context.theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      AssetsUtil.getPhotoForWebinarView(),
                      height: 220,
                      width: 360,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: context.theme.colorScheme.surfaceTint),
                      child: Text(
                        "NEW",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: context.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "OSF: A Hands-on Guide".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "Webinar explores a variety of use cases highlighting how OSF can support your open science practices and solve common problems."
                      .tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 14,
                      color: context.theme.colorScheme.outline,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "01 April 2024".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: context.theme.colorScheme.outline,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.timer_outlined,
                      size: 13,
                      color: context.theme.colorScheme.outline,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "12:30 PM - 01:30 PM".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: context.theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: PrimaryButtonComponent(
                      onClick: () {}, text: "Register")),
            ],
          ),
        ),
      ),
    );
  }
}