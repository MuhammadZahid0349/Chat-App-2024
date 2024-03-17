import 'package:chat_app_2024/Model/chat_room_model.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  // ignore_for_file: non_constant_identifier_names
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  Future<void> getUserList() async {
    try {
      EasyLoading.show();
      userList.clear();
      await db.collection("users").get().then(
            (value) => {
              userList.value = value.docs
                  .map(
                    (e) => UserModel.fromJson(
                      e.data(),
                    ),
                  )
                  .toList(),
            },
          );
    } catch (e) {
      print(e);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> tempChatRoom = [];
    await db
        .collection("chats")
        .orderBy("timestamp", descending: true)
        .get()
        .then((value) {
      tempChatRoom = value.docs
          .map(
            (e) => ChatRoomModel.fromJson(e.data()),
          )
          .toList();
    });
    chatRoomList.value = tempChatRoom
        .where(
          (e) => e.id!.contains(
            auth.currentUser!.uid,
          ),
        )
        .toList();
  }

  Future<void> saveContact(UserModel user) async {
    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .collection("contacts")
          .doc(user.id)
          .set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserModel>> getContact() {
    return db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("contacts")
        // .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => UserModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
