import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/CartList_model/cartSummaryModel.dart';
import 'package:utardia/screen/dashboard/cart/cart_api/cart_api.dart';
import 'package:utardia/screen/payment/payment_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

import '../../../model/CartList_model/cartListModel.dart';

class CartProvider extends ChangeNotifier {
  // int counter = 2;
  late String select;

  bool loader = false;
  Future<void> init() async {
    await getCartDate();
    await getCartSummary();
  }

  CartListModel cartListDataModel = CartListModel();
  CartSummaryModel? cartSummary;

  Future<void> getCartDate() async {
    loader = true;
    notifyListeners();
    try {
      cartListDataModel = await CartListApi.cartListApi();
      if (cartListDataModel.cartItems == null) {
        loader = false;

        notifyListeners();

        // showToast("your  cart is empty!!");
      } else {
        if (kDebugMode) {
          print("Heloo::::: ${cartListDataModel.cartItems!.length}");
        }
        loader = false;
        notifyListeners();
      }
    } catch (e, x) {
      loader = false;
      notifyListeners();
      Logger().e(e.toString() + x.toString());
      showToast("hello:${e.toString()}");
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      loader = false;
      notifyListeners();
    }
  }

  String selectCartDropDown(String? newValue) {
    select = newValue.toString();
    notifyListeners();
    return select;
  }

  void onTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PaymentScreen()));
  }

  void deleteCart(String productId) async {
    loader = true;
    notifyListeners();
    try {
      Map<dynamic, dynamic> data =
          await CartListApi.deleteCartApi(id: int.parse(productId));
      if (data != null) {
        //error

        if (data['result']) {
          showToast(data['message']);
          getCartDate();
          // getCartSummary();
        } else {
          showToast("${data['message']}");
        }
      } else {
        if (kDebugMode) {
          print(data);
        }
      }
      if (kDebugMode) {
        print(cartListDataModel);
      }
    } catch (e) {
      showToast(e.toString());
      if (kDebugMode) {
        print(e.toString());
      }
    }
    loader = false;
    notifyListeners();
  }

  void onTapStartShopping(BuildContext context) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void minusItem(CartItems cartModel) async {
    try {
      Map<dynamic, dynamic> data = await CartListApi.minusCartApi(
          id: cartModel.id, quantity: cartModel.quantity! - 1);

      if (data['result'] == true) {
        showToast("${data['message']}");
        getCartDate();
        await getCartSummary();
      } else {
        showToast("${data['message']}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void addToCart(CartItems cartModel) async {
    try {
      Map<dynamic, dynamic> data = await CartListApi.minusCartApi(
          id: cartModel.id, quantity: cartModel.quantity! + 1);

      if (data['result'] == true) {
        showToast("${data['message']}");
        getCartDate();
        getCartSummary();
      } else {
        showToast("${data['message']}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void deleteAllCart() {}

  getCartSummary() async {
    try {
      http.Response? res = await HttpService.getApi(
          url:
              "${ApiEndPoint.cartSummary}${PrefService.getString(PrefKeys.uid)}",
          header: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          });
      if (res!.statusCode == 200) {
        Logger().e(jsonDecode(res.body));
        cartSummary = CartSummaryModel.fromJson(
            jsonDecode(res.body) as Map<String, dynamic>);
      } else {
        showToast("went Wrong ${res.statusCode}");
      }
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }
}
