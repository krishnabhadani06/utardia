// // To parse this JSON data, do
// //
// //     final homeProductDetailApi = homeProductDetailApiFromJson(jsonString);
//
// To parse this JSON data, do
//
//     final homeProductDetailApi = homeProductDetailApiFromJson(jsonString);

// HomeProductDetailApi homeProductDetailApiFromJson(String str) =>
//     HomeProductDetailApi.fromJson(json.decode(str) as Map<String, dynamic>);
//
// String homeProductDetailApiToJson(HomeProductDetailApi data) =>
//     json.encode(data.toJson());

class HomeProductDetailApi {
  HomeProductDetailApi({
    this.data,
    this.success,
    this.status,
  });

  List<HomeProductDetail>? data;
  bool? success;
  int? status;

  factory HomeProductDetailApi.fromJson(Map<String, dynamic> json) =>
      HomeProductDetailApi(
        data: json["data"] == null
            ? null
            : List<HomeProductDetail>.from(
                json["data"].map((x) => HomeProductDetail.fromJson(x))),
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success == null ? null : success,
        "status": status == null ? null : status,
      };
}

class HomeProductDetail {
  HomeProductDetail({
    this.id,
    this.name,
    this.addedBy,
    this.sellerId,
    this.shopId,
    this.shopName,
    this.shopLogo,
    this.photos,
    this.discountType,
    this.discount,
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
  String? discountType;
  int? discount;
  String? thumbnailImage;
  List<String>? tags;
  String? priceHighLow;
  List<ChoiceOption>? choiceOptions;
  List<String>? colors;
  List<Choice>? choices;
  bool? hasDiscount;
  String? strokedPrice;
  String? mainPrice;
  double? calculablePrice;
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

  factory HomeProductDetail.fromJson(Map<String, dynamic> json) =>
      HomeProductDetail(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        addedBy: json["added_by"] == null ? null : json["added_by"],
        sellerId: json["seller_id"] == null ? null : json["seller_id"],
        shopId: json["shop_id"] == null ? null : json["shop_id"],
        shopName: json["shop_name"] == null ? null : json["shop_name"],
        shopLogo: json["shop_logo"] == null ? null : json["shop_logo"],
        photos: json["photos"] == null
            ? null
            : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        discount: json["discount"] == null ? null : json["discount"],
        thumbnailImage:
            json["thumbnail_image"] == null ? null : json["thumbnail_image"],
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        priceHighLow:
            json["price_high_low"] == null ? null : json["price_high_low"],
        choiceOptions: json["choice_options"] == null
            ? null
            : List<ChoiceOption>.from(
                json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        colors: json["colors"] == null
            ? null
            : List<String>.from(json["colors"].map((x) => x)),
        choices: json["choices"] == null
            ? null
            : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        hasDiscount: json["has_discount"] == null ? null : json["has_discount"],
        strokedPrice:
            json["stroked_price"] == null ? null : json["stroked_price"],
        mainPrice: json["main_price"] == null ? null : json["main_price"],
        calculablePrice: json["calculable_price"] == null
            ? null
            : double.parse(json["calculable_price"].toString()),
        currencySymbol:
            json["currency_symbol"] == null ? null : json["currency_symbol"],
        currentStock:
            json["current_stock"] == null ? null : json["current_stock"],
        unit: json["unit"] == null ? null : json["unit"],
        rating: json["rating"] == null ? null : json["rating"],
        ratingCount: json["rating_count"] == null ? null : json["rating_count"],
        earnPoint: json["earn_point"] == null ? null : json["earn_point"],
        description: json["description"] == null ? null : json["description"],
        videoLink: json["video_link"] == null ? null : json["video_link"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        link: json["link"] == null ? null : json["link"],
        isGrocery: json["is_grocery"] == null ? null : json["is_grocery"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "added_by": addedBy == null ? null : addedBy,
        "seller_id": sellerId == null ? null : sellerId,
        "shop_id": shopId == null ? null : shopId,
        "shop_name": shopName == null ? null : shopName,
        "shop_logo": shopLogo == null ? null : shopLogo,
        "photos": photos == null
            ? null
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "discount_type": discountType == null ? null : discountType,
        "discount": discount == null ? null : discount,
        "thumbnail_image": thumbnailImage == null ? null : thumbnailImage,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "price_high_low": priceHighLow == null ? null : priceHighLow,
        "choice_options": choiceOptions == null
            ? null
            : List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
        "colors":
            colors == null ? null : List<dynamic>.from(colors!.map((x) => x)),
        "choices": choices == null
            ? null
            : List<dynamic>.from(choices!.map((x) => x.toJson())),
        "has_discount": hasDiscount == null ? null : hasDiscount,
        "stroked_price": strokedPrice == null ? null : strokedPrice,
        "main_price": mainPrice == null ? null : mainPrice,
        "calculable_price": calculablePrice == null ? null : calculablePrice,
        "currency_symbol": currencySymbol == null ? null : currencySymbol,
        "current_stock": currentStock == null ? null : currentStock,
        "unit": unit == null ? null : unit,
        "rating": rating == null ? null : rating,
        "rating_count": ratingCount == null ? null : ratingCount,
        "earn_point": earnPoint == null ? null : earnPoint,
        "description": description == null ? null : description,
        "video_link": videoLink == null ? null : videoLink,
        "brand": brand == null ? null : brand!.toJson(),
        "link": link == null ? null : link,
        "is_grocery": isGrocery == null ? null : isGrocery,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
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
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : json["title"],
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "title": title == null ? null : title,
        "options":
            options == null ? null : List<dynamic>.from(options!.map((x) => x)),
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
  dynamic sku;
  double? price;
  String? color;
  String? option;
  int? qty;
  dynamic image;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        variant: json["variant"] == null ? null : json["variant"],
        sku: json["sku"],
        price: json["price"] == null
            ? null
            : double.parse(json["price"].toString()),
        color: json["color"] == null ? null : json["color"],
        option: json["option"] == null ? null : json["option"],
        qty: json["qty"] == null ? null : json["qty"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "variant": variant == null ? null : variant,
        "sku": sku,
        "price": price == null ? null : price,
        "color": color == null ? null : color,
        "option": option == null ? null : option,
        "qty": qty == null ? null : qty,
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
        variant: json["variant"] == null ? null : json["variant"],
        path: json["path"] == null ? null : json["path"],
      );

  Map<String, dynamic> toJson() => {
        "variant": variant == null ? null : variant,
        "path": path == null ? null : path,
      };
}

// import 'dart:convert';
// import 'dart:ffi';
//
// HomeProductDetailApi homeProductDetailApiFromJson(String str) => HomeProductDetailApi.fromJson(json.decode(str));
//
// String homeProductDetailApiToJson(HomeProductDetailApi data) => json.encode(data.toJson());
//
// class HomeProductDetailApi {
//   HomeProductDetailApi({
//     this.data,
//     this.success,
//     this.status,
//   });
//
//   List<HomeProductDetail>? data;
//   bool? success;
//   int? status;
//
//   factory HomeProductDetailApi.fromJson(Map<String, dynamic> json) => HomeProductDetailApi(
//     data: json["data"] == null ? null : List<HomeProductDetail>.from(json["data"].map((x) => HomeProductDetail.fromJson(x))),
//     success: json["success"] == null ? null : json["success"],
//     status: json["status"] == null ? null : json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
//     "success": success == null ? null : success,
//     "status": status == null ? null : status,
//   };
// }
//
// class HomeProductDetail {
//   HomeProductDetail({
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
//     this.choices,
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
//   List<String>? colors;
//   List<Choice>? choices;
//   bool? hasDiscount;
//   String? strokedPrice;
//   String? mainPrice;
//   double? calculablePrice;
//   String? currencySymbol;
//   int? currentStock;
//   String? unit;
//   int? rating;
//   int? ratingCount;
//   double? earnPoint;
//   String? description;
//   String? videoLink;
//   Brand? brand;
//   String? link;
//   int? isGrocery;
//
//   factory HomeProductDetail.fromJson(Map<String, dynamic> json) => HomeProductDetail(
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"] == null ? null : json["name"],
//     addedBy: json["added_by"] == null ? null : json["added_by"],
//     sellerId: json["seller_id"] == null ? null : json["seller_id"],
//     shopId: json["shop_id"] == null ? null : json["shop_id"],
//     shopName: json["shop_name"] == null ? null : json["shop_name"],
//     shopLogo: json["shop_logo"] == null ? null : json["shop_logo"],
//     photos: json["photos"] == null ? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
//     thumbnailImage: json["thumbnail_image"] == null ? null : json["thumbnail_image"],
//     tags: json["tags"] == null ? null : List<String>.from(json["tags"].map((x) => x)),
//     priceHighLow: json["price_high_low"] == null ? null : json["price_high_low"],
//     choiceOptions: json["choice_options"] == null ? null : List<ChoiceOption>.from(json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
//     colors: json["colors"] == null ? null : List<String>.from(json["colors"].map((x) => x)),
//     choices: json["choices"] == null ? null : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
//     hasDiscount: json["has_discount"] == null ? null : json["has_discount"],
//     strokedPrice: json["stroked_price"] == null ? null : json["stroked_price"],
//     mainPrice: json["main_price"] == null ? null : json["main_price"],
//     calculablePrice: json["calculable_price"] == null ? null : json["calculable_price"].toDouble(),
//     currencySymbol: json["currency_symbol"] == null ? null : json["currency_symbol"],
//     currentStock: json["current_stock"] == null ? null : json["current_stock"],
//     unit: json["unit"] == null ? null : json["unit"],
//     rating: json["rating"] == null ? null : json["rating"],
//     ratingCount: json["rating_count"] == null ? null : json["rating_count"],
//     earnPoint: json["earn_point"] == null ? null : json["earn_point"].toDouble(),
//     description: json["description"] == null ? null : json["description"],
//     videoLink: json["video_link"] == null ? null : json["video_link"],
//     brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
//     link: json["link"] == null ? null : json["link"],
//     isGrocery: json["is_grocery"] == null ? null : json["is_grocery"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "name": name == null ? null : name,
//     "added_by": addedBy == null ? null : addedBy,
//     "seller_id": sellerId == null ? null : sellerId,
//     "shop_id": shopId == null ? null : shopId,
//     "shop_name": shopName == null ? null : shopName,
//     "shop_logo": shopLogo == null ? null : shopLogo,
//     "photos": photos == null ? null : List<dynamic>.from(photos!.map((x) => x.toJson())),
//     "thumbnail_image": thumbnailImage == null ? null : thumbnailImage,
//     "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
//     "price_high_low": priceHighLow == null ? null : priceHighLow,
//     "choice_options": choiceOptions == null ? null : List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
//     "colors": colors == null ? null : List<dynamic>.from(colors!.map((x) => x)),
//     "choices": choices == null ? null : List<dynamic>.from(choices!.map((x) => x.toJson())),
//     "has_discount": hasDiscount == null ? null : hasDiscount,
//     "stroked_price": strokedPrice == null ? null : strokedPrice,
//     "main_price": mainPrice == null ? null : mainPrice,
//     "calculable_price": calculablePrice == null ? null : calculablePrice,
//     "currency_symbol": currencySymbol == null ? null : currencySymbol,
//     "current_stock": currentStock == null ? null : currentStock,
//     "unit": unit == null ? null : unit,
//     "rating": rating == null ? null : rating,
//     "rating_count": ratingCount == null ? null : ratingCount,
//     "earn_point": earnPoint == null ? null : earnPoint,
//     "description": description == null ? null : description,
//     "video_link": videoLink == null ? null : videoLink,
//     "brand": brand == null ? null : brand!.toJson(),
//     "link": link == null ? null : link,
//     "is_grocery": isGrocery == null ? null : isGrocery,
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
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"] == null ? null : json["name"],
//     logo: json["logo"] == null ? null : json["logo"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "name": name == null ? null : name,
//     "logo": logo == null ? null : logo,
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
// class Choice {
//   Choice({
//     this.variant,
//     this.sku,
//     this.price,
//     this.color,
//     this.qty,
//     this.image,
//   });
//
//   String? variant;
//   String? sku;
//   int? price;
//   String? color;
//   int? qty;
//   String? image;
//
//   factory Choice.fromJson(Map<String, dynamic> json) => Choice(
//     variant: json["variant"],
//     sku: json["sku"],
//     price: json["price"],
//     color: json["color"],
//     qty: json["qty"],
//     image: json["image"] == null ? null : json["image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "variant": variant,
//     "sku": sku,
//     "price": price,
//     "color": color,
//     "qty": qty,
//     "image": image == null ? null : image,
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
//     variant: json["variant"] == null ? null : json["variant"],
//     path: json["path"] == null ? null : json["path"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "variant": variant == null ? null : variant,
//     "path": path == null ? null : path,
//   };
// }
