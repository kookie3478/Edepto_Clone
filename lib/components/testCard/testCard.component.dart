import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/assets.util.dart';

class TestCardComponent extends StatelessWidget {
  const TestCardComponent({
    super.key,
    required this.isLive,
  });

  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Free",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.scrim,
                  ),
                ),
                Text(
                  isLive ? "Live" : "22 Aug, 10:30AM",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.theme.colorScheme.surfaceTint,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Inventore aut esse test 1",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "20 Qes",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
                Container(
                  height: 12,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  color: context.theme.colorScheme.outline,
                ),
                Text(
                  "30 Marks",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
                Container(
                  height: 12,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  color: context.theme.colorScheme.outline,
                ),
                Text(
                  "20 Min",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "English",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: context.theme.colorScheme.primary.withOpacity(0.75),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 40,
                  width: 110,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      const Positioned(
                        child: SizedBox(
                          height: 30,
                          width: 110,
                          // color: Colors.green,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            color: Colors.grey,
                            child: ClipOval(
                              child: Image.asset(
                                AssetsUtil.getProfilePic(),
                                // height: 26,
                                // width: 26,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        child: ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            color: Colors.grey,
                            child: ClipOval(
                              child: Image.asset(
                                AssetsUtil.getProfilePic(),
                                // height: 26,
                                // width: 26,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        child: ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            color: Colors.grey,
                            child: ClipOval(
                              child: Image.asset(
                                AssetsUtil.getProfilePic(),
                                // height: 26,
                                // width: 26,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 60,
                        child: ClipOval(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(2),
                            height: 30,
                            width: 30,
                            color: Colors.lightBlueAccent.withOpacity(0.95),
                            child: ClipOval(
                                child: Text(
                              "1.2k".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: context.theme.colorScheme.onSurface,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // notification btn
                isLive
                    ? Text(
                        "2hr 36Min Left",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: context.theme.colorScheme.outline,
                        ),
                      )
                    : Obx(
                        () => IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: true.obs.value
                                ? context.theme.colorScheme.primary
                                : context.theme.colorScheme.outline,
                          ),
                          onPressed: () {},
                        ),
                      ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            child: Container(
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.shadow.withOpacity(0.95),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: Text(
                "Enrolled Now".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
