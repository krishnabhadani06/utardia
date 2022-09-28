import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/screen/order/order_details/order_details_screen.dart';

class OrderProvider extends ChangeNotifier {
  void onTapNext(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OrderDetailsScreen()));
  }

  int selectedStep = 0;
  int nbSteps = 5;

  void init() {
    getOrders();
  }

  void getOrders() {
    try {} catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }
}
