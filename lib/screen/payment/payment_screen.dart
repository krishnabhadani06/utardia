import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/payment/widget/payment_address.dart';
import 'package:utardia/screen/payment/widget/payment_bottom.dart';
import 'package:utardia/screen/payment/widget/payment_campaing.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/payment_cart.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

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
              child: Icon(IconRes.icBack, size: 28),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text(
              Strings.checkOut,
              style: ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              const PaymentAddress(),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              const PaymentCart(),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              const PaymentCampaing(),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              const PaymentBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
