import 'package:cached_network_image/cached_network_image.dart';
import 'package:edepto_app/helper/date.helper.dart';
import 'package:edepto_app/models/currentAffairs.model.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:edepto_app/helper/cacheNetworkImage.helper%20.dart';
import 'package:edepto_app/models/currentAffairs.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/assets.util.dart';

class CurrentAffairsComponent extends StatelessWidget {
  const CurrentAffairsComponent({
    super.key,
    required this.currentAffairsData,
    required this.onCurrentAffairsCardClick,
  });

  final CurrentAffaiirsData currentAffairsData;
  final Function onCurrentAffairsCardClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () => onCurrentAffairsCardClick,
        minWidth: 0,
        padding: EdgeInsets.zero,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                  height: 80,
                  width: 80,
                  child: CacheNetworkImageHelper.getImage(currentAffairsData.imageUrl??"", borderRadius: 10),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${currentAffairsData.title}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: context.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "${currentAffairsData.description}",
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
                            DateHelper().dateFormatNull(date: currentAffairsData.publishDate, format: "dd/MM/yyyy"),
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
                            "${((currentAffairsData.description?.length??0)/200).ceil()} Min".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color: context.theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
