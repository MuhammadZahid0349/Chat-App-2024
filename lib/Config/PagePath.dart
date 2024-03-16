import 'package:chat_app_2024/Pages/Auth/auth_page.dart';
import 'package:chat_app_2024/Pages/Chat/chat_page.dart';
import 'package:chat_app_2024/Pages/Home/home_screen.dart';
import 'package:chat_app_2024/Pages/Users-Profile/user_profile_screen.dart';
import 'package:get/get.dart';

var pagePath = [
  GetPage(
      name: "/authPage",
      page: () => const AuthPage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/homePage",
      page: () => const HomeScreen(),
      transition: Transition.rightToLeft),
  // GetPage(
  //     name: "/chatPage",
  //     page: () =>  ChatPage(),
  //     transition: Transition.rightToLeft),
  // GetPage(
  //     name: "/profilePage",
  //     page: () => const UserProfileScreen(),
  //     transition: Transition.rightToLeft),
];
