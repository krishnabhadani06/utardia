import 'package:flutter/material.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';

Widget txtfield({
  validate,
  bool? isObs,
  required TextEditingController controllerValue,
  required String hintTxt,
}) {
  return TextFormField(
    obscureText: isObs ?? false,
    validator: validate,
    controller: controllerValue,
    cursorColor: ColorRes.textBlue,
    decoration: InputDecoration(
      hintText: hintTxt,
      hintStyle: robotoMediumTextStyle(fontSize: 18, color: ColorRes.lightGrey),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xffeeeeee),
            width: 1,
          )
          // color: Colors.transparent),
          ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Color(0xffeeeeee),
          // color: Colors.transparent,
          width: 1,
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

Widget txtField1({
  required BuildContext context,
  required TextEditingController controllerValue,
  required bool autoFocus,
}) {
  // const bool autoFocus = true;

  return TextFormField(
    cursorColor: ColorRes.green,
    controller: controllerValue,
    validator: (val) {
      return (val!.isEmpty) ? 'enter' : null;
    },
    onChanged: (value) {
      if (value.length == 1) {
        FocusScope.of(context).nextFocus();
      } else {
        if (value.isEmpty) {
          FocusScope.of(context).previousFocus();
        }
      }
    },
    style: robotoMediumTextStyle(fontSize: 18, color: ColorRes.grey),
    autofocus: autoFocus,
    maxLength: 1,
    keyboardType: TextInputType.phone,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: const EdgeInsets.all(1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: ColorRes.lightGrey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: ColorRes.lightGrey,
        ),
      ),
    ),
  );
}

Widget txtFieldMulti({
  validate,
  required TextEditingController controllerValue,
  required String hintTxt,
}) {
  return TextFormField(
    //obscureText: obscuretxt,
    validator: validate,
    controller: controllerValue,
    cursorColor: ColorRes.appBarColor,
    maxLines: 12,
    minLines: 3,
    decoration: InputDecoration(
      hintText: hintTxt,
      hintStyle: robotoMediumTextStyle(fontSize: 18, color: ColorRes.lightGrey),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          // color: ColorRes.lightGrey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: Colors.transparent,
          //color: ColorRes.lightGrey,
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
