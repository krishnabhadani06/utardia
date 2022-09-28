// To parse this JSON data, do
//
//     final wishListApiModel = wishListApiModelFromJson(jsonString);

import 'dart:convert';

WishListApiModel wishListApiModelFromJson(String str) => WishListApiModel.fromJson(json.decode(str));

String wishListApiModelToJson(WishListApiModel data) => json.encode(data.toJson());

class WishListApiModel {
  WishListApiModel({
    this.message,
    this.isInWishlist,
    this.productId,
    this.wishlistId,
  });

  String? message;
  bool? isInWishlist;
  int? productId;
  int? wishlistId;

  factory WishListApiModel.fromJson(Map<String, dynamic> json) => WishListApiModel(
    message: json["message"],
    isInWishlist: json["is_in_wishlist"],
    productId: json["product_id"],
    wishlistId: json["wishlist_id"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "is_in_wishlist": isInWishlist,
    "product_id": productId,
    "wishlist_id": wishlistId,
  };
}
