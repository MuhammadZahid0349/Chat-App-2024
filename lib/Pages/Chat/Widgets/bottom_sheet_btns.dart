import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetIconsBtn extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const BottomSheetIconsBtn(
      {super.key, required this.iconData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(20.r)),
        child: Icon(
          iconData,
          size: 35.sp,
        ),
      ),
    );
  }
}
