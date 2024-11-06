import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/regex.helper.dart';
import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/language.model.dart';
import 'package:edepto_app/models/student.model.dart';
import 'package:edepto_app/services/app.service.dart';
import 'package:edepto_app/services/data.service.dart';
import 'package:edepto_app/services/student.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  AppService appService = Get.find<AppService>();
  DataService dataService = Get.find<DataService>();
  StudentService studentService = Get.find<StudentService>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController referralController = TextEditingController();

  onChangeLanguage(LanguageData? value) {
    if (value != null) {
      languageController.text = value.id!;
    }
  }

  onSubmit() async {
    nameController.text = nameController.text.trim();
    emailController.text = emailController.text.trim();
    languageController.text = languageController.text.trim();
    referralController.text = referralController.text.trim();

    if(!RegexHelper.nameRegex.hasMatch(nameController.text)) {
      SnackBarHelper.error("Enter valid name");
      return;
    }
    if(!RegexHelper.emailRegex.hasMatch(emailController.text)) {
      SnackBarHelper.error("Enter valid email");
      return;
    }
    if(languageController.text.isEmpty) {
      SnackBarHelper.error("Please select an App Language");
      return;
    }

    Map<String, dynamic> data = {
      "name": nameController.text,
      "emailId": emailController.text,
      "language": languageController.text
    };

    if(referralController.text.isNotEmpty) {
      data["referralCode"] = referralController.text;
    }

    LoadingPage.show();
    var resp = await ApiCall.put("${UrlApi.saveBasicInfo}?encryption=false", data);
    LoadingPage.close();

    StudentModel studentModel = StudentModel.fromJson(resp);

    if(studentModel.responseCode == 200) {
      studentService.studentData = studentModel.data ?? StudentData();
      appService.appStart();
    }
    else {
      SnackBarHelper.error(studentModel.message);
    }

  }
}
