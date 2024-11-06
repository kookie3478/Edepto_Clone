import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/sharedPreferences.helper.dart';
import 'package:edepto_app/models/student.model.dart';
import 'package:edepto_app/modules/dashBoard/view/dashBoard.view.dart';
import 'package:edepto_app/modules/login/view/login.view.dart';
import 'package:edepto_app/modules/signup/view/signup.view.dart';
import 'package:edepto_app/services/data.service.dart';
import 'package:edepto_app/services/student.service.dart';
import 'package:edepto_app/utils/const.utils.dart';
import 'package:edepto_app/utils/routes.util.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../modules/examCategory/view/examCategory.view.dart';

class AppService extends GetxController {
  StudentService studentService = Get.find<StudentService>();
  DataService dataService = Get.find<DataService>();
  Logger logger = Logger();

  // Whenever the App service function is initiated by get in the main.dart file,
  // it calls this onInit function which then checks for the autologin feature
  @override
  onInit() {
    super.onInit();

    Future.delayed(3.seconds, () {
      autoLoginCheck();
    });
  }

  // Checking for the autologin function so that the user stays logged in and
  // doesn't need to login again and again after going out of the app

  autoLoginCheck({bool showLoading = false}) async {
    String studentId = SharedPreferencesHelper.instance.getString(ConstUtils.studentId) ?? "";
    String autoLoginId = SharedPreferencesHelper.instance.getString(ConstUtils.autoLoginId) ?? "";

    if (studentId != "" && autoLoginId != "") {
      if(showLoading) {
        LoadingPage.show();
      }
      var resp = await ApiCall.get("${UrlApi.studentAutoLogin}/$studentId/$autoLoginId?encryption=false");
      if(showLoading) {
        LoadingPage.close();
      }

      StudentModel studentModel = StudentModel.fromJson(resp);

      if (studentModel.responseCode == 200) {
        studentService.studentData = studentModel.data ?? StudentData();
        appStart();
      } else {
        SharedPreferencesHelper.instance.deleteData(ConstUtils.studentId);
        SharedPreferencesHelper.instance.deleteData(ConstUtils.autoLoginId);
        RoutesUtil.offAll(() => LoginView());
      }
    } else {
      SharedPreferencesHelper.instance.deleteData(ConstUtils.studentId);
      SharedPreferencesHelper.instance.deleteData(ConstUtils.autoLoginId);
      RoutesUtil.offAll(() => LoginView());
    }
  }

  void appStart() async {
    await dataService.getInAppLanguageList();

    if (studentService.studentData.initPage == 1) {
      RoutesUtil.offAll(() => DashBoardView());
    } else if (studentService.studentData.initPage == 2) {
      RoutesUtil.offAll(() => ExamCategoryView());
    } else if (studentService.studentData.initPage == 5) {
      RoutesUtil.offAll(() => SignUpView());
    } else {
      RoutesUtil.offAll(() => DashBoardView());
    }
  }
}
