// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Pages/Users-Profile/Widgets/profile_buttons_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class UserInfo extends StatelessWidget {
  final String profileImage;
  final String userName;
  final String userEmail;
  const UserInfo(
      {super.key,
      required this.profileImage,
      required this.userName,
      required this.userEmail});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());

    return Container(
      // height: 100.h,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: CachedNetworkImage(
                            imageUrl: profileImage,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ))),
                ],
              ),
              Text(
                userName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                userEmail,
              ),
              20.h.heightBox,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileIconButton(
                    btnName: "Call",
                    icon: Icons.call,
                    color: Color(0xff039C00),
                  ),
                  ProfileIconButton(
                    btnName: "Video",
                    icon: Icons.video_call_rounded,
                    color: Color(0xffFF9900),
                  ),
                  ProfileIconButton(
                    btnName: "Chat",
                    icon: Icons.chat,
                    color: Color(0xffF93C00),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
