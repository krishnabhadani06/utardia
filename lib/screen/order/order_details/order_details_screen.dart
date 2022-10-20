import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/order/order_details/widget/order_details_bottom.dart';
import 'package:utardia/screen/order/order_details/widget/order_details_center.dart';
import 'package:utardia/screen/order/order_details/widget/order_details_top.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class OrderDetailsScreen extends StatelessWidget {
  int? ind;
  OrderDetailsScreen({Key? key, this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Logger().e(Provider.of<OrderProvider>(context, listen: false)
        .orderModel!
        .data![ind!]
        .deliveryStatus);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorRes.appBarColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          leading: GestureDetector(
            child: Icon(IconRes.icBack, size: 30),
            onTap: () {
              if (navigator.currentState!.canPop()) {
                navigator.currentState!.pop();
              } else {
                navigator.currentState!
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return const DashScreen();
                }));
              }
            },
          ),
          centerTitle: true,
          title: Text(Strings.orderDetails,
              style: ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              OrderDetailsTop(ind: ind),
              OrderDetailsCenter(ind: ind),
              OrderDetailsBottom(ind: ind),
            ],
          ),
        ),
      ),
    );
  }
}
