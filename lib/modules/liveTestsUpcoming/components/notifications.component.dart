import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotificationController extends GetxController {
  RxBool isSelected = false.obs;

  void toggleNotification() {
    isSelected.value = !isSelected.value;
  }
}
