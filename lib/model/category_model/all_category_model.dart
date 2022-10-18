// // To parse this JSON data, do
// //
// //     final allCategoryApi = allCategoryApiFromJson(jsonString);
//
// import 'dart:convert';
//
// AllCategoryApi allCategoryApiFromJson(String str) =>
//     AllCategoryApi.fromJson(json.decode(str));
//
// String allCategoryApiToJson(AllCategoryApi data) => json.encode(data.toJson());
//
// class AllCategoryApi {
//   AllCategoryApi({
//     this.data,
//     this.success,
//     this.status,
//   });
//
//   List<AllCategory>? data;
//   bool? success;
//   int? status;
//
//   factory AllCategoryApi.fromJson(Map<String, dynamic> json) => AllCategoryApi(
//         data: List<AllCategory>.from(
//             json["data"].map((x) => AllCategory.fromJson(x))),
//         success: json["success"],
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "success": success,
//         "status": status,
//       };
// }
//
// class AllCategory {
//   AllCategory({
//     this.id,
//     this.name,
//     this.banner,
//     this.icon,
//     this.numberOfChildren,
//     this.links,
//   });
//
//   int? id;
//   String? name;
//   String? banner;
//   String? icon;
//   int? numberOfChildren;
//   Links? links;
//
//   factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
//         id: json["id"],
//         name: json["name"],
//         banner: json["banner"],
//         icon: json["icon"],
//         numberOfChildren: json["number_of_children"],
//         links: Links.fromJson(json["links"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "banner": banner,
//         "icon": icon,
//         "number_of_children": numberOfChildren,
//         "links": links!.toJson(),
//       };
// }
//
// class Links {
//   Links({
//     this.products,
//     this.subCategories,
//   });
//
//   String? products;
//   String? subCategories;
//
//   factory Links.fromJson(Map<String, dynamic> json) => Links(
//         products: json["products"],
//         subCategories: json["sub_categories"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "products": products,
//         "sub_categories": subCategories,
//       };
// }
