import 'package:chat_app_2024/Controller/contact_controller.dart';
import 'package:chat_app_2024/Controller/profile_controller.dart';
import 'package:chat_app_2024/Model/chat_model_f.dart';
import 'package:chat_app_2024/Model/chat_room_model.dart';
import 'package:chat_app_2024/Model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  var uuid = Uuid();
  RxString selectedImagePath = "".obs;
  ProfileController profileController = Get.put(ProfileController());
  ContactController contactController = Get.put(ContactController());

  String getRoomID(String targetUserID) {
    String currentUserID = auth.currentUser!.uid;
    if (currentUserID[0].codeUnitAt(0) > targetUserID[0].codeUnitAt(0)) {
      return currentUserID + targetUserID;
    } else {
      return targetUserID + currentUserID;
    }
  }

  UserModel getSender(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUser;
    } else {
      return targetUser;
    }
  }

  UserModel getReceiver(UserModel currentUser, UserModel targetUser) {
    String currentUserId = currentUser.id!;
    String targetUserId = targetUser.id!;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return targetUser;
    } else {
      return currentUser;
    }
  }

  Future<void> sendMessage(
    String targetUserID,
    String message,
    UserModel targetUser,
  ) async {
    // EasyLoading.show();
    isLoading.value = true;
    String chatId = uuid.v6();
    String roomId = getRoomID(targetUserID);
    DateTime timestamp = DateTime.now();
    String nowTime = DateFormat('hh:mm a').format(timestamp);

    UserModel sender =
        getSender(profileController.currentuser.value, targetUser);
    UserModel receiver =
        getReceiver(profileController.currentuser.value, targetUser);

    RxString imageUrl = "".obs;
    if (selectedImagePath.value.isNotEmpty) {
      imageUrl.value =
          await profileController.uploadFileToFirebase(selectedImagePath.value);
    }

    var newChat = ChatModel(
      message: message,
      imageUrl: imageUrl.value,
      id: chatId,
      senderId: auth.currentUser!.uid,
      receiverId: targetUserID,
      senderName: profileController.currentuser.value.name,
      timestamp: DateTime.now().toString(),
    );

    var roomDetails = ChatRoomModel(
      id: roomId,
      lastMessage: message,
      lastMessageTimestamp: nowTime,
      sender: sender,
      receiver: receiver,
      timestamp: DateTime.now().toString(),
      unReadMessNo: 0,
    );

    try {
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChat.toJson(),
          );
      selectedImagePath.value = "";
      await db.collection("chats").doc(roomId).set(roomDetails.toJson());

      await contactController
          .saveContact(targetUser); // add this for group context
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    // EasyLoading.dismiss();
  }

  Stream<List<ChatModel>> getMessages(String targetUserId) {
    String roomId = getRoomID(targetUserId);
    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ChatModel.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
