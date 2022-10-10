import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/home_model/home_category_model.dart';
import 'package:utardia/model/home_model/home_category_product_model.dart';
import 'package:utardia/model/home_model/home_subCategory_model.dart';
import 'package:utardia/model/home_model/subCategory_Product_model.dart';

import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_screen_Category_all_api.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class CategoryProvider extends ChangeNotifier {
  var selectedPageInd = 0;
  var sale = 0;
  var i = 0;
  PageController pageCon = PageController();
  bool quntity = false;
  bool showSelect = false;
  bool loader = false;
  bool visibleicon = false;

  HomeCategoryProductApi? categoryProducts;

  /// subcategory
  HomeCenterSubCategoryModel? allHomeSubCategories;
  SubCategoryProductModel? allSubCategoriesProducts;

  List<String> wishListId = [];
  HomeCategoryApi? homeCategoryModel;
  List<HomeCategory> allHomeCategories = [];

  Future<void> getCategory() async {}

  Future<void> init(String url) async {
    await homeCategoryProduct(url);
    await getWishList();
  }

  Future<void> homeCategoryProduct(String url) async {
    loader = true;
    notifyListeners();
    HomeCategoryProductApi products =
        await HomeCategoryApiService.homeCategoryProductData(url);
    if (products.status != 200) {
      showToast("went Wrong code ${products.status}");
      // await homeCategoryProduct(url);
    } else {
      categoryProducts = products;
      await getWishList();
      // getSubCategoryData();
      print('-----------------------------${categoryProducts!.data!.length}');
      loader = false;
      notifyListeners();
    }
  }

  void onGesterTap(int index, String? url, String? url1) async {
    pageCon.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    notifyListeners();
    print('00000000${url!}');
    print(url1);
    await homeCategoryProduct(url);
    getSubCategoryData(url1.toString());
    notifyListeners();
  }

  void onTapSubCategory() {
    
  }

  void currentSelect(int num) {
    selectedPageInd = num;
    notifyListeners();
  }

  int incrementData(int count) {
    count += 1;
    notifyListeners();
    return count;
  }

  int decrementData(int count) {
    count -= 1;
    print(count);
    notifyListeners();
    return count;
  }

  void getSubCategoryData(String url) async {
    try {
      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        allHomeSubCategories =
            HomeCenterSubCategoryModel.fromJson(jsonDecode(res.body));
        if (allHomeSubCategories != null &&
            allHomeSubCategories!.success == true) {
          notifyListeners();
          Logger().e(jsonDecode(res.body));
        }
      } else {
        showToast(res!.statusCode.toString());
      }
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void getSubCategoriesProduct(String url) async {
    try {
      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        allSubCategoriesProducts =
            SubCategoryProductModel.fromJson(jsonDecode(res.body));
        if (allSubCategoriesProducts != null &&
            allSubCategoriesProducts!.success == true) {
          notifyListeners();
          Logger().e(jsonDecode(res.body));
        }
      } else {
        showToast(res!.statusCode.toString());
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  getWishList() async {
    try {
      http.Response? res = await HttpService.getApi(
        url: "${ApiEndPoint.getWishList}${PrefService.getString(PrefKeys.uid)}",
      );

      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;

        if (map['success']) {
          List<dynamic> list = map['data'] as List<dynamic>;

          wishListId = list.map((e) => e['product']['id'].toString()).toList();
          Logger().e(wishListId);
        }
      } else {
        showToast(res!.statusCode.toString());
      }
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      notifyListeners();
    }
  }
}
