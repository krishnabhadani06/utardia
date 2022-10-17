import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

// ignore: must_be_immutable
class OrderDetailsBottom extends StatelessWidget {
  int? ind;
  OrderDetailsBottom({Key? key, this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.orderSummary,
                style: robotoBoldTextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.012,
        ),
        Container(
          height: deviceHeight * 0.179,
          width: deviceWidth * 0.95,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            // border: Border.all(color: ColorRes.grey),
            boxShadow: [
              BoxShadow(
                  color: ColorRes.black.withOpacity(0.25),
                  blurRadius: 3,
                  offset: Offset.zero,
                  spreadRadius: 0.5)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 14),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.subTotal,
                        style: natoRegularTextStyle(fontSize: 16)),
                    Text(
                      (provider.orderModel.data![ind!].grandTotal! -
                              provider.orderModel.data![ind!].couponDiscount!)
                          .toString(),
                      style: natoRegularTextStyle(
                          fontSize: 16, color: ColorRes.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.disCount,
                        style: natoRegularTextStyle(fontSize: 16)),
                    Text(
                      provider.orderModel.data![ind!].couponDiscount.toString(),
                      style: natoRegularTextStyle(
                          fontSize: 16, color: ColorRes.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.subTotal,
                      style: natoRegularTextStyle(fontSize: 16),
                    ),
                    Text(
                      provider.orderModel.data![ind!].grandTotal.toString(),
                      style: natoRegularTextStyle(
                          fontSize: 16, color: ColorRes.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Divider(height: 2, thickness: 1, color: ColorRes.grey),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.total,
                      style: natoRegularTextStyle(fontSize: 16),
                    ),
                    Text(
                      provider.orderModel.data![ind!].grandTotal.toString(),
                      style: natoRegularTextStyle(
                          fontSize: 16, color: ColorRes.blue),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.015,
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 14.0, left: 17),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         Strings.paymentDetails,
        //         style: robotoBoldTextStyle(fontSize: 16),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(
        //   height: deviceHeight * 0.012,
        // ),
        // Container(
        //   height: deviceHeight * 0.07,
        //   width: deviceWidth * 0.95,
        //   decoration: BoxDecoration(
        //     color: ColorRes.white,
        //     borderRadius: const BorderRadius.all(Radius.circular(4)),
        //     // border: Border.all(color: ColorRes.grey),
        //     boxShadow: [
        //       BoxShadow(
        //           color: ColorRes.black.withOpacity(0.25),
        //           blurRadius: 3,
        //           offset: Offset.zero,
        //           spreadRadius: 0.5)
        //     ],
        //   ),
        //   child: Row(
        //     children: [
        //       SizedBox(
        //         width: deviceWidth * 0.06,
        //       ),
        //       SizedBox(
        //         height: deviceHeight * 0.05,
        //         width: deviceWidth * 0.15,
        //         child: Image.asset(AssetsImagesRes.ruPayImg,
        //             width: deviceWidth / 2.5, height: deviceHeight / 11.5),
        //       ),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //       // Column(
        //       //   crossAxisAlignment: CrossAxisAlignment.start,
        //       //   mainAxisAlignment: MainAxisAlignment.center,
        //       //   children: [
        //       //     Text(
        //       //       Strings.ruPay,
        //       //       style: robotoBoldTextStyle(fontSize: 16),
        //       //     ),
        //       //     Text(
        //       //       '1234544545485',
        //       //       style:
        //       //           robotoBoldTextStyle(fontSize: 12, color: ColorRes.grey),
        //       //     )
        //       //   ],
        //       // ),
        //     ],
        //   ),
        // ),
        SizedBox(
          height: deviceHeight / 65,
        ),
      ],
    );
  }
}
