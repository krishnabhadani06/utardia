// To parse this JSON data, do
//
//     final homeTopCategory = homeTopCategoryFromJson(jsonString);

import 'dart:convert';

HomeTopCategory homeTopCategoryFromJson(String str) => HomeTopCategory.fromJson(json.decode(str));

String homeTopCategoryToJson(HomeTopCategory data) => json.encode(data.toJson());

class HomeTopCategory {
  HomeTopCategory({
    this.data,
    this.success,
    this.status,
  });

  List< HomeTopCategoryList>? data;
  bool? success;
  int? status;

  factory HomeTopCategory.fromJson(Map<String, dynamic> json) => HomeTopCategory(
    data: List<HomeTopCategoryList>.from(json["data"].map((x) => HomeTopCategoryList.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class HomeTopCategoryList {
  HomeTopCategoryList({
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

  factory HomeTopCategoryList.fromJson(Map<String, dynamic> json) => HomeTopCategoryList(
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
