// To parse this JSON data, do
//
//     final todayProductDetail = todayProductDetailFromJson(jsonString);

import 'dart:convert';

TodayProductDetail todayProductDetailFromJson(String str) => TodayProductDetail.fromJson(json.decode(str));

String todayProductDetailToJson(TodayProductDetail data) => json.encode(data.toJson());

class TodayProductDetail {
  TodayProductDetail({
    this.data,
    this.success,
    this.status,
  });

  List<TodayProduct>? data;
  bool? success;
  int? status;

  factory TodayProductDetail.fromJson(Map<String, dynamic> json) => TodayProductDetail(
    data: List<TodayProduct>.from(json["data"].map((x) => TodayProduct.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class TodayProduct {
  TodayProduct({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.links,
    this.like
  });

  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  String? links;
  bool? like;

  factory TodayProduct.fromJson(Map<String, dynamic> json) => TodayProduct(
    id: json["id"],
    name: json["name"],
    thumbnailImage: json["thumbnail_image"],
    hasDiscount: json["has_discount"],
    strokedPrice: json["stroked_price"],
    mainPrice: json["main_price"],
    rating: json["rating"],
    sales: json["sales"],
    links: json["links"],
    like: json["like"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "thumbnail_image": thumbnailImage,
    "has_discount": hasDiscount,
    "stroked_price": strokedPrice,
    "main_price": mainPrice,
    "rating": rating,
    "sales": sales,
    "links": links,
  };
}
