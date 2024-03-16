import 'package:chat_app_2024/Config/PagePath.dart';
import 'package:chat_app_2024/Config/Theme.dart';
import 'package:chat_app_2024/Pages/Auth/auth_page.dart';
import 'package:chat_app_2024/Pages/Home/home_screen.dart';
import 'package:chat_app_2024/Pages/Splash-Page/splash_screen.dart';
import 'package:chat_app_2024/Pages/Welcome-Page/welcome_screen.dart';
import 'package:chat_app_2024/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chat App 2024',
            theme: lightTheme,
            themeMode: ThemeMode.dark,
            getPages: pagePath,
            builder: EasyLoading.init(),
            // themeMode: ThemeMode.system,
            darkTheme: darkTheme,
            home: const SplashScreen(),
          );
        });
  }
}
