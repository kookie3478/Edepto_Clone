import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/sharedPreferences.helper.dart';
import '../../../services/student.service.dart';
import '../../../utils/const.utils.dart';
import '../../../utils/routes.util.dart';
import '../../modules/currentAffairs/view/currentAffairs.view.dart';
import '../../modules/login/view/login.view.dart';

class DrawerComponentController extends GetxController {
  StudentService studentService = Get.find<StudentService>();

  GlobalKey<ScaffoldState>? scaffoldKey;


  init(GlobalKey<ScaffoldState> scaffoldKey) {
    this.scaffoldKey = scaffoldKey;
  }

  onUserProfileClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onInstituteClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onReferAndEarnClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onPassClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onAffiliateProgramClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onBecomeEducatorClick() async {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onPromoteAppClick() async {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onExamInformationClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onPreparationCalendarClick() {
    scaffoldKey!.currentState!.closeDrawer();
  }

  onCurrentAffairsClick() {
    scaffoldKey!.currentState!.closeDrawer();
    RoutesUtil.to(() => CurrentAffairsView());
  }

  onThemeSwitchClick() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      SharedPreferencesHelper.instance.setBool(ConstUtils.isDark, false);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      SharedPreferencesHelper.instance.setBool(ConstUtils.isDark, true);
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.back();
    });
  }

  onLogoutClick() async {
    await SharedPreferencesHelper.instance.clearAllData();
    RoutesUtil.offAll(() => LoginView());
  }
}
