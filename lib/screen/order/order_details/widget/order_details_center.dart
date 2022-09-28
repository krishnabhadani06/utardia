import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_details/widget/order_details_cart.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class OrderDetailsCenter extends StatelessWidget {
  const OrderDetailsCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                Strings.address,
                style: robotoBoldTextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        Container(
          height: deviceHeight * 0.10,
          width: deviceWidth * 0.95,
          decoration: BoxDecoration(
            color: ColorRes.white,
            // border: Border.all(color: ColorRes.lightGrey, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: ColorRes.black.withOpacity(0.25),
                  blurRadius: 3,
                  offset: Offset.zero,
                  spreadRadius: 0.5)
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                IconRes.ichome1,
                size: 35,
                color: ColorRes.grey,
              ),
              SizedBox(
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.75,
                child: Center(
                  child: Text(
                    '221 Baker St, Marylebone, London NW1 6XE, United Kingdom',
                    style: robotoBoldTextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.cart,
                style: robotoBoldTextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    '${Strings.date}-${Strings.time}',
                    style:
                        robotoBoldTextStyle(fontSize: 14, color: ColorRes.grey),
                  ),
                  Icon(
                    IconRes.icNext,
                    size: 40,
                    color: ColorRes.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
        const OrderDetailsCart(),
      ],
    );
  }
}
