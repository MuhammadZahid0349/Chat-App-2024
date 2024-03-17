import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? profileImage;
  String? email;
  String? id;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;
  String? role;

  UserModel({
    this.name,
    this.email,
    this.id,
    this.profileImage,
    this.phoneNumber,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
    this.role,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    profileImage = json["profileImage"];
    about = json["about"];
    createdAt = json["createdAt"];
    lastOnlineStatus = json["lastOnlineStatus"];
    status = json["status"];
    role = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phoneNumber"] = phoneNumber;
    _data["profileImage"] = profileImage;
    _data["about"] = about;
    _data["createdAt"] = createdAt;
    _data["lastOnlineStatus"] = lastOnlineStatus;
    _data["status"] = status;
    _data["role"] = role;

    return _data;
  }
}
