// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashScreenController =
        Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AssetsPathImages.appIconSvg,
          width: 150.w,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
