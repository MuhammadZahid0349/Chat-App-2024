// ignore_for_file: avoid_print

import 'package:chat_app_2024/Model/user_model.dart';
import 'package:chat_app_2024/Pages/Home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;

  ////////////// For Login
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that email");
      } else if (e.code == 'wrong-password') {
        print("Wrong Password provided by user");
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

///////////////For Sign Up
  Future<void> createUser(String email, String password, String name) async {
    isLoading.value = true;

    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email, name);
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("password is to weak");
      } else if (e.code == 'email-already-in-use') {
        print("The account is already exists for the email");
      } else {
        print(e.code);
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

////////////////logout user
  Future<void> logoutUser() async {
    EasyLoading.show();
    await auth.signOut();
    EasyLoading.dismiss();
    Get.offAll(() => const HomeScreen());
  }

  Future<void> initUser(
    String email,
    String name,
  ) async {
    var newUser =
        UserModel(email: email, name: name, id: auth.currentUser!.uid);

    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (ex) {
      print(ex);
    }
  }
}
