// To parse this JSON data, do
//
//     final homeSliderApi = homeSliderApiFromJson(jsonString);

import 'dart:convert';

HomeSliderApi homeSliderApiFromJson(String str) => HomeSliderApi.fromJson(json.decode(str));

String homeSliderApiToJson(HomeSliderApi data) => json.encode(data.toJson());

class HomeSliderApi {
  HomeSliderApi({
    this.data,
    this.success,
    this.status,
  });

  List<HomeSlider>? data;
  bool? success;
  int? status;

  factory HomeSliderApi.fromJson(Map<String, dynamic> json) => HomeSliderApi(
    data: List<HomeSlider>.from(json["data"].map((x) => HomeSlider.fromJson(x))),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
    "status": status,
  };
}

class HomeSlider {
  HomeSlider({
    this.photo,
  });

  String? photo;

  factory HomeSlider.fromJson(Map<String, dynamic> json) => HomeSlider(
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
  };
}
