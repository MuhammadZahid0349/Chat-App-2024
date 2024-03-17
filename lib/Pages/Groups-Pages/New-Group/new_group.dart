import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Controller/contact_controller.dart';
import 'package:chat_app_2024/Pages/Chat/Widgets/chat_bubble.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create New Group"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.arrow_forward,
            size: 30.sp,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: StreamBuilder(
            stream: contactController.getContact(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ChartTile(
                          imageUrl: snapshot.data![index].profileImage ??
                              AssetsPathImages.avatarPic,
                          name: snapshot.data![index].name!,
                          lastChat: snapshot.data![index].about ?? "",
                          lastTime: "",
                          ontap: () {});
                    });
              }
            },
          ),
        ));
  }
}
