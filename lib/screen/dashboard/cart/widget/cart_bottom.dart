import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/screen/payment/payment_screen.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import '../cart_provider.dart';

class CartBottom extends StatelessWidget {
  const CartBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 4.0,
        shadowColor: ColorRes.borderblue.withOpacity(0.4),
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: deviceHeight / 15,
          width: deviceWidth / 1,
          decoration: BoxDecoration(
            color: ColorRes.blue,
            borderRadius: BorderRadius.circular(8),
            // boxShadow: const [
            //   BoxShadow(
            //     offset: Offset(2, 2),
            //     blurRadius: 5,
            //     color: Color.fromRGBO(0, 0, 0, 0.16),
            //   )
            // ]
            // color: green
          ),
          child: Row(
            children: [
              Container(
                width: deviceWidth * 0.31,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    color: ColorRes.white),
                child: Center(
                  child: Text(
                    "${provider.cartsummary != null ? provider.cartsummary!.grandTotal ?? 0 : 0}",
                    style: natoSemiBoldTextStyle(
                        fontSize: 16, color: ColorRes.blue),
                    //    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () => provider.onTap(context),
              Expanded(
                child: GestureDetector(
                  onTap: () => provider.onTap(context),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8)),
                        // color: ColorRes.blue
                        color: ColorRes.buttonBlue),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if (!kDebugMode) {
                            if (provider.cartListDataModel.cartItems != null) {
                              Provider.of<PaymentProvider>(context,
                                      listen: false)
                                  .init(context);
                              navigator.currentState!
                                  .push(MaterialPageRoute(builder: (context) {
                                return const PaymentScreen();
                              }));
                            } else {
                              showToast("Your cart is empty");
                            }
                          } else {
                            Provider.of<PaymentProvider>(context, listen: false)
                                .init(context);
                            navigator.currentState!
                                .push(MaterialPageRoute(builder: (context) {
                              return const PaymentScreen();
                            }));
                          }
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: deviceWidth / 1.9,
                              child: Center(
                                child: Text(
                                  Strings.checkOut,
                                  style: natoMediumTextStyle(
                                      fontSize: 16, color: ColorRes.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: deviceWidth / 12,
                              child: Center(
                                child: Icon(
                                  IconRes.icNext,
                                  color: ColorRes.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
