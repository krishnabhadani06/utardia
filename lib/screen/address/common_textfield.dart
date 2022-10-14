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
          // color: Colors.transparent,
          color: ColorRes.lightGrey,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          // color: Colors.transparent,
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

class CommonTextFieldAddress extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool obscure;
  final String hintText;
  final bool error;
  final bool border;
  final Icon? pIcon;
  final double? width;
  final Color? fillColor;
  final bool? autoFocus;

  final bool? enable;
  final Function(String? value)? onChange;

  const CommonTextFieldAddress({
    required this.controller,
    required this.obscure,
    required this.hintText,
    required this.error,
    required this.width,
    this.enable,
    this.focusNode,
    Key? key,
    this.onChange,
    required this.border,
    this.pIcon,
    this.fillColor,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: fillColor ?? ColorRes.white,
        border: Border.all(
          color: border ? ColorRes.red : ColorRes.white,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorRes.black.withOpacity(0.5),
            //color of shadow
            spreadRadius: 0, //spread radius
            blurRadius: 3, // blur radius
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      height: 50,
      width: width,
      child: TextField(
        enabled: enable,
        style: robotoMediumTextStyle(
          fontSize: 18,
          color: error ? ColorRes.red : ColorRes.black,
        ),
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
        obscureText: obscure,
        obscuringCharacter: "⬤",
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.only(top: 0),
          hintText: hintText,
          hintStyle: robotoRegularTextStyle(
            fontSize: 18,
            color: ColorRes.grey,
          ),
          prefixIcon: pIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 7, bottom: 5),
                  child: pIcon,
                )
              : null,
        ),
      ),
    );
  }
}
