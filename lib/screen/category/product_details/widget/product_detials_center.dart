import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/category/product_details/globalClass.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/category/product_details/widget/productdetailscreenwidgets.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class ProductDetailsCenter extends StatefulWidget {
  const ProductDetailsCenter({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsCenter> createState() => _ProductDetailsCenterState();
}

class _ProductDetailsCenterState extends State<ProductDetailsCenter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDetailsProvider>(context, listen: false).getQty();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailsProvider>(context);
    return Consumer<ProductDetailsProvider>(builder: (context, pro, x) {
      return Form(
        key: provider.productKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              SizedBox(height: deviceHeight * 0.02),
              SizedBox(
                width: deviceWidth,
                child: Text(
                  pro.homeProductDetail!.name.toString(),
                  style: robotoMediumTextStyle(
                      color: ColorRes.greyDark, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: deviceHeight * 0.01),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    height: 22,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: ColorRes.yellow,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${pro.homeProductDetail!.rating!.toDouble()}",
                          style: const TextStyle(
                              color: ColorRes.white, fontSize: 12),
                        ),
                        const Icon(
                          Icons.star,
                          color: ColorRes.white,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                  // HtmlWidget(
                  //   provider.homeProductDetail!.description.toString(),
                  // ),
                  //const Spacer(),
                  Text(Strings.tops,
                      style: robotoSemiBoldTextStyle(
                          color: ColorRes.grey, fontSize: 12)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " ${pro.homeProductDetail!.mainPrice.toString().substring(0, pro.homeProductDetail!.mainPrice!.length - 2)}",
                        style: robotoBoldTextStyle(
                            color: ColorRes.black, fontSize: 18),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.01,
                      ),
                      Text(pro.homeProductDetail!.mainPrice.toString(),
                          style: natoMediumTextStyle(
                                  color: ColorRes.greyRsText, fontSize: 12)
                              .copyWith(
                            decoration: TextDecoration.lineThrough,
                          )),
                      SizedBox(
                        width: deviceWidth * 0.01,
                      ),
                      // const Spacer(),
                      Text(
                        Strings.off57,
                        style: natoMediumTextStyle(
                            color: ColorRes.darkGreen, fontSize: 12),
                      ),
                    ],
                  ),
                  //const Spacer(),

                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            ///[messagesellerDialog] used to show dialog message
                            return messagesellerDialog(context, provider);
                          });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: deviceHeight * 0.04,
                      width: deviceWidth * 0.26,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.5)),
                        color: ColorRes.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.20),
                            blurRadius: 5,
                            offset: Offset.zero,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              IconRes.icmessage,
                              color: ColorRes.appBarColor,
                              size: 20,
                            ),
                            Text(
                              Strings.message,
                              style: natoSemiBoldTextStyle(
                                  color: ColorRes.appBarColor, fontSize: 8),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "current variant stocks ${GlobalClass.currentqty}",
                    style: TextStyle(
                        color: Colors.grey[400], fontWeight: FontWeight.w700),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
