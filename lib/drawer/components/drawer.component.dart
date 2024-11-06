import 'package:edepto_app/services/student.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/assets.util.dart';
import '../controller/drawer.controller.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({
    super.key,
    required this.scaffoldKey,
  });

  final DrawerComponentController drawerComponentController =
      DrawerComponentController();
  final StudentService studentService = Get.find<StudentService>();
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    drawerComponentController.init(scaffoldKey);
    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: context.theme.colorScheme.surface,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: context.theme.colorScheme.surface,
            padding: const EdgeInsets.only(left: 10, top: 30),
            height: 150,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(AssetsUtil.getHomeLogo()),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        studentService.studentData.name ?? 'User Name'.tr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: context.theme.colorScheme.onBackground,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          Text(
                            studentService.studentData.mobileNumber ??
                                'User mobile no.'.tr,
                            style: TextStyle(
                                color: context.theme.colorScheme.outline,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.verified,
                              color: context.theme.colorScheme.primary),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buildListTile(
            context,
            title: 'User Profile',
            icon: Icons.person_2_outlined,
            onTap: drawerComponentController.onUserProfileClick,
          ),
          buildListTile(
            context,
            title: 'Pass',
            icon: Icons.credit_card_rounded,
            onTap: drawerComponentController.onPassClick,
          ),
          buildListTile(
            context,
            title: 'Refer & Earn',
            icon: Icons.card_giftcard_outlined,
            onTap: drawerComponentController.onReferAndEarnClick,
          ),
          buildListTile(
            context,
            title: 'Become Educator',
            icon: Icons.school_outlined,
            onTap: drawerComponentController.onBecomeEducatorClick,
          ),
          buildListTile(
            context,
            title: 'Preparation Calendar',
            icon: Icons.calendar_month_outlined,
            onTap: drawerComponentController.onPreparationCalendarClick,
          ),
          buildListTile(
            context,
            title: 'Current Affairs',
            icon: Icons.analytics_outlined,
            onTap: drawerComponentController.onCurrentAffairsClick,
          ),
          buildListTile(
            context,
            title: Get.isDarkMode ? 'Light Theme' : "Dark Theme",
            icon: Get.isDarkMode ? Icons.light_mode : Icons.dark_mode_outlined,
            onTap: drawerComponentController.onThemeSwitchClick,
          ),
          buildListTile(
            context,
            title: 'Promote app',
            icon: Icons.campaign_outlined,
            onTap: drawerComponentController.onPromoteAppClick,
          ),
          buildListTile(
            context,
            title: 'Logout',
            icon: Icons.logout,
            onTap: drawerComponentController.onLogoutClick,
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: Text(
        title.tr,
        style: TextStyle(
          color: context.theme.colorScheme.onBackground,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Icon(icon, color: context.theme.colorScheme.onBackground),
      onTap: () => onTap(),
    );
  }
}
