// To parse this JSON data, do
//
//     final todaysProductDeal = todaysProductDealFromJson(jsonString);

import 'dart:convert';

TodaysProductDealModel todaysProductDealFromJson(String str) =>
    TodaysProductDealModel.fromJson(json.decode(str));

String todaysProductDealToJson(TodaysProductDealModel data) =>
    json.encode(data.toJson());

class TodaysProductDealModel {
  TodaysProductDealModel({
    this.data,
    this.success,
    this.status,
  });

  List<TodayProductDealList>? data;
  bool? success;
  int? status;

  factory TodaysProductDealModel.fromJson(Map<String, dynamic> json) =>
      TodaysProductDealModel(
        data: json["data"] == null
            ? null
            : List<TodayProductDealList>.from(
                json["data"].map((x) => TodayProductDealList.fromJson(x))),
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

class TodayProductDealList {
  TodayProductDealList({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
    this.discountType,
    this.discount,
    this.isFavourite,
    this.strokedPrice,
    this.mainPrice,
    this.rating,
    this.sales,
    this.isGrocery,
    this.choiceOptions,
    this.links,
  });

  int? id;
  String? name;
  String? thumbnailImage;
  bool? hasDiscount;
  String? discountType;
  int? discount;
  int? isFavourite;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  int? isGrocery;
  List<ChoiceOption>? choiceOptions;
  Links? links;

  factory TodayProductDealList.fromJson(Map<String, dynamic> json) =>
      TodayProductDealList(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        thumbnailImage:
            json["thumbnail_image"] == null ? null : json["thumbnail_image"],
        hasDiscount: json["has_discount"] == null ? null : json["has_discount"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        discount: json["discount"] == null ? null : json["discount"],
        isFavourite: json["is_favourite"] == null ? null : json["is_favourite"],
        strokedPrice:
            json["stroked_price"] == null ? null : json["stroked_price"],
        mainPrice: json["main_price"] == null ? null : json["main_price"],
        rating: json["rating"] == null ? null : json["rating"],
        sales: json["sales"] == null ? null : json["sales"],
        isGrocery: json["is_grocery"] == null ? null : json["is_grocery"],
        choiceOptions: json["choice_options"] == null
            ? null
            : List<ChoiceOption>.from(
                json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "thumbnail_image": thumbnailImage == null ? null : thumbnailImage,
        "has_discount": hasDiscount == null ? null : hasDiscount,
        "discount_type": discountType == null ? null : discountType,
        "discount": discount == null ? null : discount,
        "is_favourite": isFavourite == null ? null : isFavourite,
        "stroked_price": strokedPrice == null ? null : strokedPrice,
        "main_price": mainPrice == null ? null : mainPrice,
        "rating": rating == null ? null : rating,
        "sales": sales == null ? null : sales,
        "is_grocery": isGrocery == null ? null : isGrocery,
        "choice_options": choiceOptions == null
            ? null
            : List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
      };
}

class ChoiceOption {
  ChoiceOption({
    this.name,
    this.title,
    this.options,
  });

  String? name;
  Title? title;
  List<Title>? options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
        name: json["name"] == null ? null : json["name"],
        title: json["title"] == null ? null : titleValues.map[json["title"]],
        options: json["options"] == null
            ? null
            : List<Title>.from(json["options"].map((x) => titleValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "title": title == null ? null : titleValues.reverse[title],
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => titleValues.reverse[x])),
      };
}

enum Title { SILK, FABRIC, CORRTEN }

final titleValues = EnumValues(
    {"Corrten": Title.CORRTEN, "Fabric": Title.FABRIC, "Silk": Title.SILK});

class Links {
  Links({
    this.details,
  });

  String? details;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        details: json["details"] == null ? null : json["details"],
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : details,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
