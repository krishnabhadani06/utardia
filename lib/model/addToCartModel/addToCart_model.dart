// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  AddToCartModel({
    this.result,
    this.message,
  });

  bool? result;
  String? message;

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        result: json["result"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
      };
}
