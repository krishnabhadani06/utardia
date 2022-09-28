import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/order/widget/order_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/order_top.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(Strings.order, style: TextStyle(fontSize: 22)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              const OrderTop(),
              const OrderCenter(),
            ],
          ),
        ),
      ),
    );
  }
}
