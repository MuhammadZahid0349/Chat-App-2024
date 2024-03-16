import 'package:chat_app_2024/Controller/auth_controller.dart';
import 'package:chat_app_2024/Widgets/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthController authController = Get.put(AuthController());

    return Column(
      children: [
        20.h.heightBox,
        TextField(
          controller: email,
          decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(
                Icons.mail,
                size: 22.sp,
              )),
        ),
        22.h.heightBox,
        TextField(
          controller: password,
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(
                Icons.password_outlined,
                size: 22.sp,
              )),
        ),
        40.h.heightBox,
        Obx(() => authController.isLoading.value
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    btnName: "Login",
                    icon: Icons.lock_open_outlined,
                    ontap: () {
                      // Get.offAllNamed("/homePage");
                      authController.login(email.text, password.text);
                    },
                  ),
                ],
              )),
      ],
    );
  }
}
