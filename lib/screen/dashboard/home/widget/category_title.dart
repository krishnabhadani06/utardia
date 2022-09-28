import 'package:flutter/material.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

Widget categoryTitle({String? title, VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 22),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? Strings.showByCategory,
          style: robotoSemiBoldTextStyle(),
          //textStyle(tColor: ColorRes.black, fontSize: 14),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(Strings.viewAll,
              style: robotoSemiBoldTextStyle(color: ColorRes.grey)
              //textStyle(tColor: ColorRes.grey, fontSize: 14),
              ),
        ),
      ],
    ),
  );
}
