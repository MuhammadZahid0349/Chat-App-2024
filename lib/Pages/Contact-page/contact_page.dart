// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/chat_controller.dart';
import 'package:chat_app_2024/Controller/contact_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Pages/Chat/chat_page.dart';
import 'package:chat_app_2024/Pages/Contact-page/Widgets/contact_search.dart';
import 'package:chat_app_2024/Pages/Contact-page/Widgets/new_contact_tile.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/chat_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Contacts",
        ),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon: isSearchEnable.value
                  ? Icon(
                      Icons.close,
                      size: 25.sp,
                    )
                  : Icon(
                      Icons.search,
                      size: 25.sp,
                    )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            10.h.heightBox,
            NewContactTile(
              btnName: "New Contact",
              icon: Icons.person_add,
              ontap: () {},
            ),
            15.h.heightBox,
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {},
            ),
            5.h.heightBox,
            Row(
              children: const [
                Text(
                  "Contacts on Chat-App",
                  // style: Theme.of(context).textTheme.bodyMedium),
                )
              ],
            ),
            15.h.heightBox,
            Obx(() => Column(
                  children: contactController.userList
                      .map((e) => ChartTile(
                            imageUrl:
                                e.profileImage ?? AssetsPathImages.avatarPic,
                            name: e.name ?? "User ",
                            lastChat: e.about ?? "Hey there!!",
                            lastTime: e.email ==
                                    profileController.currentuser.value.email
                                ? "You"
                                : "",
                            ontap: () {
                              // Get.toNamed("/chatPage");
                              Get.to(() => ChatPage(
                                    userModel: e,
                                  ));
                              // String roomID = chatController.getRoomID(e.id!);
                              // print(roomID);
                            },
                          ))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
