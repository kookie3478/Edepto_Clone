import 'dart:io';
import 'package:edepto_app/api/call.api.dart';
import 'package:edepto_app/helper/sharedPreferences.helper.dart';
import 'package:edepto_app/modules/splashScreen/view/splashScreen.view.dart';
import 'package:edepto_app/services/app.service.dart';
import 'package:edepto_app/services/data.service.dart';
import 'package:edepto_app/services/student.service.dart';
import 'package:edepto_app/utils/const.utils.dart';
import 'package:edepto_app/utils/theme.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await SharedPreferencesHelper.instance.init();
  ApiCall.configureDio();
  Get.put(DataService());
  Get.put(StudentService());
  Get.put(AppService());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: (SharedPreferencesHelper.instance.getBool(ConstUtils.isDark)??false) ? ThemeMode.dark : ThemeMode.light,
      theme: ThemesUtil.light,
      darkTheme: ThemesUtil.dark,
      home: const SplashScreenView(),
    );
  }
}
