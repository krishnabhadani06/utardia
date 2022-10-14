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
        result: json["result"],
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: json["expires_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
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
        id: json["id"],
        type: json["type"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        avatarOriginal: json["avatar_original"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "email": email,
        "avatar": avatar,
        "avatar_original": avatarOriginal,
        "phone": phone,
      };
}
