import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileIconButton extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final Color color;

  const ProfileIconButton(
      {super.key,
      required this.btnName,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).colorScheme.background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          10.w.widthBox,
          Text(
            btnName,
            style: TextStyle(color: color, fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
