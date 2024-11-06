import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {

  static void success(String? message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      'Success'.tr,
      message?.tr ?? 'Success'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }

  static void error(String? message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      'Error'.tr,
      message?.tr ?? 'Error'.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }

}