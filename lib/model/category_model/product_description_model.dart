// // To parse this JSON data, do
// //
// //     final productDescription = productDescriptionFromJson(jsonString);
//
// import 'dart:convert';
//
// ProductDescriptionApi productDescriptionFromJson(String str) => ProductDescriptionApi.fromJson(json.decode(str));
//
// String productDescriptionToJson(ProductDescriptionApi data) => json.encode(data.toJson());
//
// class ProductDescriptionApi {
//   ProductDescriptionApi({
//     this.data,
//     this.success,
//     this.status,
//   });
//
//   List<ProductDetailList >? data;
//   bool? success;
//   int? status;
//
//   factory ProductDescriptionApi.fromJson(Map<String, dynamic> json) => ProductDescriptionApi(
//     data: List<ProductDetailList >.from(json["data"].map((x) => ProductDetailList .fromJson(x))),
//     success: json["success"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     "success": success,
//     "status": status,
//   };
// }
//
// class ProductDetailList {
//   ProductDetailList ({
//     this.id,
//     this.name,
//     this.addedBy,
//     this.sellerId,
//     this.shopId,
//     this.shopName,
//     this.shopLogo,
//     this.photos,
//     this.thumbnailImage,
//     this.tags,
//     this.priceHighLow,
//     this.choiceOptions,
//     this.colors,
//     this.hasDiscount,
//     this.strokedPrice,
//     this.mainPrice,
//     this.calculablePrice,
//     this.currencySymbol,
//     this.currentStock,
//     this.unit,
//     this.rating,
//     this.ratingCount,
//     this.earnPoint,
//     this.description,
//     this.videoLink,
//     this.brand,
//     this.link,
//     this.isGrocery,
//   });
//
//   int? id;
//   String? name;
//   String? addedBy;
//   int? sellerId;
//   int? shopId;
//   String? shopName;
//   String? shopLogo;
//   List<Photo>? photos;
//   String? thumbnailImage;
//   List<String>? tags;
//   String? priceHighLow;
//   List<ChoiceOption>? choiceOptions;
//   List<dynamic>? colors;
//   bool? hasDiscount;
//   String? strokedPrice;
//   String? mainPrice;
//   int? calculablePrice;
//   String? currencySymbol;
//   int? currentStock;
//   String? unit;
//   int? rating;
//   int? ratingCount;
//   int? earnPoint;
//   String? description;
//   String? videoLink;
//   Brand? brand;
//   String? link;
//   int? isGrocery;
//
//   factory ProductDetailList.fromJson(Map<String, dynamic> json) => ProductDetailList(
//     id: json["id"],
//     name: json["name"],
//     addedBy: json["added_by"],
//     sellerId: json["seller_id"],
//     shopId: json["shop_id"],
//     shopName: json["shop_name"],
//     shopLogo: json["shop_logo"],
//     photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
//     thumbnailImage: json["thumbnail_image"],
//     tags: List<String>.from(json["tags"].map((x) => x)),
//     priceHighLow: json["price_high_low"],
//     choiceOptions: List<ChoiceOption>.from(json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
//     colors: List<dynamic>.from(json["colors"].map((x) => x)),
//     hasDiscount: json["has_discount"],
//     strokedPrice: json["stroked_price"],
//     mainPrice: json["main_price"],
//     calculablePrice: json["calculable_price"],
//     currencySymbol: json["currency_symbol"],
//     currentStock: json["current_stock"],
//     unit: json["unit"],
//     rating: json["rating"],
//     ratingCount: json["rating_count"],
//     earnPoint: json["earn_point"],
//     description: json["description"],
//     videoLink: json["video_link"],
//     brand: Brand.fromJson(json["brand"]),
//     link: json["link"],
//     isGrocery: json["is_grocery"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "added_by": addedBy,
//     "seller_id": sellerId,
//     "shop_id": shopId,
//     "shop_name": shopName,
//     "shop_logo": shopLogo,
//     "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
//     "thumbnail_image": thumbnailImage,
//     "tags": List<dynamic>.from(tags!.map((x) => x)),
//     "price_high_low": priceHighLow,
//     "choice_options": List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
//     "colors": List<dynamic>.from(colors!.map((x) => x)),
//     "has_discount": hasDiscount,
//     "stroked_price": strokedPrice,
//     "main_price": mainPrice,
//     "calculable_price": calculablePrice,
//     "currency_symbol": currencySymbol,
//     "current_stock": currentStock,
//     "unit": unit,
//     "rating": rating,
//     "rating_count": ratingCount,
//     "earn_point": earnPoint,
//     "description": description,
//     "video_link": videoLink,
//     "brand": brand!.toJson(),
//     "link": link,
//     "is_grocery": isGrocery,
//   };
// }
//
// class Brand {
//   Brand({
//     this.id,
//     this.name,
//     this.logo,
//   });
//
//   int? id;
//   String? name;
//   String? logo;
//
//   factory Brand.fromJson(Map<String, dynamic> json) => Brand(
//     id: json["id"],
//     name: json["name"],
//     logo: json["logo"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "logo": logo,
//   };
// }
//
// class ChoiceOption {
//   ChoiceOption({
//     this.name,
//     this.title,
//     this.options,
//   });
//
//   String? name;
//   String? title;
//   List<String>? options;
//
//   factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
//     name: json["name"],
//     title: json["title"],
//     options: List<String>.from(json["options"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "title": title,
//     "options": List<dynamic>.from(options!.map((x) => x)),
//   };
// }
//
// class Photo {
//   Photo({
//     this.variant,
//     this.path,
//   });
//
//   String? variant;
//   String? path;
//
//   factory Photo.fromJson(Map<String, dynamic> json) => Photo(
//     variant: json["variant"],
//     path: json["path"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "variant": variant,
//     "path": path,
//   };
// }
