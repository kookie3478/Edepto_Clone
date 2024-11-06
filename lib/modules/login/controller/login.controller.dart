import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/helper/regex.helper.dart';
import 'package:edepto_app/helper/snackBar.helper.dart';
import 'package:edepto_app/models/login.model.dart';
import 'package:edepto_app/utils/routes.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/loadingPage/loadingPage.component.dart';
import '../../otpVerify/view/otpVerify.view.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  onLoginClick() async {
    phoneNumberController.text = phoneNumberController.text.trim();

    if (!RegexHelper.mobileRegex.hasMatch(phoneNumberController.text)) {
      SnackBarHelper.error("Please enter valid mobile number");
      return;
    }

    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.studentLogin}/${phoneNumberController.text}?encryption=false");
    LoadingPage.close();

    LoginModel loginModel = LoginModel.fromJson(resp);

    if(loginModel.responseCode == 200) {
      RoutesUtil.offAll(()=>OtpVerifyView(
        otpId: loginModel.data??"",
        phoneNumber: phoneNumberController.text,
      ));
    }
    else {
      SnackBarHelper.error(loginModel.message);
    }
  }
}
