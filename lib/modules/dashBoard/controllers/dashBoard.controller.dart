import 'dart:ffi';
import 'dart:math';
import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/api/url.api.dart';
import 'package:edepto_app/components/loadingPage/loadingPage.component.dart';
import 'package:edepto_app/helper/date.helper.dart';
import 'package:edepto_app/models/dashboard.model.dart';
import 'package:edepto_app/modules/chapterTest/view/chapterTest.view.dart';
import 'package:edepto_app/modules/currentAffairs/view/currentAffairs.view.dart';
import 'package:edepto_app/modules/examCategory/view/examCategory.view.dart';
import 'package:edepto_app/modules/tips&tricks/view/tips&tricks.view.dart';
import 'package:edepto_app/modules/webinar/view/webinar.view.dart';
import 'package:edepto_app/services/student.service.dart';
import 'package:edepto_app/utils/routes.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardController extends GetxController{
  GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();


  // For updating the student data in the app we need to use student service
  StudentService studentService = Get.find<StudentService>();

  // For API calling first define the container with valid data type, check from the model,
 Rx<DashBoardData> dashboardData = DashBoardData().obs;

 // Whenever the dash board controller is called in the view page the function calls
 DashBoardController() {
   Future.delayed(200.milliseconds, () => getDashboardData());
 }

 // This is function to get the data for the dashboard from the api
  Future<void> getDashboardData() async{
    LoadingPage.show();
    var resp = await ApiCall.get("${UrlApi.getSubCategoryDetails}?encryption=false");
    LoadingPage.close();

    DashboardModel dashboardModel = DashboardModel.fromJson(resp);
    if(dashboardModel.responseCode==200) {
      dashboardData.value = dashboardModel.data ?? DashBoardData();
    }
  }


  // Routing to pages through material buttons

  onCurrentAffairsClick(){
   RoutesUtil.to(()=>CurrentAffairsView());
  }

  onChangeCourseClick() {
    RoutesUtil.to(()=>ExamCategoryView());
  }

  onClickingTestCard(){
   RoutesUtil.to(()=>ChapterTestView(testSections: dashboardData.value.testSections??[]));
  }

  onWebinarClick(){
   RoutesUtil.to(()=>WebinarView());
  }

  onTipsAndTricksClick(){
   RoutesUtil.to(()=>TipsAndTricksView());
  }

  onJobUpdates() async {

   try {
    await launchUrl(Uri.parse("https://pub.dev/packages/url_launcher"), mode: LaunchMode.externalApplication);
   }
   catch(e) {print(e);}
  }




  String  greetingToTheUser(){
   String str="";
   String time="";
   time= DateHelper().dateFormatNull(date: DateTime.now().toString(), format: "hh");
   int hour = int.parse(time);
   print(hour);
   if(hour>6 && hour<12){
     str="Good Morning !";
   }
   else if(hour>=12 && hour<16){
     str="Good Afternoon !";
   }
   else if(hour>=16 && hour<20){
     str="Good Evening !";
   }else{
     str="Good Night !";
   }
   return str;
  }

}
