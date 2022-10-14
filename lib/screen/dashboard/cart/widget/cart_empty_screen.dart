import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import '../../../../util/image_res.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CartProvider>(context);
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
                Provider.of<DashboardProvider>(context, listen: false)
                    .onBottomBarChange(0, context);
              }
            },
          ),
          centerTitle: true,
          title: Text(Strings.cart,
              style: robotoBoldTextStyle(fontSize: 22, color: ColorRes.white)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                Image.asset(AssetsImagesRes.cartEmpty),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Text(
                  Strings.cartTitle,
                  style: natoBoldTextStyle(fontSize: 20),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(
                  Strings.cartLooksLike,
                  style: natoMediumTextStyle(
                      fontSize: 16, color: ColorRes.grayText),
                ),
                Text(
                  Strings.cartYourChoice,
                  style: natoMediumTextStyle(
                      fontSize: 16, color: ColorRes.grayText),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                //   child: materialButton(
                //     txtButton: Strings.startShopping,
                //     onPressed: () => provider.onTapStartShopping(context),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
