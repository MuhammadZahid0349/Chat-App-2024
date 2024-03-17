import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/chat_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Model/chat_model_f.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:chat_app_2024/Pages/Chat/Widgets/chat_bubble.dart';
import 'package:chat_app_2024/Pages/Chat/Widgets/type_message_body.dart';
import 'package:chat_app_2024/Pages/Users-Profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatPage extends StatelessWidget {
  final UserModel userModel;
  const ChatPage({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: false,
        title: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => UserProfileScreen(
                  userModel: userModel,
                ));
          },
          child: Row(
            children: [
              SizedBox(
                height: 50.h,
                width: 50.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          userModel.profileImage ?? AssetsPathImages.avatarPic,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
              ),
              8.w.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                size: 22.sp,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_call,
                size: 22.sp,
              ))
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: TypeMessageBody(
      //   userModel: userModel,
      // ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    StreamBuilder<List<ChatModel>>(
                        stream: chatController.getMessages(userModel.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text("Erro: ${snapshot.error}"),
                            );
                          }
                          if (snapshot.data == null) {
                            return const Center(
                              child: Text("No Message"),
                            );
                          } else {
                            return ListView.builder(
                                reverse: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  DateTime timestamp = DateTime.parse(
                                      snapshot.data![index].timestamp!);
                                  String formattedTime =
                                      DateFormat('hh:mm a').format(timestamp);
                                  return ChatBubble(
                                      message: snapshot.data![index].message!,
                                      time: formattedTime,
                                      status: "read",
                                      isComming:
                                          snapshot.data![index].receiverId ==
                                              profileController
                                                  .currentuser.value.id,
                                      imageUrl:
                                          snapshot.data![index].imageUrl ?? "");
                                });
                          }
                        }),
                    Obx(() => (chatController.selectedImagePath.value != "")
                        ? Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  height: 320.h,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      image: DecorationImage(
                                        image: FileImage(
                                          File(chatController
                                              .selectedImagePath.value),
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                ),
                                Positioned(
                                  right: 0.0,
                                  child: IconButton(
                                    onPressed: () {
                                      chatController.selectedImagePath.value =
                                          "";
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ))
                        : const SizedBox())
                  ],
                ),
              ),
              TypeMessageBody(userModel: userModel)
            ],
          )),
    );
  }
}
