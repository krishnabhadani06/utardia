import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/category_model/all_category_detail_model.dart';
import 'package:utardia/model/category_model/all_category_model.dart';
import 'package:utardia/model/home_model/home_category_model.dart';
import 'package:utardia/model/home_model/home_category_product_model.dart';
import 'package:utardia/model/home_screen_slider_model/home_screen_banner_model.dart';
import 'package:utardia/model/home_screen_slider_model/home_screen_slider_model.dart';
import 'package:utardia/model/home_top_category/home_all_top_category.dart';
import 'package:utardia/model/home_top_category/home_all_top_category_product.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/category_screen.dart';
import 'package:utardia/screen/dashboard/home/category_api/all_category_api.dart';
import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_screen_Category_all_api.dart';
import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_top_category_apii/home_top_category_api.dart';
import 'package:utardia/screen/dashboard/home/home_screen_slider_api/home_banner_api.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

import 'home_screen_slider_api/home_slider_api.dart';

class HomeProvider extends ChangeNotifier {
  bool loader = false;
  bool homeBottomLoader = false;
  List<String> wishListId = [];
  final GlobalKey<ScaffoldState> drawerScaffoldLKey =
      GlobalKey<ScaffoldState>();

  /// view all
  List<AllCategory> allCategories = [];
  List<AllCategoryDetailApi> allCategoriesProducts = [];

  /// slider
  HomeBannerApi bannerModel = HomeBannerApi();
  List<HomeBanner> bannerData = [];
  List<String> bannerImage = [];

  HomeSliderApi sliderModel = HomeSliderApi();
  List<HomeSlider> sliderData = [];
  List<String> sliderImage = [];

  /// homeCenter
  HomeCategoryApi? homeCategoryModel;
  List<HomeCategory> allHomeCategories = [];
  List<HomeCategoryProductApi> allHomeCategoriesProducts = [];

  // List<HomeSubCategoryList> allSubCategories = [];

  /// home Bottom TopCategory
  List<HomeTopCategoryList> allHomeTopCategories = [];
  List<HomeTopCategoryProduct> allHomeTopProducts = [];

  Future<void> init() async {
    loader = true;

    ///view all
    // await allCategoryData();

    ///home center
    await allHomeCategoryData();
    await homeBannerData();
    await homeSliderData();
    await getWishList();

    /// home bottom
    homeAllTopCategoryData();
    loader = false;
  }

  ///home bottom
  Future<void> homeAllTopCategoryData() async {
    homeBottomLoader = true;
    loader = true;
    notifyListeners();
    HomeTopCategory homeTopCategoryModel =
        await HomeTopCategoryAPiServices.homeAllTopCategoryData();
    if (homeTopCategoryModel.status != 200) {
      homeAllTopCategoryData();
    } else {
      allHomeTopCategories.clear();
      allHomeTopCategories = homeTopCategoryModel.data!;
      getAllHomeTopCategoriesProducts();
      if (kDebugMode) {
        print(allHomeTopCategories.length);
      }
    }
  }

  Future<void> getAllHomeTopCategoriesProducts() async {
    allHomeTopProducts = List.generate(
        allHomeTopCategories.length, (index) => HomeTopCategoryProduct());
    int index = 0;
    for (var element in allHomeTopCategories) {
      await homeTopCategoryProduct(element.links!.products!, index);
      index++;
    }
    homeBottomLoader = false;
    notifyListeners();
  }

  Future<void> homeTopCategoryProduct(String url, int index) async {
    HomeTopCategoryProduct product =
        await HomeTopCategoryAPiServices.homeTopCategoryProductData(url);
    if (product.status != 200) {
      homeTopCategoryProduct(url, index);
    } else {
      //allHomeCategoriesProducts.clear();
      allHomeTopProducts[index] = product;
      //allHomeTopProducts.add(product);
      if (kDebugMode) {
        print('-----------------------------${product.data!.length}');
      }
    }
  }

  void onTapCategory(
    int index,
    BuildContext context,
    String url,
  ) async {
    Provider.of<CategoryProvider>(context, listen: false).selectedPageInd =
        Provider.of<HomeProvider>(context, listen: false)
            .allHomeCategories
            .indexWhere((element) =>
                element.name.toString() ==
                Provider.of<HomeProvider>(context, listen: false)
                    .allHomeCategories[index]
                    .name
                    .toString());
    //Provider.of<CategoryProvider>(context,listen: false).homeCategoryProduct(allHomeCategories[index].links!.products!);
    navigator.currentState!.push(MaterialPageRoute(
        builder: (context) => CategoryScreen(
              select: index,
            )));
  }

  void onTapViewCategory(BuildContext context) {
    final pro = Provider.of<CategoryProvider>(context, listen: false);
    if (pro.selectedPageInd != 0) {
      Provider.of<CategoryProvider>(context, listen: false).selectedPageInd = 0;
    }
    navigator.currentState!.push(MaterialPageRoute(
        builder: (context) => CategoryScreen(
              select: 0,
            )));
  }

  Future<bool> onLike(bool like) async {
    // like==true?like=false:like=true;
    like = !like;
    if (kDebugMode) {
      print(like);
    }
    notifyListeners();
    return like;
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

  ///homeTop view all

  Future<void> allCategoryData() async {
    loader = true;
    // notifyListeners();
    AllCategoryApi viewCategoryModel =
        await AllCategoryProductApi.allCategoryData();
    if (viewCategoryModel.status != 200) {
      allCategoryData();
    } else {
      allCategories.clear();
      allCategories = viewCategoryModel.data!;
      getAllCategoriesProducts();
      if (kDebugMode) {
        print(allCategories);
      }
      //loader = false;
      // notifyListeners();
    }
  }

  Future<void> getAllCategoriesProducts() async {
    allCategoriesProducts =
        List.generate(allCategories.length, (index) => AllCategoryDetailApi());
    int index = 0;
    for (var element in allCategories) {
      await allCategoryProduct(element.links!.products!, index);
      index++;
    }
    loader = false;
    notifyListeners();
    // allCategoriesProducts.clear();
    //   // for (var element in allCategories) {
    //   //   await allCategoryProduct(element.links!.products!);
    //   // }
  }

  Future<void> allCategoryProduct(String url, int index) async {
    loader = true;
    notifyListeners();
    AllCategoryDetailApi product =
        await AllCategoryProductApi.categoryProductView(url);
    if (product.status != 200) {
      allCategoryProduct(url, index);
    } else {
      //allCategoriesProducts.clear();
      // allCategoriesProducts.add(product);
      allCategoriesProducts[index] = product;
      if (kDebugMode) {
        print('-----------------------------${product.data!.length}');
      }
      loader = false;
      notifyListeners();
    }
  }

  ///homeCategory
  Future<void> allHomeCategoryData() async {
    loader = true;
    // notifyListeners();
    homeCategoryModel = await HomeCategoryApiService.homeAllCategoryData();
    if (homeCategoryModel!.status != 200) {
      allHomeCategoryData();
    } else {
      allHomeCategories = homeCategoryModel!.data!;
      // getAllSubCategories();
      if (kDebugMode) {
        print(allHomeCategories);
      }
      loader = false;
      //notifyListeners();
    }
  }

  Future<void> homeBannerData() async {
    loader = true;
    //notifyListeners();
    bannerModel = await HomeBannerApiServices.homeBannerData();
    if (bannerModel.status != 200) {
      homeBannerData();
    } else {
      bannerImage.clear();
      bannerData = bannerModel.data!;
      bannerData.forEach((element) {
        bannerImage.add(element.photo!);
      });
      if (kDebugMode) {
        print(bannerData);
      }
      loader = false;
      //notifyListeners();
    }
  }

  Future<void> homeSliderData() async {
    loader = true;
    //notifyListeners();
    sliderModel = await HomeSliderApiServices.homeSliderData();
    if (sliderModel.status != 200) {
      homeSliderData();
    } else {
      sliderImage.clear();
      sliderData = sliderModel.data!;
      sliderData.forEach((element) {
        sliderImage.add(element.photo!);
      });
      if (kDebugMode) {
        print(sliderData);
      }
      loader = false;
      // notifyListeners();
    }
  }
}

// Future<void> homeBannerData() async {
//   loader = true;
//   //notifyListeners();
//   bannerModel = await HomeBannerApiServices.homeBannerData();
//   if (bannerModel.status != 200) {
//     homeBannerData();
//   } else {
//     bannerData = bannerModel.data!;
//     print(bannerData);
//     loader = false;
//     //notifyListeners();
//   }
// }
