// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Pages/Welcome-Page/Widgets/welcome_body.dart';
import 'package:chat_app_2024/Pages/Welcome-Page/Widgets/welcome_footer_btn.dart';
import 'package:chat_app_2024/Pages/Welcome-Page/Widgets/welcome_heading.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 30.h.heightBox,
            WelcomeHeading(),
            // 40.h.heightBox,
            WelcomeBody(),
            // 35.h.heightBox,
            WelcomeFooterBtn(),
          ],
        ),
      )),
    );
  }
}
