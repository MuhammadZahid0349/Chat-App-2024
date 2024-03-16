import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_2024/Controller/auth_controller.dart';
import 'package:chat_app_2024/Controller/image_picker_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Widgets/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController = Get.put(ProfileController());
    TextEditingController name =
        TextEditingController(text: profileController.currentuser.value.name);
    TextEditingController email =
        TextEditingController(text: profileController.currentuser.value.email);
    TextEditingController phoneNumber = TextEditingController(
        text: profileController.currentuser.value.phoneNumber);
    TextEditingController about =
        TextEditingController(text: profileController.currentuser.value.about);
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    RxString imagePath = "".obs;
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                authController.logoutUser();
              },
              icon: Icon(
                Icons.logout,
                size: 28.sp,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              // height: 300.h,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        15.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        imagePath.value =
                                            await imagePickerController
                                                .pickImage();
                                      },
                                      child: Container(
                                        height: 160.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                        ),
                                        child: imagePath.value == ""
                                            ? Icon(
                                                Icons.add,
                                                size: 30.sp,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.r),
                                                child: Image.file(
                                                  File(imagePath.value),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                      ),
                                    )
                                  : Container(
                                      height: 160.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                      child: profileController.currentuser.value
                                                      .profileImage ==
                                                  "" ||
                                              profileController.currentuser
                                                      .value.profileImage ==
                                                  null
                                          ? Icon(
                                              Icons.image,
                                              size: 30.sp,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.r),
                                              child: CachedNetworkImage(
                                                imageUrl: profileController
                                                    .currentuser
                                                    .value
                                                    .profileImage!,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ))),
                            ),
                          ],
                        ),
                        18.h.heightBox,
                        Obx(() => TextField(
                              controller: name,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                  filled: isEdit.value,
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Name"),
                            )),
                        10.h.heightBox,
                        Obx(() => TextField(
                              controller: about,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                  filled: isEdit.value,
                                  prefixIcon: Icon(Icons.info),
                                  labelText: "About"),
                            )),
                        10.h.heightBox,
                        TextField(
                          controller: email,
                          enabled: false,
                          decoration: InputDecoration(
                              filled: isEdit.value,
                              prefixIcon: Icon(Icons.alternate_email),
                              labelText: "Email"),
                        ),
                        10.h.heightBox,
                        Obx(() => TextField(
                              controller: phoneNumber,
                              enabled: isEdit.value,
                              decoration: InputDecoration(
                                  filled: isEdit.value,
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: "Phone Number"),
                            )),
                        22.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => isEdit.value
                                  ? PrimaryButton(
                                      btnName: "Save",
                                      icon: Icons.save,
                                      ontap: () async {
                                        await profileController.updateProfile(
                                            imagePath.value,
                                            name.text,
                                            about.text,
                                            phoneNumber.text);
                                        isEdit.value = false;
                                      })
                                  : PrimaryButton(
                                      btnName: "Edit",
                                      icon: Icons.edit,
                                      ontap: () {
                                        isEdit.value = true;
                                      }),
                            )
                          ],
                        ),
                        22.h.heightBox,
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
