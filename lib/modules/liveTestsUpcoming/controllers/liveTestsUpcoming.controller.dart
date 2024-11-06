import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LiveTestUpcomingController extends GetxController{
  RxInt selectedButton = 0.obs;
  RxBool isSelected = false.obs;
  PageController pageController = PageController();


  void toggleNotification() {
    isSelected.value = !isSelected.value;
  }

  onPageChanged(int page) {
    selectedButton.value = page;
  }

  onPageButtonClick(int value){
    selectedButton.value = value;
    pageController.jumpToPage(value);
  }
}