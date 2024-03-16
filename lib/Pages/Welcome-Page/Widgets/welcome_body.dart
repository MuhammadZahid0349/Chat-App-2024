import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Config/StringData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 130.h,
                width: 130.w,
                child: Image.asset(AssetsPathImages.boyPic)),
            SizedBox(
                height: 50.h,
                width: 40.w,
                child: SvgPicture.asset(AssetsPathImages.connectSvg)),
            SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset(AssetsPathImages.girlPic))
          ],
        ),
        20.h.heightBox,
        Text(
          WelcomePageString.nowYouAre,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          WelcomePageString.connected,
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        20.h.heightBox,
        Text(
          WelcomePageString.description,
          style: Theme.of(context).textTheme.labelLarge,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
