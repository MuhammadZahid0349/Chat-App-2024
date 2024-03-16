// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Config/StringData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            width: 150.w,
            child: SvgPicture.asset(
              AssetsPathImages.appIconSvg,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          7.h.heightBox,
          Text(AppString.appName,
              style: Theme.of(context).textTheme.headlineLarge
              // ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
        ],
      ),
    );
  }
}
