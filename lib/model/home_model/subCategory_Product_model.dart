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
        success: json["success"] == null ? null : json["success"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links == null ? null : links!.toJson(),
        "meta": meta == null ? null : meta!.toJson(),
        "success": success == null ? null : success,
        "status": status == null ? null : status,
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
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        thumbnailImage:
            json["thumbnail_image"] == null ? null : json["thumbnail_image"],
        hasDiscount: json["has_discount"] == null ? null : json["has_discount"],
        discountType:
            json["discount_type"] == null ? null : json["discount_type"],
        discount: json["discount"] == null ? null : json["discount"],
        isFavourite: json["is_favourite"],
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
        links:
            json["links"] == null ? null : DatumLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "thumbnail_image": thumbnailImage == null ? null : thumbnailImage,
        "has_discount": hasDiscount == null ? null : hasDiscount,
        "discount_type": discountType == null ? null : discountType,
        "discount": discount == null ? null : discount,
        "is_favourite": isFavourite,
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

class DatumLinks {
  DatumLinks({
    this.details,
  });

  String? details;

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        details: json["details"] == null ? null : json["details"],
      );

  Map<String, dynamic> toJson() => {
        "details": details == null ? null : details,
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
        first: json["first"] == null ? null : json["first"],
        last: json["last"] == null ? null : json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first == null ? null : first,
        "last": last == null ? null : last,
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
        currentPage: json["current_page"] == null ? null : json["current_page"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "links": links == null
            ? null
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
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
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
}
