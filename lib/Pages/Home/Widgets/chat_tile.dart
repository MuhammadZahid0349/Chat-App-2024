import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_2024/Config/ImagesPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastChat;
  final String lastTime;
  final VoidCallback ontap;
  const ChartTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.lastChat,
      required this.lastTime,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: ListTile(
        onTap: ontap,
        contentPadding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 5.w),
        leading: SizedBox(
            height: 60.h,
            width: 60.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ))),
        title: Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          lastChat,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: Text(
          lastTime,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
