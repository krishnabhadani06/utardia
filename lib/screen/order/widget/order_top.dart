// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

class OrderTop extends StatelessWidget {
  int? inde;
  OrderTop({Key? key, this.inde}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              provider.orderModel.data![inde!].productDetail![0].date
                  .toString(),
              style: natoMediumTextStyle(fontSize: 14, color: ColorRes.grey),
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Text(
              provider.orderModel.data![inde!].grandTotal.toString(),
              style: natoBoldTextStyle(fontSize: 18, color: ColorRes.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: GestureDetector(
                onTap: () => provider.onTapNext(context, inde),
                child: Icon(
                  IconRes.icArrowIos,
                  size: 25,
                  color: ColorRes.grey,
                ),
              ),
            ),
          ],
        ),
        Text(
          provider.orderModel.data![inde!].shippingAddress!.isNotEmpty
              ? provider.orderModel.data![inde!].shippingAddress![0].address!
              : "",
          style: natoBoldTextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
