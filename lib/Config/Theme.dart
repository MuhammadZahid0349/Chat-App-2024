// ignore_for_file: file_names

import 'package:chat_app_2024/Config/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var lightTheme = ThemeData(
    // useMaterial3: true,
    // inputDecorationTheme: const InputDecorationTheme(
    //   fillColor: lightBgColor,
    //   filled: true,
    //   enabledBorder: InputBorder.none,
    //   prefixIconColor: lightLableColor,
    //   labelStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   hintStyle: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    // ),
    // colorScheme: const ColorScheme.light(
    //   brightness: Brightness.light,
    //   background: lightBgColor,
    //   onBackground: lightFontColor,
    //   primaryContainer: lightDivColor,
    //   onPrimaryContainer: lightFontColor,
    //   secondaryContainer: lightLableColor,
    //   primary: lightPrimaryColor,
    // ),
    // textTheme: const TextTheme(
    //   headlineLarge: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 24,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w700,
    //   ),
    //   headlineMedium: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 20,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w600,
    //   ),
    //   headlineSmall: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w600,
    //   ),
    //   bodyLarge: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 16,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   bodyMedium: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 15,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w400,
    //   ),
    //   bodySmall: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 13,
    //     color: lightFontColor,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   labelSmall: TextStyle(
    //     fontFamily: "Poppins",
    //     fontSize: 13,
    //     color: lightLableColor,
    //     fontWeight: FontWeight.w300,
    //   ),
    // )
    );

////////////////////////////////
var darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: dContainerColor,
      // backgroundColor: darkDivColor,
      // foregroundColor: darkFontColor,
      // elevation: 0,
      // iconTheme: IconThemeData(
      //   color: darkFontColor,
      // ),
      // titleTextStyle: TextStyle(
      //   fontFamily: "Poppins",
      //   fontSize: 20,
      //   color: darkFontColor,
      //   fontWeight: FontWeight.w600,
      // ),
    ),
    colorScheme: const ColorScheme.dark(
        primary: dPrimaryColor,
        onPrimary: donBgColor,
        background: dBgColor,
        onBackground: donBgColor,
        primaryContainer: dContainerColor,
        secondaryContainer: darkLableColor,
        onPrimaryContainer: donContainerColor,
        onSecondary: dSecondaryColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: dBgColor,
      filled: true,
      border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.r)),
      // enabledBorder: InputBorder.none,
      // prefixIconColor: darkLableColor,
      // labelStyle: TextStyle(
      //   fontFamily: "Poppins",
      //   fontSize: 15.sp,
      //   color: darkFontColor,
      //   fontWeight: FontWeight.w500,
      // ),
      // hintStyle: TextStyle(
      //   fontFamily: "Poppins",
      //   fontSize: 15.sp,
      //   color: darkFontColor,
      //   fontWeight: FontWeight.w500,
      // ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 32.sp,
        color: dPrimaryColor,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 30.sp,
        color: donBgColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20.sp,
        color: donBgColor,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18.sp,
        color: donBgColor,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15.sp,
        color: donBgColor,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12.sp,
        color: donBgColor,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10.sp,
        color: donContainerColor,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15.sp,
        color: donContainerColor,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12.sp,
        color: donContainerColor,
        fontWeight: FontWeight.w400,
      ),
    ));
