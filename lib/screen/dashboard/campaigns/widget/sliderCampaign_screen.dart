import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';

Widget sliderCampaign({required String imgSliderPath}) {
  return CarouselSlider(
    items: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgSliderPath), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16.0),
          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    ],
    options: CarouselOptions(
      height: deviceHeight / 4,
      aspectRatio: 16 / 9,
      viewportFraction: 0.3,
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
  );
}
