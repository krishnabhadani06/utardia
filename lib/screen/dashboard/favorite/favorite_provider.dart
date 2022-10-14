import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/wishList_model/getWishList_model.dart';
import 'package:utardia/model/wishList_model/wishlistModel.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class FavoriteProvider extends ChangeNotifier {
  bool isLiked = false;
  bool quality = false;
  bool loader = false;
  List<wishlistModel> wishList = [];
  CategoryProvider? provider;
  GetWishlistModel? Wishlist2;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    notifyListeners();
    return !isLiked;
  }

  addWishList(String productId, BuildContext context, String urly) async {
    EasyLoading.show();
    loader = true;
    notifyListeners();
    if (await checkWishList(
            productId, PrefService.getString(PrefKeys.uid).toString()) !=
        true) {
      try {
        if (PrefService.getString(PrefKeys.uid) != "") {
          String url =
              "${ApiEndPoint.addWishList}?product_id=$productId&user_id=${PrefService.getString(PrefKeys.uid)}";
          http.Response? res = await HttpService.getApi(url: url);
          if (res!.statusCode == 200) {
            Map<dynamic, dynamic> map = jsonDecode(res.body);
            if (kDebugMode) {
              print("aaaaaaaaaaaaaaaaaaaa $map");
            }

            // ignore: use_build_context_synchronously
            if (urly != '') {
              Provider.of<CategoryProvider>(context, listen: false)
                  .homeCategoryProduct(urly);
            } else {
              getWishList();
            }
            Provider.of<HomeProvider>(context, listen: false).getWishList();

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
        // notifyListeners();
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      try {
        if (PrefService.getString(PrefKeys.uid) != "") {
          String url =
              "${ApiEndPoint.removeWishList}?product_id=$productId&user_id=${PrefService.getString(PrefKeys.uid)}";
          http.Response? res = await HttpService.getApi(url: url);
          if (res!.statusCode == 200) {
            Map<dynamic, dynamic> map = jsonDecode(res.body);
            if (kDebugMode) {
              print("aaaaaaaaaaaaaaaaaaaa $map");
            }

            if (urly == '') {
              getWishList();
            } else {
              Provider.of<CategoryProvider>(context, listen: false)
                  .homeCategoryProduct(urly);
            }
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
        // notifyListeners();
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  Future<bool> checkWishList(String id, String userId) async {
    isLiked = false;
    try {
      String url =
          "${ApiEndPoint.checkWishList}?product_id=$id&user_id=$userId";
      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        isLiked = map['is_in_wishlist'] as bool;
        return map["is_in_wishlist"] as bool;
      } else {
        return false;
      }
    } catch (e, x) {
      Logger().e(e.toString(), x.toString());
      // notifyListeners();
      return false;
    }
  }

  void getWishList() async {
    loader = true;
    notifyListeners();
    try {
      http.Response? res = await HttpService.getApi(
          url:
              "${ApiEndPoint.getWishList}${PrefService.getString(PrefKeys.uid)}",
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          });
      if (res != null && res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body) as Map<String, dynamic>;
        Wishlist2 = GetWishlistModel.fromJson(map);
        if (Wishlist2 != null) {
          notifyListeners();
        }

        Logger().e(map);
      } else {
        showToast("went Wrong ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      notifyListeners();
    } finally {
      loader = false;
      notifyListeners();
    }
  }

  void onTapShopping() {
    navigator.currentState!.pop();
    // navigator.currentState!.pushReplacement(
    //   MaterialPageRoute(builder: (context) => const HomeScreen()),
    // );
  }
  // addWishListFromWishListScreen(String id) async {
  //   if (await checkWishList(
  //           id.toString(), PrefService.getString(PrefKeys.uid)) !=
  //       true) {
  //     //add code
  //   } else {
  //     //remove code
  //
  //   }
  // }
}

// int onDec(int min) {
//   min--;
//   notifyListeners();
//   return min;
// }
//
// int onPlus(int max) {
//   max++;
//   notifyListeners();
//   return max;
// }
