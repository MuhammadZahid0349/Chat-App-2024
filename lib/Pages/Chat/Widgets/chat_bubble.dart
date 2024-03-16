import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final String status;
  final String imageUrl;
  final bool isComming;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.time,
      required this.status,
      required this.isComming,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              constraints: BoxConstraints(maxWidth: Get.width / 1.3),
              decoration: BoxDecoration(
                borderRadius: isComming
                    ? BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(0.r),
                        bottomRight: Radius.circular(10.r),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(0.r),
                      ),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: imageUrl == ""
                  ? Text(
                      message,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(imageUrl)),
                        7.h.heightBox,
                        Text(
                          message,
                        )
                      ],
                    )),
          3.h.heightBox,
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        10.w.widthBox,
                        SvgPicture.asset(
                          AssetsPathImages.chatStatusSvg,
                          width: 17.w,
                        ),
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
