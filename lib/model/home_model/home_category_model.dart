// To parse this JSON data, do
//
//     final homeCategoryApi = homeCategoryApiFromJson(jsonString);

import 'dart:convert';

HomeCategoryApi homeCategoryApiFromJson(String str) =>
    HomeCategoryApi.fromJson(json.decode(str));

String homeCategoryApiToJson(HomeCategoryApi data) =>
    json.encode(data.toJson());

class HomeCategoryApi {
  HomeCategoryApi({
    this.data,
    this.success,
    this.status,
  });

  List<HomeCategory>? data;
  bool? success;
  int? status;

  factory HomeCategoryApi.fromJson(Map<String, dynamic> json) =>
      HomeCategoryApi(
        data: List<HomeCategory>.from(
            json["data"].map((x) => HomeCategory.fromJson(x))),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "status": status,
      };
}

class HomeCategory {
  HomeCategory({
    this.id,
    this.name,
    this.banner,
    this.icon,
    this.numberOfChildren,
    this.links,
  });

  int? id;
  String? name;
  String? banner;
  String? icon;
  int? numberOfChildren;
  Links? links;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
        id: json["id"],
        name: json["name"],
        banner: json["banner"],
        icon: json["icon"],
        numberOfChildren: json["number_of_children"],
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "banner": banner,
        "icon": icon,
        "number_of_children": numberOfChildren,
        "links": links!.toJson(),
      };
}

class Links {
  Links({
    this.products,
    this.subCategories,
  });

  String? products;
  String? subCategories;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        products: json["products"],
        subCategories: json["sub_categories"],
      );

  Map<String, dynamic> toJson() => {
        "products": products,
        "sub_categories": subCategories,
      };
}
