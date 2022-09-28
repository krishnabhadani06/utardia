// To parse this JSON data, do
//
//     final homeTopProductDetail = homeTopProductDetailFromJson(jsonString);

import 'dart:convert';

HomeTopProductDetail homeTopProductDetailFromJson(String str) => HomeTopProductDetail.fromJson(json.decode(str));

String homeTopProductDetailToJson(HomeTopProductDetail data) => json.encode(data.toJson());

class HomeTopProductDetail {
  HomeTopProductDetail({
    this.data,
    this.success,
    this.status,
  });

  List<TopProductDetail>? data;
  bool? success;
  int? status;

  factory HomeTopProductDetail.fromJson(Map<String, dynamic> json) => HomeTopProductDetail(
    data: List<TopProductDetail>.from(json["data"].map((x) => TopProductDetail.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class TopProductDetail{
  TopProductDetail({
    this.id,
    this.name,
    this.addedBy,
    this.sellerId,
    this.shopId,
    this.shopName,
    this.shopLogo,
    this.photos,
    this.thumbnailImage,
    this.tags,
    this.priceHighLow,
    this.choiceOptions,
    this.colors,
    this.choices,
    this.hasDiscount,
    this.strokedPrice,
    this.mainPrice,
    this.calculablePrice,
    this.currencySymbol,
    this.currentStock,
    this.unit,
    this.rating,
    this.ratingCount,
    this.earnPoint,
    this.description,
    this.videoLink,
    this.brand,
    this.link,
    this.isGrocery,
  });

  int? id;
  String? name;
  String? addedBy;
  int? sellerId;
  int? shopId;
  String? shopName;
  String? shopLogo;
  List<Photo>? photos;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  List<ChoiceOption>? choiceOptions;
  List<String>? colors;
  List<Choice>? choices;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  int? calculablePrice;
  String? currencySymbol;
  int? currentStock;
  String? unit;
  int? rating;
  int? ratingCount;
  int? earnPoint;
  String? description;
  String? videoLink;
  Brand? brand;
  String? link;
  int? isGrocery;

  factory TopProductDetail.fromJson(Map<String, dynamic> json) => TopProductDetail(
    id: json["id"],
    name: json["name"],
    addedBy: json["added_by"],
    sellerId: json["seller_id"],
    shopId: json["shop_id"],
    shopName: json["shop_name"],
    shopLogo: json["shop_logo"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    thumbnailImage: json["thumbnail_image"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    priceHighLow: json["price_high_low"],
    choiceOptions: List<ChoiceOption>.from(json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
    colors: List<String>.from(json["colors"].map((x) => x)),
    choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    hasDiscount: json["has_discount"],
    strokedPrice: json["stroked_price"],
    mainPrice: json["main_price"],
    calculablePrice: json["calculable_price"],
    currencySymbol: json["currency_symbol"],
    currentStock: json["current_stock"],
    unit: json["unit"],
    rating: json["rating"],
    ratingCount: json["rating_count"],
    earnPoint: json["earn_point"],
    description: json["description"],
    videoLink: json["video_link"],
    brand: Brand.fromJson(json["brand"]),
    link: json["link"],
    isGrocery: json["is_grocery"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "added_by": addedBy,
    "seller_id": sellerId,
    "shop_id": shopId,
    "shop_name": shopName,
    "shop_logo": shopLogo,
    "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
    "thumbnail_image": thumbnailImage,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "price_high_low": priceHighLow,
    "choice_options": List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "choices": List<dynamic>.from(choices!.map((x) => x.toJson())),
    "has_discount": hasDiscount,
    "stroked_price": strokedPrice,
    "main_price": mainPrice,
    "calculable_price": calculablePrice,
    "currency_symbol": currencySymbol,
    "current_stock": currentStock,
    "unit": unit,
    "rating": rating,
    "rating_count": ratingCount,
    "earn_point": earnPoint,
    "description": description,
    "video_link": videoLink,
    "brand": brand!.toJson(),
    "link": link,
    "is_grocery": isGrocery,
  };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.logo,
  });

  int? id;
  String? name;
  String? logo;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
  };
}

class ChoiceOption {
  ChoiceOption({
    this.name,
    this.title,
    this.options,
  });

  String? name;
  String? title;
  List<String>? options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
    name: json["name"],
    title: json["title"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "title": title,
    "options": List<dynamic>.from(options!.map((x) => x)),
  };
}

class Choice {
  Choice({
    this.variant,
    this.sku,
    this.price,
    this.color,
    this.option,
    this.qty,
    this.image,
  });

  String? variant;
  String? sku;
  int? price;
  String? color;
  String? option;
  int? qty;
  dynamic image;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    variant: json["variant"],
    sku: json["sku"],
    price: json["price"],
    color: json["color"],
    option: json["option"],
    qty: json["qty"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "variant": variant,
    "sku": sku,
    "price": price,
    "color": color,
    "option": option,
    "qty": qty,
    "image": image,
  };
}

class Photo {
  Photo({
    this.variant,
    this.path,
  });

  String? variant;
  String? path;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    variant: json["variant"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "variant": variant,
    "path": path,
  };
}
