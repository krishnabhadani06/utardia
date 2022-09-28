import 'package:flutter/material.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/fonts_family.dart';

TextStyle title = const TextStyle(
    fontSize: 25, fontWeight: FontWeight.w700, color: ColorRes.titleTextBlue);
// fontSize: 36, fontWeight: FontWeight.w700, color: ColorRes.titleTextBlue);

// TextStyle textStyle({Color? tColor, double? fontSize}) {
//   return TextStyle(
//     fontSize: fontSize ?? 18,
//     color: tColor ?? ColorRes.black,
//     fontWeight: FontWeight.bold,
//   );
// }

TextStyle robotoBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.robotoBold,
    fontWeight: FontWeight.bold,
  );
}

TextStyle robotoSemiBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? ColorRes.black,
      fontFamily: FontsFamilyType.robotoBold,
      fontWeight: FontWeight.w500);
}

TextStyle robotoMediumTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.robotoMedium,
    fontWeight: FontWeight.w500,
  );
}

TextStyle robotoRegularTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.robotoRegular,
    fontWeight: FontWeight.w400,
  );
}

TextStyle natoRegularTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.notoRegular,
    fontWeight: FontWeight.w400,
  );
}

TextStyle natoMediumTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.notoMedium,
    fontWeight: FontWeight.w500,
  );
}

TextStyle natoSemiBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.notoSemiBold,
    fontWeight: FontWeight.w500,
  );
}

TextStyle natoBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.notoBold,
    fontWeight: FontWeight.bold,
  );
}

TextStyle ubuntuRegularTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.ubuntuRegular,
    fontWeight: FontWeight.w400,
  );
}

TextStyle ubuntuMediumTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.ubuntuMedium,
    fontWeight: FontWeight.w500,
  );
}

TextStyle ubuntuBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.ubuntuBold,
    fontWeight: FontWeight.bold,
  );
}

TextStyle ubuntuSemiBoldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    color: color ?? ColorRes.black,
    fontFamily: FontsFamilyType.ubuntuBold,
    fontWeight: FontWeight.w500,
  );
}
