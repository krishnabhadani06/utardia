import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/model/payment_model/pamentModel.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class PaymentCart extends StatelessWidget {
  const PaymentCart({Key? key}) : super(key: key);

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
                Strings.payment,
                style: natoBoldTextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14, top: 8),
          child: Container(
              height: deviceHeight * 0.074,
              width: deviceWidth / 1,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: ColorRes.lightGrey),
              ),
              child: provider.paymentTypeList != null
                  ? DropdownButtonHideUnderline(
                      child: DropdownButton<paymentModel>(
                        icon: Icon(IconRes.icDown),
                        iconSize: 24,
                        elevation: 16,
                        isExpanded: true,
                        onChanged: null,
                        value: provider.currentPayment,
                        items: provider.paymentTypeList!.map<DropdownMenuItem<paymentModel>>((paymentModel value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Row(
                              children: [
                                // SizedBox(
                                //   width: deviceWidth / 20,
                                // ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, top: 4.0, bottom: 4.0),
                                  height: deviceHeight * 0.5,
                                  width: deviceWidth * 0.17,
                                  // height: deviceHeight / 20,
                                  // width: deviceWidth / 6,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    border:
                                        Border.all(color: ColorRes.lightGrey),
                                  ),
                                  child: Image.network(value.image.toString(),
                                      width: deviceWidth / 2.5,
                                      height: deviceHeight / 11.5),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.paymentType.toString(),
                                      style: natoBoldTextStyle(fontSize: 16),
                                    ),
                                    // Container(
                                    //   width: deviceWidth * 0.60,
                                    //   child: Text(
                                    //     value.details.toString(),
                                    //     overflow: TextOverflow.ellipsis,
                                    //     maxLines: 1,
                                    //     style: natoBoldTextStyle(
                                    //         fontSize: 12, color: ColorRes.grey),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )),
        ),
      ],
    );
  }
}
