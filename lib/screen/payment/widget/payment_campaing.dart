import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/model/coupenModel/CartBaseCoupenModel.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class PaymentCampaing extends StatelessWidget {
  const PaymentCampaing({Key? key}) : super(key: key);

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
                Strings.campaing,
                style: natoBoldTextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14, top: 8),
          child: Container(
            height: deviceHeight / 15,
            width: deviceWidth / 1,
            padding: EdgeInsets.only(
              left: 10.0,
              top: 6.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: ColorRes.lightGrey),
            ),
            child: provider.coupenList != null
                ? DropdownButtonHideUnderline(
                    child: DropdownButton<CartBaseCoupenModel>(
                      icon: Icon(IconRes.icDown),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      // style: TextStyle(color:  Colors.deepPurple, fontSize: 20.0),

                      onChanged: (CartBaseCoupenModel? newSelectedCampaing) =>
                          provider.onDropDownCampaingSelected(
                              newSelectedCampaing!, context),
                      value: provider.currentCoupen,
                      items: provider.coupenList!
                          .map<DropdownMenuItem<CartBaseCoupenModel>>((value) {
                        return DropdownMenuItem(
                            value: value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.discount,
                                  color: ColorRes.blue,
                                ),
                                SizedBox(
                                  width: deviceWidth * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.code.toString(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(value.details!.maxDiscount.toString(),
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w700))
                                  ],
                                )
                              ],
                            ));
                      }).toList(),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ],
    );
  }
}
