import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

myTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.h),
    child: TabBar(
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 5.w,
        unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
        tabs: const [
          Tab(
            text: "Chats",
          ),
          Tab(
            text: "Groups",
          ),
          Tab(
            text: "Calls",
          ),
        ]),
  );
}
