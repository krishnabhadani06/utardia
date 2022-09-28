import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/cart/cart_screen.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import '../../../../category/product_details/product_details_provider.dart';

class TopProductDetailBottom extends StatelessWidget {
  const TopProductDetailBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailsProvider>(context);
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.02),
        Row(
          children: [
            Text(provider.homeTopProductDetail!.name.toString(),
                style: robotoBoldTextStyle(color: ColorRes.grey, fontSize: 20)
                    .copyWith(overflow: TextOverflow.ellipsis)),
          ],
        ),
        Row(
          children: [
            Text(
              provider.homeTopProductDetail!.mainPrice.toString(),
              style: robotoBoldTextStyle(color: ColorRes.blue, fontSize: 24),
            ),
            const SizedBox(width: 70),
            Padding(
              padding: EdgeInsets.only(
                  top: 10, left: MediaQuery.of(context).size.width * 0.045),
              child: InkWell(
                onTap: () {
                  // provider.addToCartAPiData(id:  provider.homeProductDetail!.id,quantity:1,variant:"3kg"  );
                },
                child: Container(
                  height: 41,
                  width: 124,
                  decoration: const BoxDecoration(
                    color: ColorRes.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Center(
                      child: Text(
                    Strings.addToCart,
                    style: natoSemiBoldTextStyle(
                        color: ColorRes.white, fontSize: 18),
                  )),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 280.0, bottom: 10.0),
          child: Text(
            provider.homeTopProductDetail!.mainPrice.toString(),
            style:
                natoMediumTextStyle(color: ColorRes.greyRsText, fontSize: 10),
          ),
        ),
        Row(
          children: [
            Text(
              Strings.description,
              style: robotoMediumTextStyle(fontSize: 13),
            ),
          ],
        ),
        SizedBox(height: deviceHeight / 90),
        // HtmlWidget(
        //   provider.homeProductDetail!.description.toString(),
        // ),
        SizedBox(height: deviceHeight / 40),
        Container(
          height: deviceHeight / 15,
          width: deviceWidth / 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorRes.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                IconRes.icCart,
                size: 50,
                color: ColorRes.white,
              ),
              Text(
                '5 items',
                style: robotoBoldTextStyle(color: ColorRes.white, fontSize: 18),
              ),
              Container(
                width: deviceWidth / 170,
                height: deviceHeight / 25,
                color: ColorRes.white,
              ),
              Text(
                '\$5000',
                style: robotoBoldTextStyle(color: ColorRes.white, fontSize: 18),
              ),
              SizedBox(
                width: deviceWidth / 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const CartScreen();
                    },
                  ));
                },
                child: Text(
                  'View Cart',
                  style:
                      robotoBoldTextStyle(color: ColorRes.white, fontSize: 18),
                ),
              ),
              Icon(
                IconRes.icNext,
                size: 40,
                color: ColorRes.white,
              ),
            ],
          ),
        )
      ],
    );
  }
}
