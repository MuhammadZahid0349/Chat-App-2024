// ignore_for_file: deprecated_member_use

import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Config/StringData.dart';
import 'package:chat_app_2024/Controller/contact_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Pages/Contact-page/contact_page.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/chats_list.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/tab_bar.dart';
import 'package:chat_app_2024/Pages/Profile-Page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());

    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AssetsPathImages.appIconSvg,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          title: Text(
            AppString.appName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  contactController.getChatRoomList();
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () async {
                  await profileController.getUserDetails();
                  // Get.toNamed("/profilePage");

                  Get.to(() => const ProfileScreen(),
                      transition: Transition.rightToLeft);
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 22.sp,
                ))
          ],
          bottom: myTabBar(tabController, context)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(controller: tabController, children: [
          const ChatList(),
          ListView(
            children: [
              ListTile(
                title: Text("Name Zahid"),
              )
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text("Name Zahid"),
                subtitle: Text("kuch bi kabi bi "),
              )
            ],
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const ContactPage());
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
