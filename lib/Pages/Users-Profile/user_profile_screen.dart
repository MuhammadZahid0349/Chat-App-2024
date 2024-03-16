import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/auth_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:chat_app_2024/Pages/Users-Profile/Widgets/update_profile.dart';
import 'package:chat_app_2024/Pages/Users-Profile/Widgets/user_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel userModel;
  const UserProfileScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
                onPressed: () {
                  Get.to(() => const UserUpdateProfileScreen(),
                      transition: Transition.rightToLeft);
                },
                icon: Icon(
                  Icons.edit_attributes_outlined,
                  size: 30.sp,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// login user info
            UserInfo(
              profileImage:
                  userModel.profileImage ?? AssetsPathImages.avatarPic,
              userName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  authController.logoutUser();
                },
                child: const Text("Logout")),
          ],
        ),
      ),
    );
  }
}
