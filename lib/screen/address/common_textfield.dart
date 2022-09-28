import 'package:flutter/material.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';

Widget txtFieldAddress({
  validate,
  required TextEditingController controllerValue,
  required String hintTxt,
}) {
  return TextFormField(
    //obscureText: obscuretxt,
    validator: validate,
    controller: controllerValue,
    cursorColor: ColorRes.blue,
    decoration: InputDecoration(
      hintText: hintTxt,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10.0),
      hintStyle: robotoMediumTextStyle(fontSize: 18, color: ColorRes.lightGrey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          //color: ColorRes.lightGrey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          // color: ColorRes.lightGrey,
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
