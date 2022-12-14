import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
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
  final provider = Provider.of<FavoriteProvider>(context!);
  // final provider2 = Provider.of<ProductDetailsProvider>(context);
  return Container(
    margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 7.0, bottom: 7.0),
    width: 180,
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
                  Container(
                    // color: ColorRes.blue,
                    height: deviceHeight * 0.24,
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
                                  child: InkWell(
                                      onTap: () {
                                        provider.addWishList(id.toString(),
                                            context, productUrl.toString());
                                      },
                                      child: Icon(
                                        Icons.favorite,
                                        color: like!
                                            ? ColorRes.red
                                            : ColorRes.grey,
                                        size: 18,
                                      )),
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
            flex: 1,
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
                      const Spacer(),
                      Text(
                        Strings.tops,
                        style: robotoSemiBoldTextStyle(
                            color: ColorRes.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.004,
                  ),
                  Wrap(
                    children: [
                      //mainAxisAlignment: MainAxisAlignment.start,
                      Text(
                        "Rs${mainPrice!.toString()}",
                        // widget.mainPrice!,
                        style: robotoBoldTextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Text("Rs${strokedPrice!.toString()}",
                          //widget.strokedPrice!,
                          style: robotoBoldTextStyle(
                                  fontSize: 10,
                                  color: ColorRes.clrFont.withOpacity(0.7))
                              .copyWith(
                            decoration: TextDecoration.lineThrough,
                            overflow: TextOverflow.ellipsis,
                          )),
                      SizedBox(
                        width: deviceWidth * 0.02,
                      ),
                      Text(
                        Strings.off57,
                        style: natoMediumTextStyle(
                            color: ColorRes.darkGreen, fontSize: 12),
                      ),
                    ],
                  ),
                  // ),
                ],
              ),
              //],
            ),
          ),
        ],
      ),
    ),
  );
}
