import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

Widget messagesellerDialog(
    BuildContext context, ProductDetailsProvider provider) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.height;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: deviceHeight * 0.60,
        width: deviceWidth * 0.90,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: ColorRes.white,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight * 0.10,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                color: ColorRes.dailogBoxColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Strings.areYouSure,
                      style: robotoSemiBoldTextStyle(
                        fontSize: 18,
                        color: ColorRes.white,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              navigator.currentState!.pop();
                            },
                            child: Icon(
                              IconRes.icClose,
                              size: 30,
                              color: ColorRes.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.productName,
                    style: robotoSemiBoldTextStyle(
                        color: ColorRes.dailogTextColor, fontSize: 15),
                  ),
                  Card(
                    elevation: 4.0,
                    shadowColor: ColorRes.borderblue.withOpacity(0.7),
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: txtfield(
                        validate: (val) => validateEmail1(val),
                        controllerValue: provider.productName,
                        hintTxt: Strings.productName),
                  ),
                  SizedBox(height: deviceHeight * 0.03),
                  Text(
                    Strings.description,
                    style: robotoSemiBoldTextStyle(
                        color: ColorRes.dailogTextColor, fontSize: 15),
                  ),
                  Card(
                    elevation: 4.0,
                    shadowColor: ColorRes.borderblue.withOpacity(0.7),
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: txtFieldMulti(
                        validate: (val) => validateEmail1(val),
                        controllerValue: provider.description,
                        hintTxt: Strings.description),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  materialButton(txtButton: Strings.submit, onPressed: () {})
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    navigator.currentState!.pop();
                  },
                  child: Text(
                    Strings.cancel,
                    style: natoSemiBoldTextStyle(
                        fontSize: 15, color: ColorRes.buttonBlue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
