import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/util/color_res.dart';

Widget commonLoader() {
  return Container(
    height: deviceHeight,
    width: deviceWidth,
    alignment: Alignment.center,
    color: ColorRes.buttonBlue.withOpacity(0.2),
    child: Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorRes.buttonBlue,
      ),
      child: const CircularProgressIndicator(
        color: ColorRes.white,
      ),
    ),
  );
}
