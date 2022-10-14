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
        Text(title ?? Strings.showByCategory,
            style: robotoMediumTextStyle(
                    fontSize: 15, color: ColorRes.greyTextHome)
                .copyWith(fontWeight: FontWeight.w700)
            //textStyle(tColor: ColorRes.black, fontSize: 14),
            ),
        TextButton(
          onPressed: onTap,
          child: Text(Strings.viewAll,
              style:
                  robotoMediumTextStyle(color: ColorRes.textBlue, fontSize: 15)
                      .copyWith(fontWeight: FontWeight.w700)
              //textStyle(tColor: ColorRes.grey, fontSize: 14),
              ),
        ),
      ],
    ),
  );
}
