import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/contact_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Pages/Chat/chat_page.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    return RefreshIndicator(
        child: Obx(
          () => ListView(
            children: contactController.chatRoomList
                .map(
                  (e) => ChartTile(
                    imageUrl: (e.receiver!.id ==
                                profileController.currentuser.value.id
                            ? e.sender!.profileImage
                            : e.receiver!.profileImage) ??
                        AssetsPathImages.avatarPic,
                    name: (e.receiver!.id ==
                            profileController.currentuser.value.id
                        ? e.sender!.name
                        : e.receiver!.name)!,
                    lastChat: e.lastMessage ?? "Last Message",
                    lastTime: e.lastMessageTimestamp ?? "09:53 PM",
                    ontap: () {
                      Get.to(() => ChatPage(
                          userModel: (e.receiver!.id ==
                                  profileController.currentuser.value.id
                              ? e.sender
                              : e.receiver)!));
                    },
                  ),
                )
                .toList(),
          ),
        ),
        onRefresh: () {
          return contactController.getChatRoomList();
        });
  }
}
