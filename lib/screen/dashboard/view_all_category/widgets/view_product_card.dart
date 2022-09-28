import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

Widget viewCategoryProductCard({
  bool? like = false,
  BuildContext? context,
  int? index,
  String? image,
  String? name,
  String? mainPrice,
  String? strokedPrice,
  int? gro,
  String? url,
  String? url1,
}) {
  final provider = Provider.of<CategoryProvider>(context!);
  final provider2 = Provider.of<ProductDetailsProvider>(context);
  //return provider.loader? const Center(child: CircularProgressIndicator(),): Container(
  return Container(
    margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 7.0, bottom: 7.0),
    // padding: const EdgeInsets.only(left: 05,right: 05,top: 10.0),
    height: 210,
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
      //onTap:() => provider2.onTapProductDetails(index!,url!),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  SizedBox(
                    height: deviceHeight * 0.24,
                    width: deviceWidth,
                    child: CachedNetworkImage(
                        // imageUrl: 'https://picsum.photos/250?image=9',
                        imageUrl: image!,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetsImagesRes.girl1)),
                  ),
                  Positioned(
                    top: 0,
                    left: 12,
                    child: Container(
                      height: 28,
                      width: 23,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: ColorRes.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Text(
                        "10% OFF",
                        style: robotoSemiBoldTextStyle(
                            color: ColorRes.white, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                  Row(
                    children: [
                      Text(Strings.tops,
                          style: robotoSemiBoldTextStyle(
                              color: ColorRes.grey, fontSize: 12)),
                      const Spacer(),
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
                          children: const [
                            Text(
                              '4.4',
                              style: TextStyle(
                                  color: ColorRes.white, fontSize: 12),
                            ),
                            Icon(
                              Icons.star,
                              color: ColorRes.white,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight * 0.006),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          name!,
                          style: robotoMediumTextStyle(
                              color: ColorRes.greyDark, fontSize: 12),
                          maxLines: 2,
                        )),
                        const Padding(
                          padding: EdgeInsets.only(right: 4.0, top: 4.5),
                          child: CircleAvatar(
                            backgroundColor: ColorRes.blue,
                            radius: 15,
                            child: Center(
                                child: Icon(
                              Icons.favorite,
                              color: ColorRes.white,
                              size: 18,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Text(name, style: robotoBoldTextStyle(fontSize: 12),maxLines: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        mainPrice!,
                        style: robotoBoldTextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        strokedPrice!,
                        style: robotoBoldTextStyle(
                                fontSize: 10,
                                color: ColorRes.clrFont.withOpacity(0.7))
                            .copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: deviceHeight * 0.006,),
                  // Padding(
                  //   padding: const EdgeInsets.only(left:4.0,right: 4.0),
                  //   child: Row(
                  //     children: [
                  //       Text(Strings.rs3800,style: robotoSemiBoldTextStyle(color: ColorRes.blue,fontSize: 12),),
                  //       SizedBox(width: deviceWidth * 0.01,),
                  //       Text(Strings.rs3479,
                  //         style: robotoSemiBoldTextStyle(color: ColorRes.grayText,fontSize: 8,),),
                  //       // SizedBox(width: deviceWidth * 0.01,),
                  //       // Text('(57% off)',style: robotoBoldTextStyle(color: ColorRes.blue,fontSize: 12),)
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      //   ],
      // ),
    ),
  );
}
