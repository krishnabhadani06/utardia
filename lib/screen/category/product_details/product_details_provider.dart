// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/addToCartModel/addToCart_model.dart';
import 'package:utardia/model/category_model/product_description_model.dart';
import 'package:utardia/model/home_model/home_category_product_detail_model.dart';
import 'package:utardia/model/home_top_category/home_top_product_detail_model.dart';
import 'package:utardia/model/todays_product_model/todays_product_deal_model.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/product_details/addToCartApi/addToCart_Api.dart';
import 'package:utardia/screen/category/product_details/productDetailScreenApi/productDetailsScreenApi.dart';
import 'package:utardia/screen/category/product_details/product_details_screen.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/cart/cart_screen.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/home/category_api/all_category_api.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_screen_Category_all_api.dart';
import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_top_category_apii/home_top_category_api.dart';
import 'package:utardia/screen/dashboard/home/widget/home_bottom_product_detail/home_bottom_product_detail.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool isReadmore = false;
  bool pressed = false;

  bool isLiked = false;
  late String select;
  String currentProdductLink = "";
  String selectedColorInd = "";
  String isSelect = "";
  int selectedIndex = 0;
  int currentMaterial = 0;
  int currentColor = 0;
  int counter = 1;
  int currentqty = 0;

  // static int currentQty = 0;
  bool isHome = true, isWork = false, isOther = false;
  bool loader = false;

  TextEditingController productName = TextEditingController();
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> productKey = GlobalKey<FormState>();

  ProductDescriptionApi productDescriptionModel = ProductDescriptionApi();
  List<ProductDetailList> allProductDescription = [];
  TodaysProductDealModel? todayProduct;
  List<TodayProductDealList> allTodayProducts = [];

  // String selectDropDown(String? newValue) {
  //   select = newValue.toString();
  //   notifyListeners();
  //   return select;
  // }

  void onTapButtonSize(int index) {
    if (index == 0) {
      isSelect = Strings.m;
    } else if (index == 1) {
      isSelect = Strings.l;
    } else if (index == 2) {
      isSelect = Strings.xl;
    } else {
      isSelect = Strings.xxl;
    }
    notifyListeners();
  }

  void onTapSize(String e) {
    currentMaterial = homeProductDetail!.choiceOptions![0].options!.indexOf(e);
    getQty();
    notifyListeners();
  }

  void onTapColor(String e) {
    currentColor = homeProductDetail!.colors!.indexOf(e);
    getQty();
    notifyListeners();
  }
  // pro.currentColor = pro
  //     .homeProductDetail!.colors!
  //     .indexOf(e);
  // // pro.notifyListeners();
  // pro.getQty()

  // bool press = false;

  void onTapCart() {
    pressed = !pressed;
    notifyListeners();
  }

  void onTapPlus() {
    if (counter <= currentqty) {
      counter = counter + 1;
      notifyListeners();
    } else {
      showToast("Your selected variant is out of stock");
    }
    notifyListeners();
  }

  void onTapDelete() {
    if (counter == 1) {
      pressed = false;
      notifyListeners();
    } else {
      counter = counter - 1;
      notifyListeners();
    }
  }

  ///todaysProductDeal
  Future<void> allTodaysProductDealData() async {
    loader = true;
    notifyListeners();

    todayProduct = await TodayProductDealServices.allTodaysProduct();
    if (todayProduct!.status != 200) {
      allTodaysProductDealData();
    } else {
      allTodayProducts = todayProduct!.data!;
      if (kDebugMode) {
        print(allTodayProducts);
      }
      loader = false;
      notifyListeners();
    }
  }

  /// view all
  void onTapProduct(int index, String url) {
    selectedIndex = index;
    notifyListeners();
    allProductDescription.clear();
    productDescriptionDetail(url);
    if (kDebugMode) {
      print('00000000------------ $url');
    }
    notifyListeners();
  }

  Future<void> productDescriptionDetail(String url) async {
    loader = true;
    notifyListeners();
    productDescriptionModel = await AllCategoryProductApi.productDetail(url);
    if (productDescriptionModel.status != 200) {
      productDescriptionDetail(url);
    } else {
      navigator.currentState!
          .push(MaterialPageRoute(builder: (context) => ProductDetailScreen()));
      allProductDescription = productDescriptionModel.data!;
      if (kDebugMode) {
        print('-----------------------------${allProductDescription.length}');
      }
      loader = false;
      notifyListeners();
    }
  }

  ///homeProductDetail Center
  HomeProductDetailApi homeProductDetailModel = HomeProductDetailApi();
  HomeProductDetail? homeProductDetail;

  Future<void> homeProductDetails(String url) async {
    loader = true;
    notifyListeners();
    HomeProductDetailApi homeProductDetailModel =
        await HomeCategoryApiService.homeProductDetail(url);
    if (homeProductDetailModel.status != 200) {
      homeProductDetails(url);
    } else {
      homeProductDetail = homeProductDetailModel.data!.first;
      if (kDebugMode) {
        print(
            '-----------------------------${homeProductDetailModel.data!.length}');
      }
      loader = false;
      notifyListeners();
    }
  }

  ///product detail onTap
  Future<void> onTapProductDetails(
      int index, String url, BuildContext context, String pid) async {
    //selectedIndex = index;
    notifyListeners();
    homeProductDetail = null;
    await homeProductDetails(url);
    currentProdductLink = url;
    // await allTodaysProductDealData();

    checkWishList(pid, PrefService.getString(PrefKeys.uid));
    navigator.currentState!
        .push(MaterialPageRoute(builder: (context) => ProductDetailScreen()))
        .whenComplete(() {
      Provider.of<CategoryProvider>(context, listen: false).init(
          Provider.of<HomeProvider>(context, listen: false)
              .allHomeCategories[
                  Provider.of<CategoryProvider>(context, listen: false)
                      .selectedPageInd]
              .links!
              .products
              .toString());
    });
    if (kDebugMode) {
      print('00000000------------ $url');
    }
    notifyListeners();
    // navigator.currentState!.pushReplacement(
    //     MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  ///home bottom
  HomeTopProductDetail homeTopProductDetailModel = HomeTopProductDetail();
  TopProductDetail? homeTopProductDetail;

  Future<void> topProductDetails(String url) async {
    loader = true;
    notifyListeners();

    HomeTopProductDetail homeTopProductDetailModel =
        await HomeTopCategoryAPiServices.homeTopProductDetailData(url);
    if (homeTopProductDetailModel.status != 200) {
      await topProductDetails(url);
    } else {
      homeTopProductDetail = homeTopProductDetailModel.data!.first;
      if (kDebugMode) {
        print(
            '-----------------------------${homeTopProductDetailModel.data!.length}');
      }
      loader = false;
      notifyListeners();
    }
  }

  Future<void> onTapTopProductDetails(int index, String url) async {
    selectedIndex = index;
    notifyListeners();
    homeTopProductDetail = null;
    await topProductDetails(url);
    navigator.currentState!.push(MaterialPageRoute(
        builder: (context) => const TopProductDetailScreen()));
    if (kDebugMode) {
      print('00000000------------ $url');
    }
    notifyListeners();
  }

  /// add to cart
  AddToCartModel addToCartModel = AddToCartModel();

  Future<void> addToCartAPiData(
      {HomeProductDetail? productDetail, BuildContext? context}) async {
    loader = true;
    try {
      String? variant;
      if (homeProductDetail!.choices != null) {
        for (var element in homeProductDetail!.choices!) {
          if (element.color.toString() ==
                  homeProductDetail!.colors![currentColor].toString() &&
              element.option.toString() ==
                  homeProductDetail!.choiceOptions![0].options![currentMaterial]
                      .toString()) {
            variant = element.variant.toString();
            // Logger().e(element.qty);
            continue;
          }
        }

        if (variant != null) {
          addToCartModel = await AddToCartApi.addToCartApi(
              productId: productDetail!.id.toString(),
              quantity: counter.toString(),
              userid: PrefService.getString(PrefKeys.uid),
              barrerToken: PrefService.getString(PrefKeys.accessToken),
              variant: variant);
          if (addToCartModel.result == true) {
            Provider.of<CartProvider>(context!, listen: false).getCartSummary();

            navigator.currentState!
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          }
          showToast(addToCartModel.message.toString());
        } else {
          showToast("Variant is not founded");
          loader = false;
        }

        loader = false;
      } else {
        showToast("Variant list is empty of the product");
        loader = false;
      }
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      if (kDebugMode) {
        print(e.toString() + x.toString());
      }
      loader = false;
    }
  }

  void getQty() {
    // Logger().e(homeProductDetail!.choiceOptions![0].options![currentMaterial]
    //     .toString());

    if (homeProductDetail!.choiceOptions!.isNotEmpty &&
        homeProductDetail!.colors!.isNotEmpty) {
      for (var element in homeProductDetail!.choices!) {
        // Logger().e(element.qty!.toInt());
        if (element.color.toString() ==
                homeProductDetail!.colors![currentColor].toString() &&
            element.option.toString() ==
                homeProductDetail!.choiceOptions![0].options![currentMaterial]
                    .toString()) {
          // Logger().e(element.qty);
          currentqty = element.qty!;
          Logger().e("$currentqty:::-> ${element.qty!}");
          notifyListeners();
        }
      }
    } else {}
    // Logger().d(GlobalClass.currentqty);
  }

  void onTapClose() {
    if (isLiked) {
      isLiked = false;
    }
    navigator.currentState!.pop();
  }

  void checkWishList(String pid, String uid) async {
    isLiked = false;
    try {
      String url = "${ApiEndPoint.checkWishList}?product_id=$pid&user_id=$uid";
      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        isLiked = map['is_in_wishlist'] as bool;
      } else {
        isLiked = false;
      }
      notifyListeners();
    } catch (e, x) {
      Logger().e(e.toString(), x.toString());
      // notifyListeners();
      isLiked = false;
      notifyListeners();
    }
  }

  void addToWishList(BuildContext context) async {
    EasyLoading.show();
    loader = true;
    notifyListeners();

    if (isLiked == false) {
      try {
        if (PrefService.getString(PrefKeys.uid) != "") {
          String url =
              "${ApiEndPoint.addWishList}?product_id=${homeProductDetail!.id}&user_id=${PrefService.getString(PrefKeys.uid)}";
          http.Response? res = await HttpService.getApi(url: url);
          if (res!.statusCode == 200) {
            Map<dynamic, dynamic> map = jsonDecode(res.body);
            if (kDebugMode) {
              print("aaaaaaaaaaaaaaaaaaaa $map");
            }

            // ignore: use_build_context_synchronously
            checkWishList(homeProductDetail!.id.toString(),
                PrefService.getString(PrefKeys.uid));
            Provider.of<HomeProvider>(context, listen: false).getWishList();
            allTodaysProductDealData();

            Logger().e(jsonDecode(res.body));
            showToast(map['message']);
          } else {
            loader = false;
            // notifyListeners();
            showToast("response is null!!");
          }
          notifyListeners();
        } else {
          loader = false;
          // notifyListeners();
          showToast("pls login");
        }
      } catch (e, x) {
        kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
        showToast(e.toString());
        loader = false;
        notifyListeners();
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      try {
        if (PrefService.getString(PrefKeys.uid) != "") {
          String url =
              "${ApiEndPoint.removeWishList}?product_id=${homeProductDetail!.id}&user_id=${PrefService.getString(PrefKeys.uid)}";
          http.Response? res = await HttpService.getApi(url: url);
          if (res!.statusCode == 200) {
            Map<dynamic, dynamic> map = jsonDecode(res.body);
            if (kDebugMode) {
              print("aaaaaaaaaaaaaaaaaaaa $map");
            }

            checkWishList(homeProductDetail!.id.toString(),
                PrefService.getString(PrefKeys.uid));

            // ignore: use_build_context_synchronously
            Provider.of<HomeProvider>(context, listen: false).getWishList();

            showToast(map['message']);
            Logger().e(jsonDecode(res.body));
          } else {
            loader = false;
            // notifyListeners();
            showToast("response is null!!");
          }
        } else {
          loader = false;
          // notifyListeners();
          showToast("pls login");
        }
      } catch (e, x) {
        kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
        showToast(e.toString());
        loader = false;
        notifyListeners();
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  void onTapTodaysDealLikeButton(BuildContext context, int index) async {
    if (await Provider.of<FavoriteProvider>(context, listen: false)
            .checkWishList(allTodayProducts[index].id.toString(),
                PrefService.getString(PrefKeys.uid)) ==
        false) {
      addTodayProductWishList(context, allTodayProducts[index].id.toString());
    } else {
      removeTodayProductWishList(
          context, allTodayProducts[index].id.toString());
    }
    Provider.of<CategoryProvider>(context, listen: false).getWishList();
  }

  void removeTodayProductWishList(BuildContext context, String id) async {
    loader = true;
    notifyListeners();
    EasyLoading.show();
    try {
      if (PrefService.getString(PrefKeys.uid) != "") {
        String url =
            "${ApiEndPoint.removeWishList}?product_id=$id&user_id=${PrefService.getString(PrefKeys.uid)}";
        http.Response? res = await HttpService.getApi(url: url);
        if (res!.statusCode == 200) {
          Map<dynamic, dynamic> map = jsonDecode(res.body);
          if (kDebugMode) {
            print("aaaaaaaaaaaaaaaaaaaa $map");
          }

          checkWishList(homeProductDetail!.id.toString(),
              PrefService.getString(PrefKeys.uid));

          // ignore: use_build_context_synchronously
          Provider.of<HomeProvider>(context, listen: false).getWishList();
          // Provider.of<CategoryProvider>(context, listen: false).getWishList();
          allTodaysProductDealData();

          showToast(map['message']);
          Logger().e(jsonDecode(res.body));
        } else {
          loader = false;
          notifyListeners();
          showToast("response is null!!");
        }
      } else {
        showToast("pls login");
      }
      loader = false;
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      notifyListeners();
    } finally {
      EasyLoading.dismiss();
    }
  }

  void addTodayProductWishList(BuildContext context, String id) async {
    loader = true;
    notifyListeners();
    EasyLoading.show();
    try {
      if (PrefService.getString(PrefKeys.uid) != "") {
        String url =
            "${ApiEndPoint.addWishList}?product_id=$id&user_id=${PrefService.getString(PrefKeys.uid)}";
        http.Response? res = await HttpService.getApi(url: url);
        if (res!.statusCode == 200) {
          Map<dynamic, dynamic> map = jsonDecode(res.body);
          if (kDebugMode) {
            print("aaaaaaaaaaaaaaaaaaaa $map");
          }

          checkWishList(homeProductDetail!.id.toString(),
              PrefService.getString(PrefKeys.uid));
          // ignore: use_build_context_synchronously
          // Provider.of<CategoryProvider>(context, listen: false).getWishList();
          // ignore: use_build_context_synchronously
          Provider.of<HomeProvider>(context, listen: false).getWishList();

          allTodaysProductDealData();

          showToast(map['message']);
          Logger().e(jsonDecode(res.body));
        } else {
          showToast("response is null!!");
        }
      } else {
        loader = false;
        notifyListeners();
        showToast("pls login");
      }
      loader = false;
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      notifyListeners();
    } finally {
      EasyLoading.dismiss();
    }
  }

  void onTapSubmitQuery(
      String productId, String uid, String des, String pName) async {
    checkConversation(productId, uid, des, pName);
  }

  void checkConversation(
      String pid, String uid, String des, String pName) async {
    try {
      http.Response? res = await HttpService.getApi(header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, url: "${ApiEndPoint.checkConversation}?product_id=$pid&user_id=$uid");
      if (res!.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        Logger().e(jsonDecode(res.body));
        if (data['is_conversation'] == false || data['conversation_id'] != 0) {
          insertMessage(
              pid, uid, des, pName, data['conversation_id'].toString());
        } else {
          createConversation(pid, uid, des, pName);
        }
      } else {
        showToast("Error Code ${res.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void createConversation(
      String pid, String uid, String des, String pName) async {
    try {
      http.Response? res = await HttpService.postApi(
          url: ApiEndPoint.createConversation,
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          },
          body: {
            "product_id": pid,
            "user_id": uid,
            "title": " Query of $pName Product ",
            "message": des
          });

      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;

        if (data['result']) {
          insertMessage(
              pid, uid, des, pName, data['conversation_id'].toString());
        } else {
          kDebugMode ? Logger().e(data['message']) : "";
        }
      } else {
        showToast("Error Code from create conversation${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void insertMessage(String pid, String uid, String des, String pName,
      String conversation_id) async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.pushMessage, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, body: {
        "conversation_id": conversation_id,
        "user_id": uid,
        "message": des
      });
      Logger().e(jsonDecode(res!.body));
      if (res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        if (data['success']) {
          navigator.currentState!.pop();
          showToast("Query Posted");
        } else {
          showToast("Error ");
        }
      } else {
        showToast("error code from insertMessage Code:${res.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }
}
