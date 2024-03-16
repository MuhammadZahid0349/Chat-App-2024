import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryButton extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const PrimaryButton(
      {super.key,
      required this.btnName,
      required this.icon,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 5.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.primary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            10.w.widthBox,
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
