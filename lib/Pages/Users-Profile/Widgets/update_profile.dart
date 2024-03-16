import 'package:chat_app_2024/Widgets/primary_btn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class UserUpdateProfileScreen extends StatelessWidget {
  const UserUpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          height: 170.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: Center(
                            child: Icon(
                              Icons.image,
                              size: 80.sp,
                            ),
                          ),
                        ),
                        10.h.heightBox,
                        Row(
                          children: [
                            Text(
                              "Personal Info",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        12.h.heightBox,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            8.h.heightBox,
                            TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: "Name",
                              ),
                            ),
                            10.h.heightBox,
                            Text(
                              "Email Id",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            8.h.heightBox,
                            TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "chat2024@gmail.com",
                              ),
                            ),
                            10.h.heightBox,
                            Text(
                              "Phone Number",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            8.h.heightBox,
                            TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "+92300-1111115",
                              ),
                            ),
                            10.h.heightBox,
                            Text(
                              "Phone Number",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            8.h.heightBox,
                            TextField(
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                hintText: "+92300-1111115",
                              ),
                            ),
                          ],
                        ),
                        25.h.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45.h,
                              child: PrimaryButton(
                                  btnName: "Save",
                                  icon: Icons.save,
                                  ontap: () {}),
                            ),
                          ],
                        ),
                        20.h.heightBox,
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
