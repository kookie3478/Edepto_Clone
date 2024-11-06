import 'package:edepto_app/components/appBar/appbar.component.dart';
import 'package:edepto_app/helper/lottie.helper.dart';
import 'package:edepto_app/utils/assets.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieHelper.lottie(animationAsset: AssetsUtil.getLogoAnimation(), height: 250, width: 250,),
      ),
    );
  }
}
