import 'package:edepto_app/components/buttons/primaryButton.component.dart';
import 'package:edepto_app/modules/otpVerify/controllers/otp.controllers.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/pin.helper.dart';

class OtpVerifyView extends StatelessWidget{
  OtpVerifyView({super.key, required this.otpId, required this.phoneNumber});

  final OtpController otpController= OtpController();
  final String otpId;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Image.asset(AssetsUtil.getOtpImage()),
              const SizedBox(height: 30),
              Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "enter the OTP you received to",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.outline,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "+91 $phoneNumber",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 10),
              PinHelper(controller: otpController.otpController),
              const SizedBox(height: 10),
              PrimaryButtonComponent(onClick: ()=>otpController.onSubmitClick(otpId), text: "Submit"),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}