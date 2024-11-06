import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinHelper extends StatelessWidget {
  const PinHelper({super.key, required this.controller, this.size = 50});
  final TextEditingController controller;
  final double size;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 6,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        fieldHeight: size,
        fieldWidth: size,
        borderRadius: BorderRadius.circular(5),
        inactiveFillColor: context.theme.colorScheme.primaryContainer,
        inactiveColor: context.theme.colorScheme.primaryContainer,
        selectedFillColor: context.theme.colorScheme.primaryContainer,
        selectedColor: context.theme.colorScheme.primaryContainer,
        activeFillColor: context.theme.colorScheme.primaryContainer,
        activeColor: context.theme.colorScheme.primaryContainer,
        borderWidth: 2,
        inactiveBorderWidth: 2,
        activeBorderWidth: 2,
        selectedBorderWidth: 2,
      ),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
    );
  }
}
