// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/chat_controller.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class TypeMessageBody extends StatelessWidget {
  final UserModel userModel;
  const TypeMessageBody({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();

    RxString message = "".obs;

    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: SvgPicture.asset(
              AssetsPathImages.chatEmojiSvg,
              width: 23.0,
              color: const Color(0xffFF9900),
            ),
          ),
          8.w.widthBox,
          Expanded(
              child: TextField(
            onChanged: (value) {
              message.value = value;
            },
            controller: messageController,
            decoration: const InputDecoration(
                filled: false, hintText: "Type message ..."),
          )),
          8.w.widthBox,
          SizedBox(
            height: 26.h,
            width: 26.w,
            child: SvgPicture.asset(
              AssetsPathImages.chatGallerySvg,
              width: 23.0,
            ),
          ),
          4.w.widthBox,
          Obx(
            () => message.value == ""
                ? SizedBox(
                    height: 26.h,
                    width: 26.w,
                    child: SvgPicture.asset(
                      AssetsPathImages.chatMicSvg,
                      width: 25.0,
                    ),
                  )
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        chatController.sendMessage(
                            userModel.id!, messageController.text, userModel);
                        messageController.clear();
                        message.value = "";
                      }
                    },
                    child: SizedBox(
                      height: 26.h,
                      width: 26.w,
                      child: SvgPicture.asset(
                        AssetsPathImages.chatSendSvg,
                        width: 23.0,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
