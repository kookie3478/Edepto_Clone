import 'package:get/get.dart';

class AllExamController extends GetxController{
  RxInt selectedButton = 0.obs;

  onClick(int value){
    selectedButton.value = value;
  }

}