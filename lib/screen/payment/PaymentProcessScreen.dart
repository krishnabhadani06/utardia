import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/dashboard/home/home_screen.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class PaymentProcessScreen extends StatelessWidget {
  String? id;
  String? amount;
  InAppWebViewController? con;
  PaymentProcessScreen({Key? key, this.id, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InAppWebView(
          onWebViewCreated: (controller) {
            con = controller;
          },
          onLoadStop: (controller, url) {
            Logger().e(url!.data.toString());
          },
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "${ApiEndPoint.baseUrl}razorpay/pay-with-razorpay?payment_type=cart_payment&user_id=${PrefService.getString(PrefKeys.uid)}&combined_order_id=${id}&amount=${amount}")),
          onUpdateVisitedHistory: (_, Uri? uri, __) {
            print("@@@@@@ ${uri!.path}");
            if (uri.path.contains("success")) {
              showToast("Payment successfull");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DashScreen()),
                  (Route<dynamic> route) => false);
            } else if (uri.toString().contains("fail")) {
              showToast("Payment failed");
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => DashScreen()),
                  (Route<dynamic> route) => false);
            }
          },
        ),
      ),
    );
  }
}
