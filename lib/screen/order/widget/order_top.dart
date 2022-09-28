import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class OrderTop extends StatelessWidget {
  const OrderTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '20/05/2020 ',
              style: natoMediumTextStyle(fontSize: 14, color: ColorRes.grey),
            ),
            Text(
              ' - ',
              style: natoMediumTextStyle(fontSize: 14, color: ColorRes.grey),
            ),
            Text(
              '16:11',
              style: natoMediumTextStyle(fontSize: 14, color: ColorRes.grey),
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundColor: ColorRes.blue,
              radius: 12.0,
              child: Icon(
                Icons.arrow_downward,
                color: ColorRes.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              Strings.rs3800,
              style: natoBoldTextStyle(fontSize: 18, color: ColorRes.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: GestureDetector(
                onTap: () => provider.onTapNext(context),
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
          '111,Dhara Arcaed Mota Varchha, surat',
          style: natoBoldTextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
