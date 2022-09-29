import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/orderModel/OrderModel.dart';
import 'package:utardia/screen/order/order_details/order_details_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class OrderProvider extends ChangeNotifier {
  OrderModel orderModel = OrderModel();
  void onTapNext(BuildContext context, int? data) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrderDetailsScreen(ind: data)));
  }

  int selectedStep = 0;
  int nbSteps = 5;
  bool loader = false;
  void init() {
    getOrders();
  }

  void getOrders() async {
    loader = true;
    notifyListeners();
    try {
      http.Response? response = await HttpService.getApi(header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, url: "${ApiEndPoint.getOrders}${PrefService.getString(PrefKeys.uid)}");
      if (response!.statusCode == 200 && response != null) {
        orderModel = OrderModel.fromJson(jsonDecode(response.body));
        if (orderModel.data != null) {
          Logger().e(jsonDecode(response.body));
          loader = false;
          notifyListeners();
        }
      } else {
        showToast("code ${response.statusCode}");
      }
      loader = false;
      notifyListeners();
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

  int getSteps(String status) {
    if (status == "pending") {
      return 0;
    } else if (status == "on the way") {
      return 1;
    } else {
      return 2;
    }
  }
}
