// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/chat_controller.dart';
import 'package:chat_app_2024/Controller/image_picker_controller.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:chat_app_2024/Pages/Chat/Widgets/bottom_sheet_btns.dart';
import 'package:chat_app_2024/Widgets/image_picker_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class TypeMessageBody extends StatelessWidget {
  final UserModel userModel;
  const TypeMessageBody({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
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
          Obx(() => chatController.selectedImagePath.value == ""
              ? InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    imagePickerBottomSheet(
                        context, chatController, imagePickerController);
                  },
                  child: SizedBox(
                    height: 26.h,
                    width: 26.w,
                    child: SvgPicture.asset(
                      AssetsPathImages.chatGallerySvg,
                      width: 23.0,
                    ),
                  ),
                )
              : const SizedBox()),
          4.w.widthBox,
          Obx(
            () => message.value != "" ||
                    chatController.selectedImagePath.value != ""
                ? InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      if (messageController.text.isNotEmpty ||
                          chatController.selectedImagePath.value.isNotEmpty) {
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
                  )
                : SizedBox(
                    height: 26.h,
                    width: 26.w,
                    child: chatController.isLoading.value
                        ? const CircularProgressIndicator()
                        : SvgPicture.asset(
                            AssetsPathImages.chatMicSvg,
                            width: 25.0,
                          ),
                  ),
          )
        ],
      ),
    );
  }
}
