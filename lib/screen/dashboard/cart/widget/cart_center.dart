import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

class CartCenter extends StatelessWidget {
  int index = 0;
  CartCenter({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider1 = Provider.of<ProductDetailsProvider>(context);
    final provider = Provider.of<CartProvider>(context);
    return Container(
      margin: const EdgeInsets.only(right: 20.0),
      height: deviceHeight / 30,
      width: deviceWidth / 5,
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(color: ColorRes.blue, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Container(
              height: deviceHeight / 30,
              width: deviceWidth / 15,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: ColorRes.blue,
              ),
              child: Icon(
                provider.cartListDataModel.cartItems![index].quantity == 1
                    ? IconRes.icDelete
                    : IconRes.icDec,
                size: 15,
                color: ColorRes.white,
              ),
            ),
            onTap: () {
              if (provider.cartListDataModel.cartItems != null) {
                if (provider.cartListDataModel.cartItems![index].quantity ==
                    1) {
                  //call delete api
                  provider.deleteCart(provider
                      .cartListDataModel.cartItems![index].id
                      .toString());
                } else {
                  provider
                      .minusItem(provider.cartListDataModel.cartItems![index]);
                }
              } else {
                showToast("your cart is empty!! this is dummy piece");
              }
            },
          ),
          Text(
            provider.cartListDataModel.cartItems![index].quantity.toString(),
            style: natoBoldTextStyle(fontSize: 10, color: ColorRes.grey),
          ),
          GestureDetector(
            child: Container(
              height: deviceHeight / 30,
              width: deviceWidth / 15,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: ColorRes.blue,
              ),
              child: Icon(
                IconRes.icPlus,
                size: 15,
                color: ColorRes.white,
              ),
            ),
            onTap: () {
              if (provider.cartListDataModel.cartItems != null) {
                provider
                    .addToCart(provider.cartListDataModel.cartItems![index]);
              } else {
                showToast("Your cart is empty!!this is dummy piece");
              }
            },
          )
        ],
      ),
    );
  }
}
