import 'package:get/get.dart';

class ChapterTestController extends GetxController{

  RxBool isSelected = false.obs;
  RxInt val=0.obs;
  onClick(int value){
    val.value=value;
  }
}