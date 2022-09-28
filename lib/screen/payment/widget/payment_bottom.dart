import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class PaymentBottom extends StatelessWidget {
  const PaymentBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.orderSummary,
                style: natoBoldTextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 14.0, left: 14, top: 8),
            child: provider.cartSummary != null
                ? Container(
                    // height: deviceHeight / 4.5,
                    width: deviceWidth / 1,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: ColorRes.lightGrey),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.subTotal,
                                  style: natoMediumTextStyle(fontSize: 16)),
                              Text(
                                '${provider.cartSummary!.subTotal!.substring(0, provider.cartSummary!.subTotal!.length - 2)}',
                                style: natoMediumTextStyle(
                                    fontSize: 16, color: ColorRes.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tax",
                                  style: natoMediumTextStyle(fontSize: 16)),
                              Text(
                                '${provider.cartSummary!.tax!.substring(0, provider.cartSummary!.tax!.length - 2)}',
                                style: natoMediumTextStyle(
                                    fontSize: 16, color: ColorRes.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping Cost",
                                  style: natoMediumTextStyle(fontSize: 16)),
                              Text(
                                '${provider.cartSummary!.shippingCost!.substring(0, provider.cartSummary!.shippingCost!.length - 2)}',
                                style: natoMediumTextStyle(
                                    fontSize: 16, color: ColorRes.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(Strings.disCount,
                                  style: natoMediumTextStyle(fontSize: 16)),
                              Text(
                                '${provider.cartSummary!.discount!.substring(0, provider.cartSummary!.discount!.length - 2)}',
                                style: natoMediumTextStyle(
                                    fontSize: 16, color: ColorRes.grey),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.save,
                                style: natoMediumTextStyle(fontSize: 16),
                              ),
                              Text(
                                '${provider.cartSummary!.discount!.substring(0, provider.cartSummary!.discount!.length - 2)}',
                                style: natoMediumTextStyle(
                                    fontSize: 16, color: ColorRes.detailColor),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: const [
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12.0, left: 14, top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Strings.total,
                                style: natoBoldTextStyle(fontSize: 16),
                              ),
                              Text(
                                '${provider.cartSummary!.grandTotal!.substring(0, provider.cartSummary!.grandTotal!.length - 2)}',
                                style: natoBoldTextStyle(
                                    fontSize: 16, color: ColorRes.detailColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
        SizedBox(
          height: deviceHeight / 15,
        ),
        Text(
          Strings.byPlaceOrder,
          style: robotoMediumTextStyle(fontSize: 14, color: ColorRes.grayText),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => provider.onTapTerms(
                  context, Strings.termsAndCondition, Strings.subBottomText),
            );
          },
          child: RichText(
            text: TextSpan(
              text: Strings.termsAndCondition,
              style: robotoMediumTextStyle(
                  fontSize: 14, color: ColorRes.appBarColor),
            ),
          ),
        ),
        SizedBox(
          height: deviceHeight / 70,
        ),
        materialButton(
            txtButton: Strings.placeOrder,
            onPressed: () => provider.onTapPlaceOrder(context)),
      ],
    );
  }
}
