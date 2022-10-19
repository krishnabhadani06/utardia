import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/splash/splash_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

Widget ProductCard({
  bool? like,
  //bool? like = false,
  BuildContext? context,
  int? index,
  String? image,
  String? name,
  String? mainPrice,
  String? strokedPrice,
  String? rate,
  int? gro,
  String? url,
  String? id,
  String? productUrl,
  required void Function() onTap,
}) {
  final splashProvider = Provider.of<SplashProvider>(context!, listen: false);
  // final provider2 = Provider.of<ProductDetailsProvider>(context);

  return Container(
    margin: const EdgeInsets.only(left: 6.0, right: 6.0, top: 7.0, bottom: 7.0),
    width: 155,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.20),
          blurRadius: 5,
          offset: Offset.zero,
          spreadRadius: 0,
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SizedBox(
                    // color: ColorRes.blue,
                    height: deviceHeight * 0.22,
                    width: deviceWidth,
                    child: CachedNetworkImage(
                        imageUrl: image!,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetsImagesRes.girl1)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Column(
                          children: [
                            Container(
                              height: 25,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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
                              child: CircleAvatar(
                                backgroundColor: ColorRes.white,
                                radius: 15,
                                child: Center(
                                  child: Consumer<SplashProvider>(
                                      builder: (context, con, child) {
                                    return InkWell(
                                        onTap: () {
                                          con.wishListOperation(
                                              id.toString(),
                                              con.wishListid
                                                      .contains(id.toString())
                                                  ? true
                                                  : false);
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: con.wishListid
                                                  .contains(id.toString())
                                              ? ColorRes.red
                                              : ColorRes.grey,
                                          size: 18,
                                        ));
                                  }),
                                ),
                              ),
                            ),
                            //SizedBox(height: deviceHeight * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: deviceHeight * 0.006),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Text(
                      name!,
                      style: robotoMediumTextStyle(
                          color: ColorRes.greyDark, fontSize: 12),
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
                              rate!,
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
                      // const Spacer(),
                      Text(
                        Strings.tops,
                        style: robotoSemiBoldTextStyle(
                            color: ColorRes.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.01,
                  ),
                  Row(
                    children: [
                      //mainAxisAlignment: MainAxisAlignment.start,
                      Text(
                        mainPrice!.toString(),
                        style: robotoMediumTextStyle(
                                fontSize: 12, color: ColorRes.blackText)
                            .copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(strokedPrice!.toString(),
                          style: robotoRegularTextStyle(
                                  fontSize: 8.0, color: ColorRes.greyPriceText)
                              //color: ColorRes.clrFont.withOpacity(0.7))
                              .copyWith(
                            decoration: TextDecoration.lineThrough,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const Spacer(),
                      Text(
                        Strings.off57,
                        style: robotoSemiBoldTextStyle(
                                color: ColorRes.darkGreen, fontSize: 8)
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
