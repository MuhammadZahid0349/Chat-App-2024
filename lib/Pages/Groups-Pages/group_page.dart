import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:chat_app_2024/Pages/Home/Widgets/chat_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChartTile(
            imageUrl: AssetsPathImages.avatarPic,
            name: "name",
            lastChat: "lastChat",
            lastTime: "lastTime",
            ontap: () {})
      ],
    );
  }
}
