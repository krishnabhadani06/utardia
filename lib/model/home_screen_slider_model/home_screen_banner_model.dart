// To parse this JSON data, do
//
//     final homeBannerApi = homeBannerApiFromJson(jsonString);

import 'dart:convert';

HomeBannerApi homeBannerApiFromJson(String str) =>
    HomeBannerApi.fromJson(json.decode(str));

String homeBannerApiToJson(HomeBannerApi data) => json.encode(data.toJson());

class HomeBannerApi {
  HomeBannerApi({
    this.data,
    this.success,
    this.status,
  });

  List<HomeBanner>? data;
  bool? success;
  int? status;

  factory HomeBannerApi.fromJson(Map<String, dynamic> json) => HomeBannerApi(
        data: List<HomeBanner>.from(
            json["data"].map((x) => HomeBanner.fromJson(x))),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "status": status,
      };
}

class HomeBanner {
  HomeBanner({
    this.photo,
    this.url,
    this.position,
  });

  String? photo;
  String? url;
  int? position;

  factory HomeBanner.fromJson(Map<String, dynamic> json) => HomeBanner(
        photo: json["photo"],
        url: json["url"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "url": url,
        "position": position,
      };
}
