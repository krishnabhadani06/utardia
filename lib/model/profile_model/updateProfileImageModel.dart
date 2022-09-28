// To parse this JSON data, do
//
//     final imageUpdateModel = imageUpdateModelFromJson(jsonString);

import 'dart:convert';

ImageUpdateModel imageUpdateModelFromJson(String str) => ImageUpdateModel.fromJson(json.decode(str));

String imageUpdateModelToJson(ImageUpdateModel data) => json.encode(data.toJson());

class ImageUpdateModel {
  ImageUpdateModel({
    this.data,
    this.success,
    this.status,
  });

  List<UpdateImage>? data;
  bool? success;
  int? status;

  factory ImageUpdateModel.fromJson(Map<String, dynamic> json) => ImageUpdateModel(
    data: List<UpdateImage>.from(json["data"].map((x) => UpdateImage.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class UpdateImage {
  UpdateImage({
    this.id,
    this.name,
    this.type,
    this.email,
    this.avatar,
    this.avatarOriginal,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.phone,
  });

  int? id;
  String? name;
  String? type;
  String? email;
  dynamic? avatar;
  String? avatarOriginal;
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? phone;

  factory UpdateImage.fromJson(Map<String, dynamic> json) => UpdateImage(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    avatar: json["avatar"],
    avatarOriginal: json["avatar_original"],
    address: json["address"],
    city: json["city"],
    country: json["country"],
    postalCode: json["postal_code"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "email": email,
    "avatar": avatar,
    "avatar_original": avatarOriginal,
    "address": address,
    "city": city,
    "country": country,
    "postal_code": postalCode,
    "phone": phone,
  };
}


// class updateProfileImageModel {
//   bool? result;
//   String? message;
//   String? path;
//
//   updateProfileImageModel({this.result, this.message, this.path});
//
//   updateProfileImageModel.fromJson(Map<String, dynamic> json) {
//     result = json['result'];
//     message = json['message'];
//     path = json['path'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['result'] = this.result;
//     data['message'] = this.message;
//     data['path'] = this.path;
//     return data;
//   }
// }
