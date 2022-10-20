// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/orderModel/OrderModel.dart';
import 'package:utardia/screen/order/order_details/order_details_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class OrderProvider extends ChangeNotifier {
  OrderModel orderModel = OrderModel();
  double rating = 0.0;
  String? errorTxtComment;
  TextEditingController txtConComment = TextEditingController();

  void onTapNext(BuildContext context, int? data) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrderDetailsScreen(ind: data)));
  }

  void validateComment(String comment) {
    if (comment.isEmpty) {
      errorTxtComment = "Pls Write Comment";
      notifyListeners();
    }
  }

  void pushRate(String pid, String uid) {
    validateComment(txtConComment.text.toString());
    if (errorTxtComment == null) {
      pushComment(pid, uid);
    }
  }

  void pushComment(String pid, String uid) async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.pushRate, body: {
        "product_id": pid,
        "user_id": uid,
        "rating": "$rating",
        "comment": txtConComment.text.toString()
      });
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;

        txtConComment.clear();
        navigator.currentState!.pop();

        showToast(jsonDecode(res.body)['message']);
      } else {
        showToast("Error Code ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  int selectedStep = 0;
  int nbSteps = 5;
  bool loader = false;
  void init() {
    getOrders();
  }

  Future<void> getOrders() async {
    loader = true;
    notifyListeners();
    try {
      http.Response? response = await HttpService.getApi(header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, url: "${ApiEndPoint.getOrders}${PrefService.getString(PrefKeys.uid)}");

      if (response!.statusCode == 200) {
        orderModel = OrderModel.fromJson(jsonDecode(response.body));
        loader = false;
      } else {
        showToast("code ${response.statusCode}");
      }
      loader = false;
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      //notifyListeners();
    } finally {
      loader = false;
      // notifyListeners();
    }
    notifyListeners();
  }

  int getSteps(String status) {
    print(status);
    if (status == "pending") {
      return 1;
    } else if (status == "on_the_way") {
      return 2;
    } else {
      return 3;
    }
  }
}
