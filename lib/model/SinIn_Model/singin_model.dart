// To parse this JSON data, do
//
//     final singInModel = singInModelFromJson(jsonString);

import 'dart:convert';

SingInModel singInModelFromJson(String? str) =>
    SingInModel.fromJson(json.decode(str!));

String? singInModelToJson(SingInModel data) => json.encode(data.toJson());

class SingInModel {
  SingInModel({
    this.result,
    this.message,
    this.accessToken,
    this.tokenType,
    this.expiresAt,
    this.user,
  });

  bool? result;
  String? message;
  String? accessToken;
  String? tokenType;
  dynamic expiresAt;
  User? user;

  factory SingInModel.fromJson(Map<String, dynamic> json) => SingInModel(
        result: json["result"] ?? null ? null : json["result"],
        message: json["message"] == null ? null : json["message"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        expiresAt: json["expires_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "message": message == null ? null : message,
        "access_token": accessToken == null ? null : accessToken,
        "token_type": tokenType == null ? null : tokenType,
        "expires_at": expiresAt,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.type,
    this.name,
    this.email,
    this.avatar,
    this.avatarOriginal,
    this.phone,
  });

  int? id;
  String? type;
  String? name;
  String? email;
  String? avatar;
  String? avatarOriginal;
  String? phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"],
        avatar: json["avatar"],
        avatarOriginal:
            json["avatar_original"] == null ? null : json["avatar_original"],
        phone: json["phone"] == null ? null : json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
        "email": email,
        "avatar": avatar,
        "avatar_original": avatarOriginal == null ? null : avatarOriginal,
        "phone": phone == null ? null : phone,
      };
}
