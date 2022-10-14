class CartListModel {
  String? name;
  int? ownerId;
  List<CartItems>? cartItems = [];

  CartListModel({this.name, this.ownerId, this.cartItems});

  CartListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ownerId = json['owner_id'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['owner_id'] = ownerId;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? ownerId;
  int? userId;
  int? productId;
  String? productName;
  String? productThumbnailImage;
  String? variation;
  int? price;
  String? currencySymbol;
  int? tax;
  int? shippingCost;
  int? quantity;
  int? lowerLimit;
  int? upperLimit;

  CartItems(
      {this.id,
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
      this.upperLimit});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['owner_id'];
    userId = json['user_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    productThumbnailImage = json['product_thumbnail_image'];
    variation = json['variation'];
    price = json['price'];
    currencySymbol = json['currency_symbol'];
    tax = json['tax'];
    shippingCost = json['shipping_cost'];
    quantity = json['quantity'];
    lowerLimit = json['lower_limit'];
    upperLimit = json['upper_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['owner_id'] = ownerId;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_thumbnail_image'] = productThumbnailImage;
    data['variation'] = variation;
    data['price'] = price;
    data['currency_symbol'] = currencySymbol;
    data['tax'] = tax;
    data['shipping_cost'] = shippingCost;
    data['quantity'] = quantity;
    data['lower_limit'] = lowerLimit;
    data['upper_limit'] = upperLimit;
    return data;
  }
}
