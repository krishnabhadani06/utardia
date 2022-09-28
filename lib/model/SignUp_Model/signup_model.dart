// To parse this JSON data, do
//
//     final singUpModel = singUpModelFromJson(jsonString);

import 'dart:convert';

SingUpModel singUpModelFromJson(String str) => SingUpModel.fromJson(json.decode(str));

String singUpModelToJson(SingUpModel data) => json.encode(data.toJson());

class SingUpModel {
  SingUpModel({
    this.result,
    this.message,
    this.userId,
  });

  bool? result;
  String? message;
  int? userId;

  factory SingUpModel.fromJson(Map<String, dynamic> json) => SingUpModel(
    result: json["result"],
    message: json["message"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "user_id": userId,
  };
}
