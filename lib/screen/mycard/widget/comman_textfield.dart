import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

String? validateCardType(val) {
  if (kDebugMode) {
    print(val);
  }
  RegExp regexVisa = RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$');
  RegExp regexMaster = RegExp(
      r'^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$');

  if (val.isEmpty) {
    return Strings.enterPassword;
  } else {
    if (regexVisa.hasMatch(val)) {
      return 'visa';
    } else if (regexMaster.hasMatch(val)) {
      return 'master';
    }
  }
  return null;
}

Widget cardNumberTextField(
    {required validate,
    required hintText,
    required TextEditingController controllerValue,
    required iconString}) {
  return TextFormField(
//obscureText: obscuretxt,
    validator: validate,
    controller: controllerValue,
    cursorColor: ColorRes.blue,
    decoration: InputDecoration(
      suffixIcon: Image.asset(iconString),
      hintText: hintText,
      hintStyle: robotoMediumTextStyle(fontSize: 18, color: ColorRes.lightGrey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: ColorRes.lightGrey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: ColorRes.lightGrey,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: ColorRes.red,
            width: 1,
          )),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 1,
          color: ColorRes.red,
        ),
      ),
    ),
  );
}
