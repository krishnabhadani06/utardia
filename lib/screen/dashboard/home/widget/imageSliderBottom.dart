import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

Widget sliderBottomHome({
  // required String imgPath,
  required BuildContext context,
  required List<String> bannerImage,
  // required List<String> sliderImage,
}) {
  return ImageSlideshow(
    width: deviceWidth * 0.90,
    // width: double.infinity,
    height: deviceHeight * 0.25,
    initialPage: 0,
    indicatorColor: ColorRes.blue,
    indicatorRadius: 4.0,
    indicatorBackgroundColor: Colors.grey,
    onPageChanged: (value) {
      if (kDebugMode) {
        print('Page changed: $value');
      }
    },
    autoPlayInterval: 3000,
    isLoop: true,
    // children: sliderImage.map((e) {
    children: bannerImage.map((e) {
      return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            // imageUrl: 'https://picsum.photos/250?image=9',
            imageUrl: e.toString(),
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) =>
                Image.asset(AssetsImagesRes.buy2GetFreeImage),
            fit: BoxFit.fill,
          ),
        ),
      );
    }).toList(),
  );
}
