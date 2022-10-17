// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/home_model/home_category_model.dart';
import 'package:utardia/model/home_model/home_category_product_detail_model.dart';
import 'package:utardia/model/home_model/home_category_product_model.dart';
import 'package:utardia/model/home_model/home_subCategory_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class HomeCategoryApiService {
  static Future<HomeCategoryApi> homeAllCategoryData() async {
    try {
      String url = ApiEndPoint.homeAllCenterCategory;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return homeCategoryApiFromJson(response.body);
      } else {
        return homeCategoryApiFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeCategoryApiFromJson("");
    }
  }

  static Future<HomeCategoryProductApi> homeCategoryProductData(
      String url1) async {
    try {
      String url = url1;
      http.Response? response = await HttpService.getApi(url: url);
      Logger().e(jsonDecode(response!.body));
      if (response != null && response.statusCode == 200) {
        return homeCategoryProductApiFromJson(response.body);
      } else {
        return HomeCategoryProductApi(status: 200, data: [], success: true);
        // throw Exception("");
      }
    } catch (e, x) {
      showToast(e.toString());
      return HomeCategoryProductApi(status: 200, data: [], success: true);
    }
  }

  static Future<HomeProductDetailApi> homeProductDetail(String url) async {
    try {
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        return HomeProductDetailApi.fromJson(jsonDecode(response.body));
      } else {
        return HomeProductDetailApi.fromJson({});
      }
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      showToast(e.toString());
      return HomeProductDetailApi.fromJson({});
    }
  }

  static Future<HomeCenterSubCategoryModel> homeSubCategory(String url) async {
    try {
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        return homeCenterSubCategoryModelFromJson(response.body);
      } else {
        return homeCenterSubCategoryModelFromJson("");
      }
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      showToast(e.toString());
      return homeCenterSubCategoryModelFromJson("");
    }
  }
}
