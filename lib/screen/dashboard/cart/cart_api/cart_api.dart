// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/CartList_model/cartListModel.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class CartListApi {
  static Future<CartListModel> cartListApi(
      {int? id, String? variant, int? quantity}) async {
    try {
      String uid = PrefService.getString(PrefKeys.uid);
      String url = "${ApiEndPoint.cartList}$uid";

      String accesToken = PrefService.getString(PrefKeys.accessToken);

      http.Response? response =
          await HttpService.postApi(url: url, body: {}, header: {
        "X-Requested-With": "XMLHttpRequest",
        'Authorization': "Bearer $accesToken",
      });
      if (response != null && response.statusCode == 200) {
        List<dynamic> list = jsonDecode(response.body);
        if (list.isNotEmpty) {
          if (kDebugMode) {
            print("${list[list.length - 1]}");
          }
          return CartListModel.fromJson(list[list.length - 1]);
        } else {
          return CartListModel();
        }
      } else {
        if (kDebugMode) {
          print(jsonDecode(response!.body));
        }
        return CartListModel.fromJson({});
      }
    } catch (e) {
      showToast(e.toString());
      return CartListModel.fromJson({});
    }
  }

  static deleteCartApi({
    int? id,
  }) async {
    try {
      String accesToken = PrefService.getString(PrefKeys.accessToken);
      String url = "${ApiEndPoint.deleteCart}$id";
      http.Response? response = await HttpService.getApi(url: url, header: {
        "X-Requested-With": "XMLHttpRequest",
        'Authorization': "Bearer $accesToken",
      });
      if (response != null && response.statusCode == 200) {
        Map<dynamic, dynamic> data = jsonDecode(response.body);
        if (data['result'] == true) {
          return data;
          // showToast("product deleted");
        } else {
          if (kDebugMode) {
            print(data);
          }

          return data;
        }
      } else {
        return jsonDecode(response!.body);
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      return {};
    }
  }

  static minusCartApi({int? id, int? quantity}) async {
    try {
      String accessToken = PrefService.getString(PrefKeys.accessToken);
      String url = ApiEndPoint.updareCart;
      http.Response? response = await HttpService.postApi(url: url, header: {
        "X-Requested-With": "XMLHttpRequest",
        'Authorization': "Bearer $accessToken",
      }, body: {
        "cart_ids": "$id",
        "cart_quantities": "$quantity"
      });
      if (response != null && response.statusCode == 200) {
        Map<dynamic, dynamic> data = jsonDecode(response.body);
        if (data['result'] == true) {
          showToast("${data['message']}");
          return data;
        } else {
          if (kDebugMode) {
            print(data);
          }

          showToast("$data['message']");
          return data;
        }
      } else {
        showToast("Somting went wrong ${response!.statusCode}");
        return jsonDecode(response.body) as Map<dynamic, dynamic>;
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      return {};
    }
  }
}
