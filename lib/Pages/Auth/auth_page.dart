import 'package:chat_app_2024/Pages/Auth/Widgets/auth_page_body.dart';
import 'package:chat_app_2024/Pages/Welcome-Page/Widgets/welcome_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                20.h.heightBox,
                const WelcomeHeading(),
                30.h.heightBox,
                const AuthPageBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
