// To parse this JSON data, do
//
//     final allCategoryDetailApi = allCategoryDetailApiFromJson(jsonString);

import 'dart:convert';

AllCategoryDetailApi allCategoryDetailApiFromJson(String str) =>
    AllCategoryDetailApi.fromJson(json.decode(str));

String allCategoryDetailApiToJson(AllCategoryDetailApi data) =>
    json.encode(data.toJson());

class AllCategoryDetailApi {
  AllCategoryDetailApi({
    this.data,
    this.links,
    this.meta,
    this.success,
    this.status,
  });

  List<CategoryDetail>? data;
  AllCategoryDetailApiLinks? links;
  Meta? meta;
  bool? success;
  int? status;

  factory AllCategoryDetailApi.fromJson(Map<String, dynamic> json) =>
      AllCategoryDetailApi(
        data: List<CategoryDetail>.from(
            json["data"].map((x) => CategoryDetail.fromJson(x))),
        links: AllCategoryDetailApiLinks.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
        "success": success,
        "status": status,
      };
}

class CategoryDetail {
  CategoryDetail({
    this.id,
    this.name,
    this.thumbnailImage,
    this.hasDiscount,
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
  String? strokedPrice;
  String? mainPrice;
  int? rating;
  int? sales;
  int? isGrocery;
  List<ChoiceOption>? choiceOptions;
  DatumLinks? links;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        id: json["id"],
        name: json["name"],
        thumbnailImage: json["thumbnail_image"],
        hasDiscount: json["has_discount"],
        strokedPrice: json["stroked_price"],
        mainPrice: json["main_price"],
        rating: json["rating"],
        sales: json["sales"],
        isGrocery: json["is_grocery"],
        choiceOptions: List<ChoiceOption>.from(
            json["choice_options"].map((x) => ChoiceOption.fromJson(x))),
        links: DatumLinks.fromJson(json["links"]),
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
        "is_grocery": isGrocery,
        "choice_options":
            List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
        "links": links!.toJson(),
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

class AllCategoryDetailApiLinks {
  AllCategoryDetailApiLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory AllCategoryDetailApiLinks.fromJson(Map<String, dynamic> json) =>
      AllCategoryDetailApiLinks(
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
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
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
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
