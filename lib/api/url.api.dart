import 'package:edepto_app/api/app.const.dart';

class UrlApi {
  static const String baseUrl = AppConst.baseUrl;

  // Student
  static const studentLogin = "$baseUrl/auth/login/student";
  static const studentAutoLogin = "$baseUrl/auth/login/student";
  static const otpVerify = "$baseUrl/auth/login/verify-otp";
  static const saveBasicInfo = "$baseUrl/auth/profile/student/init";
  // static const getProfile = "$baseUrl/auth/profile/student";

  // Basic
  static const getInAppLanguage = "$baseUrl/basic/data/language/in-app";

  // Exams Category
  static const examCategory = "$baseUrl/exam/category";

  //Exams Sub Category
  static const examSubCategory = "$baseUrl/exam/sub-category";
  static const selectExamSubCategory = "$baseUrl/exam/sub-category/courses/add";

  //Current affairs
  static const getCurrentAffairs = "$baseUrl/knowledge/newsflick/news-list";
  static const getCurrentAffairsCategoryList = "$baseUrl/knowledge/newsflick/category-list";

  //Dashboard
  static const getSubCategoryDetails = "$baseUrl/exam/sub-category/courses/sub-category";

}