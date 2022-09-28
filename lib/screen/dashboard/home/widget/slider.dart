import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/image_res.dart';

Widget sliderHome(
    {
    //required String imgPath,
    required BuildContext context
    // required BuildContext context,
    }) {
  final provider = Provider.of<HomeProvider>(context);
  return Column(
    children: [
      CarouselSlider.builder(
        itemCount: provider.bannerData.length,
        itemBuilder: (context, index, realIndex) {
          return CachedNetworkImage(
            imageUrl: provider.bannerData[index].photo.toString(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset(AssetsImagesRes.buy2GetFreeImage),
          );
        },
        options: CarouselOptions(
          height: deviceHeight / 5,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //  onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}
