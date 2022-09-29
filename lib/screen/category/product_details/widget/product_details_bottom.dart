import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/product_details/globalClass.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class ProductDetailsBottom extends StatefulWidget {
  const ProductDetailsBottom({Key? key}) : super(key: key);

  @override
  State<ProductDetailsBottom> createState() => _ProductDetailsBottomState();
}

class _ProductDetailsBottomState extends State<ProductDetailsBottom> {
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
    final pro = Provider.of<ProductDetailsProvider>(context);

    return Column(
      crossAxisAlignment:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: deviceHeight * 0.02),
        Card(
          elevation: 5.0,
          child: Container(
            height: deviceHeight * 0.13,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorRes.white,
              boxShadow: [
                BoxShadow(
                  color: ColorRes.textBlue.withOpacity(0.20),
                  blurRadius: 5,
                  offset: Offset.zero,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 10.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        Strings.earn,
                        style: robotoSemiBoldTextStyle(
                            fontSize: 18, color: ColorRes.clrFont),
                      ),
                      Image.asset(AssetsImagesRes.coin1),
                      RichText(
                        text: TextSpan(
                          text: Strings.coin50,
                          style: robotoSemiBoldTextStyle(
                              color: ColorRes.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: Strings.onThisOrder,
                                style: robotoSemiBoldTextStyle(
                                    color: ColorRes.clrFont, fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(AssetsImagesRes.goldCoin),
                          Image.asset(AssetsImagesRes.coin),
                        ],
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.forEveryProduct,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: natoMediumTextStyle(
                                  fontSize: 12, color: ColorRes.greyRsText),
                            ),
                            Text(
                              Strings.max50,
                              style: natoMediumTextStyle(
                                  fontSize: 12, color: ColorRes.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        pro.homeProductDetail!.choiceOptions!.isEmpty
            ? SizedBox()
            : SizedBox(
                height: deviceHeight * 0.01,
              ),
        Card(
          elevation: 5.0,
          child: pro.homeProductDetail!.choiceOptions!.isEmpty
              ? SizedBox()
              : Container(
                  height: deviceHeight * 0.12,
                  decoration: BoxDecoration(
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
                  child: Column(
                    children: [
                      Container(
                        height: 30.0,
                        // color: Colors.black,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Row(
                            children: [
                              Text(
                                Strings.selectSize,
                                style: natoMediumTextStyle(
                                    fontSize: 18, color: ColorRes.lightBlack),
                              ),
                              const Spacer(),
                              Icon(
                                IconRes.icSizeChart,
                                color: ColorRes.appBarColor,
                                size: 15,
                              ),
                              Text(
                                Strings.sizeChart,
                                style: natoRegularTextStyle(
                                    fontSize: 12, color: ColorRes.lightBlack),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: pro
                                .homeProductDetail!.choiceOptions![0].options!
                                .map((e) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () => pro.onTapSize(e),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              // color: ColorRes.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                // color: ColorRes.darkGreen
                                                color: pro.currentMaterial ==
                                                        pro
                                                            .homeProductDetail!
                                                            .choiceOptions![0]
                                                            .options!
                                                            .indexOf(e)
                                                    ? ColorRes.blue
                                                    : ColorRes.white,
                                              )),
                                          child: Container(
                                            margin: const EdgeInsets.all(4.0),
                                            height: 40,
                                            width: 40,
                                            //height: deviceHeight * 0.11,
                                            padding: const EdgeInsets.only(
                                                left: 3, right: 3),
                                            decoration: BoxDecoration(
                                              color: pro.currentMaterial ==
                                                      pro
                                                          .homeProductDetail!
                                                          .choiceOptions![0]
                                                          .options!
                                                          .indexOf(e)
                                                  ? ColorRes.appBarColor
                                                  : ColorRes.greyCircle,
                                              // border: Border.all(color: ColorRes.blue),
                                              // borderRadius: const BorderRadius.all(
                                              //     Radius.circular(6.0)),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Text(
                                              pro
                                                      .homeProductDetail!
                                                      .choiceOptions![0]
                                                      .options![
                                                  pro
                                                      .homeProductDetail!
                                                      .choiceOptions![0]
                                                      .options!
                                                      .indexOf(e)],
                                              style: TextStyle(
                                                color: pro.currentMaterial ==
                                                        pro
                                                            .homeProductDetail!
                                                            .choiceOptions![0]
                                                            .options!
                                                            .indexOf(e)
                                                    ? ColorRes.white
                                                    : ColorRes.greylight1,
                                                fontSize: 15.0,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ),
        ),
        pro.homeProductDetail!.colors!.isEmpty
            ? SizedBox()
            : SizedBox(height: deviceHeight * 0.01),
        Card(
          elevation: 5.0,
          child: pro.homeProductDetail!.colors!.isEmpty
              ? SizedBox()
              : Container(
                  height: deviceHeight * 0.12,
                  decoration: BoxDecoration(
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
                  child: Column(
                    children: [
                      Container(
                        height: 30.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Row(
                            children: [
                              Text(
                                Strings.selectColor,
                                style: natoMediumTextStyle(
                                    fontSize: 18, color: ColorRes.lightBlack),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: pro.homeProductDetail!.colors!.map((e) {
                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      pro.currentColor = pro
                                          .homeProductDetail!.colors!
                                          .indexOf(e);
                                      pro.notifyListeners();
                                      Logger().e(GlobalClass.currentqty);
                                      pro.getQty();
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 42,
                                          width: 42,
                                          decoration: BoxDecoration(
                                              //color: ColorRes.yellow,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  // color: ColorRes.darkGreen
                                                  color: pro.currentColor ==
                                                          pro.homeProductDetail!
                                                              .colors!
                                                              .indexOf(e)
                                                      ? ColorRes.blue
                                                      : ColorRes.white)),
                                          child: Container(
                                            margin: const EdgeInsets.all(3.0),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              // border: Border.all(
                                              //     color: provider.currentColor ==
                                              //             provider.homeProductDetail!
                                              //                 .colors!
                                              //                 .indexOf(e)
                                              //         ? ColorRes.black
                                              //         : ColorRes.white),
                                              shape: BoxShape.circle,
                                              color: toColor(e),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ),
        ),
        pro.homeProductDetail!.colors!.isEmpty
            ? SizedBox()
            : SizedBox(height: deviceHeight * 0.01),
        Card(
          elevation: 5.0,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 307),
            //height: deviceHeight * 0.50,
            decoration: BoxDecoration(
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Text(
                            Strings.description,
                            style: robotoMediumTextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: deviceHeight / 90),
                    HtmlWidget(
                      pro.homeProductDetail!.description.toString(),
                    ),
                    SizedBox(height: deviceHeight / 40),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Card(
          elevation: 5.0,
          child: Container(
            height: deviceHeight * 0.30,
            width: deviceWidth,
            decoration: BoxDecoration(
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
              padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 6.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.rating,
                      style: robotoBoldTextStyle(
                        fontSize: 14,
                        color: ColorRes.blackText,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                    // const Spacer(),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     primary: ColorRes.detailColor,
                    //   ),
                    //   onPressed: () {},
                    //   child: Text(
                    //     Strings.rateProduct,
                    //     style: robotoBoldTextStyle(
                    //         fontSize: 12, color: ColorRes.white),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: deviceHeight * 0.02),
                Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
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
                                            color: ColorRes.white,
                                            fontSize: 12),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: ColorRes.white,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                //const Spacer(),
                                Text(Strings.terrific,
                                    style: robotoRegularTextStyle(
                                        color: ColorRes.black, fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight * 0.01,
                            ),
                            Row(
                              children: [
                                Text(
                                  Strings.niceProduct,
                                  style: robotoRegularTextStyle(
                                      fontSize: 12, color: ColorRes.greyRsText),
                                ),
                              ],
                            ),
                            const Divider(
                              thickness: 2,
                              color: ColorRes.greyLine,
                            )
                          ],
                        );
                      }),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

toColor(String hex) {
  var hexColor = hex.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

// Padding(
// padding: EdgeInsets.only(
// top: 10, left: MediaQuery.of(context).size.width * 0.045),
// child: InkWell(
// onTap: () {
// provider.addToCartAPiData(
// id: provider.homeProductDetail!.id,
// quantity: 1,
// variant: "3kg");
// },
// child: Container(
// height: 41,
// width: 124,
// decoration: const BoxDecoration(
// color: ColorRes.blue,
// borderRadius: BorderRadius.all(Radius.circular(8.0)),
// ),
// child: Center(
// child: Text(
// Strings.addToCart,
// style: natoSemiBoldTextStyle(
// color: ColorRes.white, fontSize: 18),
// )),
// ),
// ),
// ),

// RichText(
// text: TextSpan(
// text: Strings.earn,
// style: robotoSemiBoldTextStyle(
// color: ColorRes.grey, fontSize: 18),
// children: const <TextSpan>[
// TextSpan(
// text: 'bold',
// style: TextStyle(fontWeight: FontWeight.bold)),
// TextSpan(text: ' world!'),
// ],
// ),
// )
