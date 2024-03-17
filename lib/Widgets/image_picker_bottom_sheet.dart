import 'package:chat_app_2024/Controller/chat_controller.dart';
import 'package:chat_app_2024/Controller/image_picker_controller.dart';
import 'package:chat_app_2024/Pages/Chat/Widgets/bottom_sheet_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> imagePickerBottomSheet(
    BuildContext context,
    ChatController chatController,
    ImagePickerController imagePickerController) {
  return Get.bottomSheet(Container(
    height: 140.h,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        )),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BottomSheetIconsBtn(
          iconData: Icons.camera,
          onTap: () async {
            chatController.selectedImagePath.value =
                await imagePickerController.pickImage(ImageSource.camera);
            Get.back();
          },
        ),
        BottomSheetIconsBtn(
          iconData: Icons.photo,
          onTap: () async {
            chatController.selectedImagePath.value =
                await imagePickerController.pickImage(ImageSource.gallery);
            Get.back();
          },
        ),
        BottomSheetIconsBtn(
          iconData: Icons.play_arrow,
          onTap: () {},
        ),
      ],
    ),
  ));
}
