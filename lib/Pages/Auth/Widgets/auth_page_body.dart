import 'package:chat_app_2024/Pages/Auth/Widgets/login_form.dart';
import 'package:chat_app_2024/Pages/Auth/Widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = true.obs;

    return Container(
      // height: 270.h,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: Get.width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                              ),
                              3.h.heightBox,
                              AnimatedContainer(
                                  width: isLogin.value ? 100.w : 0.w,
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  duration: const Duration(milliseconds: 200))
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: Get.width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.labelLarge
                                    : Theme.of(context).textTheme.bodyLarge,
                              ),
                              3.h.heightBox,
                              AnimatedContainer(
                                  width: isLogin.value ? 0.w : 100.w,
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  duration: const Duration(microseconds: 200))
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Obx(() => isLogin.value ? LoginForm() : SignUpForm())
            ],
          ))
        ],
      ),
    );
  }
}
