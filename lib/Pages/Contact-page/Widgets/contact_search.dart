import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                onSubmitted: (value) => {
                  print(value),
                },
                decoration: InputDecoration(
                    hintText: "Search Contact",
                    prefixIcon: Icon(Icons.search, size: 26.sp)),
              ),
            ),
          ],
        ));
  }
}
