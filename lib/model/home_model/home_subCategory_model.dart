// // To parse this JSON data, do
// //
//     final homeCenterSubCategoryModel = homeCenterSubCategoryModelFromJson(jsonString);

import 'dart:convert';

HomeCenterSubCategoryModel homeCenterSubCategoryModelFromJson(String str) =>
    HomeCenterSubCategoryModel.fromJson(json.decode(str));

String homeCenterSubCategoryModelToJson(HomeCenterSubCategoryModel data) =>
    json.encode(data.toJson());

class HomeCenterSubCategoryModel {
  HomeCenterSubCategoryModel({
    this.data,
    this.success,
    this.status,
  });

  List<HomeSubCategoryList>? data;
  bool? success;
  int? status;

  factory HomeCenterSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeCenterSubCategoryModel(
        data: List<HomeSubCategoryList>.from(
            json["data"].map((x) => HomeSubCategoryList.fromJson(x))),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "status": status,
      };
}

class HomeSubCategoryList {
  HomeSubCategoryList({
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

  factory HomeSubCategoryList.fromJson(Map<String, dynamic> json) =>
      HomeSubCategoryList(
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
