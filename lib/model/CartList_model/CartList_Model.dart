// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

List<CartListDataModel> cartListModelFromJson(String?str) => List<CartListDataModel>.from(json.decode(str!).map((x) => CartListDataModel.fromJson(x)));

String?cartListModelToJson(List<CartListDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartListDataModel {
  CartListDataModel({
    this.name,
    this.ownerId,
    this.cartItems,
  });

  String?name;
  int?ownerId;
  List<CartItem>? cartItems;

  factory CartListDataModel.fromJson(Map<String, dynamic> json) => CartListDataModel(
    name: json["name"] == null ? null : json["name"],
    ownerId: json["owner_id"] == null ? null : json["owner_id"],
    cartItems: json["cart_items"] == null ? null : List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "owner_id": ownerId == null ? null : ownerId,
    "cart_items": cartItems == null ? null : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}

class CartItem {
  CartItem({
    this.id,
    this.ownerId,
    this.userId,
    this.productId,
    this.productName,
    this.productThumbnailImage,
    this.variation,
    this.price,
    this.currencySymbol,
    this.tax,
    this.shippingCost,
    this.quantity,
    this.lowerLimit,
    this.upperLimit,
  });

  int?id;
  int?ownerId;
  int?userId;
  int?productId;
  String?productName;
  String?productThumbnailImage;
  String?variation;
  int?price;
  String?currencySymbol;
  int?tax;
  int?shippingCost;
  int?quantity;
  int?lowerLimit;
  int?upperLimit;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"] == null ? null : json["id"],
    ownerId: json["owner_id"] == null ? null : json["owner_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productThumbnailImage: json["product_thumbnail_image"] == null ? null : json["product_thumbnail_image"],
    variation: json["variation"] == null ? null : json["variation"],
    price: json["price"] == null ? null : json["price"],
    currencySymbol: json["currency_symbol"] == null ? null : json["currency_symbol"],
    tax: json["tax"] == null ? null : json["tax"],
    shippingCost: json["shipping_cost"] == null ? null : json["shipping_cost"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    lowerLimit: json["lower_limit"] == null ? null : json["lower_limit"],
    upperLimit: json["upper_limit"] == null ? null : json["upper_limit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "owner_id": ownerId == null ? null : ownerId,
    "user_id": userId == null ? null : userId,
    "product_id": productId == null ? null : productId,
    "product_name": productName == null ? null : productName,
    "product_thumbnail_image": productThumbnailImage == null ? null : productThumbnailImage,
    "variation": variation == null ? null : variation,
    "price": price == null ? null : price,
    "currency_symbol": currencySymbol == null ? null : currencySymbol,
    "tax": tax == null ? null : tax,
    "shipping_cost": shippingCost == null ? null : shippingCost,
    "quantity": quantity == null ? null : quantity,
    "lower_limit": lowerLimit == null ? null : lowerLimit,
    "upper_limit": upperLimit == null ? null : upperLimit,
  };
}
