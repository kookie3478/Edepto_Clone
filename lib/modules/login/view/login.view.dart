import 'package:edepto_app/main.dart';
import 'package:edepto_app/modules/login/controller/login.controller.dart';
import 'package:edepto_app/modules/otpVerify/view/otpVerify.view.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons/primaryButton.component.dart';
import '../../../components/textField/textField.component.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginController loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const SizedBox(height: 20),
              Image.asset(AssetsUtil.getLoginImage()),
              const SizedBox(height: 20),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 80),
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              TextFieldComponent(
                controller: loginController.phoneNumberController,
                hint: "Phone Number",
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              const SizedBox(height: 20),
              PrimaryButtonComponent(
                onClick: loginController.onLoginClick,
                text: "Login",
              ),
              const SizedBox(height: 30),
              Text(
                "A 6 digit OTP will be sent to your mobile number.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
