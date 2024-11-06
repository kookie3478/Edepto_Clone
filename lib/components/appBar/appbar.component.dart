import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/assets.util.dart';

class AppbarComponent {
  static PreferredSize buildAppBar({
    bool titleShown = false,
    String? title,
    showDrawer = false,
    showFilter = false,
    Function? onFilterClick,
    showChangeCourse = false,
    Function? onChangeCourse,
    showInstituteChange = false,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Builder(
        builder: (context) {
          return AppBar(
            scrolledUnderElevation: 0,
            title: titleShown
                ? title != null
                    ? Text(title.tr)
                    : Image.asset(AssetsUtil.getHomeLogo(), height: 26)
                : null,
            leading: showDrawer
                ? IconButton(
                    icon: const Icon(Icons.menu),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        context.theme.colorScheme.onPrimaryContainer,
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.theme.colorScheme.primaryContainer,
                      ),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )
                : Navigator.canPop(context)
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                            context.theme.colorScheme.onPrimaryContainer,
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            context.theme.colorScheme.primaryContainer,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    : null,
            automaticallyImplyLeading: false,
            actions: [
              showFilter
                  ? MaterialButton(
                      onPressed: () => onFilterClick!(),
                      minWidth: 0,
                      padding: const EdgeInsets.only(
                          left: 30, bottom: 20, top: 20, right: 20),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      visualDensity: VisualDensity.compact,
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 28,
                        color: context.theme.colorScheme.onBackground,
                      ),
                    )
                  : const SizedBox.shrink(),
              showChangeCourse
                ? MaterialButton(
                onPressed: () => onChangeCourse!(),
                minWidth: 0,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                color: context.theme.colorScheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: Row(
                  children: [
                    Image.asset(AssetsUtil.getCourseIcon(), height: 20, width: 20, fit: BoxFit.contain,),
                    const SizedBox(width: 10,),
                    Text(
                      "Course >",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                )
                              )
                : const SizedBox.shrink(),
              const SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }

  static PreferredSize buildTestAppBar({
    required String title,
    required Rx<int> timer,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBar(
            centerTitle: false,
            scrolledUnderElevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    (timer / 3600) > 1
                        ? "0${timer ~/ 3600}:${(timer ~/ 60) % 60 <= 9 ? "0${timer ~/ 60 % 60}" : (timer ~/ 60) % 60}:${timer % 60 <= 9 ? "0${timer % 60}" : timer % 60}"
                        : "${timer ~/ 60 <= 9 ? "0${timer ~/ 60}" : timer ~/ 60}:${timer % 60 <= 9 ? "0${timer % 60}" : timer % 60}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: timer ~/ 60 <= 1
                          ? context.theme.colorScheme.surfaceTint
                          : context.theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title.tr,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: context.theme.colorScheme.outline,
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      context.theme.colorScheme.onPrimaryContainer,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.theme.colorScheme.primaryContainer,
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
