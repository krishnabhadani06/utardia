// To parse this JSON data, do
//
//     final viewAllSubCategory = viewAllSubCategoryFromJson(jsonString);

import 'dart:convert';

ViewAllSubCategory viewAllSubCategoryFromJson(String str) => ViewAllSubCategory.fromJson(json.decode(str));

String viewAllSubCategoryToJson(ViewAllSubCategory data) => json.encode(data.toJson());

class ViewAllSubCategory {
  ViewAllSubCategory({
    this.data,
    this.success,
    this.status,
  });

  List<ViewSubCategoryList>? data;
  bool? success;
  int? status;

  factory ViewAllSubCategory.fromJson(Map<String, dynamic> json) => ViewAllSubCategory(
    data: List<ViewSubCategoryList>.from(json["data"].map((x) => ViewSubCategoryList.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class ViewSubCategoryList {
  ViewSubCategoryList({
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

  factory ViewSubCategoryList.fromJson(Map<String, dynamic> json) => ViewSubCategoryList(
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
