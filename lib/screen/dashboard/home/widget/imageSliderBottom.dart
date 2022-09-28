import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

Widget sliderBottomHome({
  // required String imgPath,
  required BuildContext context,
  required List<String> sliderImage,
}) {
  return ImageSlideshow(
    width: double.infinity,
    height: deviceHeight / 4,
    initialPage: 0,
    indicatorColor: ColorRes.blue,
    indicatorBackgroundColor: Colors.grey,
    onPageChanged: (value) {
      print('Page changed: $value');
    },
    autoPlayInterval: 3000,
    isLoop: true,
    children: sliderImage.map((e) {
      return CachedNetworkImage(
        // imageUrl: 'https://picsum.photos/250?image=9',
        imageUrl: e.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>
            Image.asset(AssetsImagesRes.buy2GetFreeImage),
      );
    }).toList(),
  );
}
