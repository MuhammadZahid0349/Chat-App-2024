// ignore_for_file: avoid_print

import 'dart:io';

import 'package:chat_app_2024/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final store = FirebaseStorage.instance;
  final db = FirebaseFirestore.instance;

  Rx<UserModel> currentuser = UserModel().obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    try {
      if (auth.currentUser != null) {
        await db.collection("users").doc(auth.currentUser!.uid).get().then(
            (value) => {currentuser.value = UserModel.fromJson(value.data()!)});
      } else {
        // Handle the case when auth.currentUser is null
        print("User is not authenticated.");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfile(
      String? imageUrl, String? name, String? about, String? number) async {
    EasyLoading.show();
    try {
      final imageLink = await uploadFileToFirebase(imageUrl!);

      final updateduser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        name: name,
        about: about,
        profileImage:
            imageUrl == "" ? currentuser.value.profileImage : imageLink,
        phoneNumber: number,
      );

      await db.collection("users").doc(auth.currentUser!.uid).set(
            updateduser.toJson(),
          );

      await getUserDetails();
    } catch (e) {
      print(e);
    }
    EasyLoading.dismiss();
  }

  Future<String> uploadFileToFirebase(String imagePath) async {
    final path = "files/$imagePath";
    final file = File(imagePath!);
    if (imagePath != "") {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadImageUrl = await uploadTask.ref.getDownloadURL();

        print(ref);
        print(downloadImageUrl);
        return downloadImageUrl;
      } catch (e) {
        print(e);
        return "";
      }
    } else {}
    return "";
  }
}
