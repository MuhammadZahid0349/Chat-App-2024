// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Config/StringData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterBtn extends StatelessWidget {
  const WelcomeFooterBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: SlideAction(
        onSubmit: () {
          Get.offAllNamed("/authPage");
        },
        sliderButtonIconSize: 20.0,
        sliderButtonIconPadding: 5.0,
        sliderButtonIcon: SvgPicture.asset(
          AssetsPathImages.plugSVg,
          width: 30.w,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        submittedIcon: SvgPicture.asset(
          AssetsPathImages.connectSvg,
          width: 30.w,
        ),
        text: WelcomePageString.slideToStart,
        textStyle: Theme.of(context).textTheme.labelLarge,
        // animationDuration: const Duration(seconds: 2),
        innerColor: Theme.of(context).colorScheme.primary,
        outerColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
