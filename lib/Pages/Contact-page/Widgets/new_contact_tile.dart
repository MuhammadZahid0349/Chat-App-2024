import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const NewContactTile(
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
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Row(
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Theme.of(context).colorScheme.primary),
                child: Icon(
                  icon,
                  size: 30.sp,
                ),
              ),
              15.w.widthBox,
              Text(
                btnName,
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          )),
    );
  }
}
