import 'package:flutter/material.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';

Widget materialButton(
    {required String txtButton, required void Function()? onPressed}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    height: 50.0,
    minWidth: 340,
    // minWidth: deviceWidth * 0.93,
    // height: deviceHeight/15,
    color: ColorRes.buttonBlue,
    onPressed: onPressed,
    child: Text(
      txtButton,
      style: robotoBoldTextStyle(fontSize: 18, color: ColorRes.white),
    ),
  );
}
