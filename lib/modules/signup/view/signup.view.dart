import 'package:edepto_app/components/buttons/primaryButton.component.dart';
import 'package:edepto_app/components/textField/language.dropDown.component.dart';
import 'package:edepto_app/components/textField/textField.component.dart';
import 'package:edepto_app/models/language.model.dart';
import 'package:edepto_app/modules/signup/controllers/signup.controllers.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController signUpController = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetsUtil.getHomeLogo(),
          width: 132,
          height: 38,
          fit: BoxFit.contain,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Enter Name".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(
              controller: signUpController.nameController,
              hint: "Name",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Enter Email Id".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(
              controller: signUpController.emailController,
              hint: "Enter Email Id",
            ),
            const SizedBox(
              height: 30,
            ),
            LanguageDropDownComponent(
              onChanged: signUpController.onChangeLanguage,
              dropdownValue: signUpController.languageController.text,
              hintText: "Select Language",
              languageList: signUpController.dataService.inAppLanguageList,
            ),
            const SizedBox(height: 30,),
            Text(
              "Have a Referral Code?".tr,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(
              controller: signUpController.referralController,
              hint: "Enter the Code",
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButtonComponent(onClick: signUpController.onSubmit, text: "Submit"),
          ],
        ),
      ),
    );
  }
}
