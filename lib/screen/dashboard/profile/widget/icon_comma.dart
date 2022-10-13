import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

Widget icons(
    {required IconData iconData, required double size, required Color color}) {
  return Icon(iconData, size: size, color: color);
  //   {required IconData iconData, required double size, required Color color}) {
  // return Icon(iconData, size: size, color: color);
}

Widget rowCommon({required Image icon, required String title}) {
  return Row(
    children: [
      icon,
      // icons(iconData: icon, size: 28, color: ColorRes.buttonBlue),
      SizedBox(width: deviceWidth * 0.03),
      Container(
        width: deviceWidth * 0.48,
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: robotoBoldTextStyle(fontSize: 16, color: ColorRes.buttonBlue),
        ),
      ),
      // SizedBox(width: deviceWidth * 0.03),
      icons(iconData: IconRes.icNext, size: 30, color: ColorRes.buttonBlue),
    ],
  );
}
