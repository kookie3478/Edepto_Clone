import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/sharedPreferences.helper.dart';
import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/student.model.dart';
import 'package:edepto_app/services/app.service.dart';
import 'package:edepto_app/services/student.service.dart';
import 'package:edepto_app/utils/const.utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  StudentService studentService = Get.find<StudentService>();
  AppService appService = Get.find<AppService>();
  TextEditingController otpController= TextEditingController();

  onSubmitClick(String otpId) async {
    otpController.text = otpController.text.trim();

    if(otpController.text.length < 6) {
      SnackBarHelper.error("Please enter 6 digit OTP");
      return;
    }
    
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.otpVerify}/$otpId/${otpController.text}?encryption=false");
    LoadingPage.close();

    StudentModel studentModel = StudentModel.fromJson(resp);

    if(studentModel.responseCode == 200) {
      SharedPreferencesHelper.instance.setString(ConstUtils.studentId, studentModel.data?.id??"");
      SharedPreferencesHelper.instance.setString(ConstUtils.autoLoginId, studentModel.data?.autoLoginToken??"");
      studentService.studentData = studentModel.data ?? StudentData();
      appService.autoLoginCheck();
    }
    else {
      SnackBarHelper.error(studentModel.message);
    }

  }
}