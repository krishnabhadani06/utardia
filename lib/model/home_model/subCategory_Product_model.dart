// To parse this JSON data, do
//
//     final subCategoryProductModel = subCategoryProductModelFromJson(jsonString);

import 'dart:convert';

SubCategoryProductModel subCategoryProductModelFromJson(String str) =>
    SubCategoryProductModel.fromJson(json.decode(str));

String subCategoryProductModelToJson(SubCategoryProductModel data) =>
    json.encode(data.toJson());

class SubCategoryProductModel {
  SubCategoryProductModel({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  List<SubCategoryProductList>? data;
  SubCategoryProductModelLinks? links;
  Meta? meta;
  bool? success;
  int? status;

  factory SubCategoryProductModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryProductModel(
        data: json["data"] == null
            ? null
            : List<SubCategoryProductList>.from(
                json["data"].map((x) => SubCategoryProductList.fromJson(x))),
        links: json["links"] == null
            ? null
            : SubCategoryProductModelLinks.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
        "meta": meta == null ? null : meta!.toJson(),
        "success": success,
        "status": status,
      };
}

class SubCategoryProductList {
  SubCategoryProductList({
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
  dynamic isFavourite;
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  int? isGrocery;
  List<ChoiceOption>? choiceOptions;
  DatumLinks? links;

  factory SubCategoryProductList.fromJson(Map<String, dynamic> json) =>
      SubCategoryProductList(
        id: json["id"],
        name: json["name"],
        thumbnailImage: json["thumbnail_image"],
        hasDiscount: json["has_discount"],
        discountType: json["discount_type"],
        discount: json["discount"],
        isFavourite: json["is_favourite"],
        strokedPrice: json["stroked_price"],
        mainPrice: json["main_price"],
        rating: json["rating"],
        sales: json["sales"],
        isGrocery: json["is_grocery"],
        choiceOptions: json["choice_options"] == null
            ? null
            : List<ChoiceOption>.from(
                json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        links:
            json["links"] == null ? null : DatumLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "thumbnail_image": thumbnailImage,
        "has_discount": hasDiscount,
        "discount_type": discountType,
        "discount": discount,
        "is_favourite": isFavourite,
        "stroked_price": strokedPrice,
        "main_price": mainPrice,
        "rating": rating,
        "sales": sales,
        "is_grocery": isGrocery,
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
  String? title;
  List<String>? options;

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
        name: json["name"],
        title: json["title"],
        options: json["options"] == null
            ? null
            : List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options":
            options == null ? null : List<dynamic>.from(options!.map((x) => x)),
      };
}

class DatumLinks {
  DatumLinks({
    this.details,
  });

  String? details;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "details": details,
      };
}

class SubCategoryProductModelLinks {
  SubCategoryProductModelLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  factory SubCategoryProductModelLinks.fromJson(Map<String, dynamic> json) =>
      SubCategoryProductModelLinks(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
