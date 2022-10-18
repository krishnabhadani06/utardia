import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

Widget messagesellerDialog(
    BuildContext context, ProductDetailsProvider provider) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.height;
  provider.productName.text = provider.homeProductDetail!.name.toString();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
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
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  color: ColorRes.dailogBoxColor,
                  boxShadow: [
                    BoxShadow(
                      color: ColorRes.dailogBoxColor.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset.zero,
                      spreadRadius: 1,
                    ),
                  ],
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
                    SizedBox(height: deviceHeight * 0.005),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 5,
                            offset: Offset.zero,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: txtfield(
                          validate: (val) {},
                          // validate: (val) => validateEmail1(val),
                          controllerValue: provider.productName,
                          hintTxt: Strings.productName),
                    ),
                    SizedBox(height: deviceHeight * 0.03),
                    Text(
                      Strings.description,
                      style: robotoSemiBoldTextStyle(
                          color: ColorRes.dailogTextColor, fontSize: 15),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.005,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 5,
                              offset: Offset.zero,
                              spreadRadius: 0,
                            )
                          ]),
                      child: txtFieldMulti(
                          validate: (val) {},
                          // validate: (val) => validateEmail1(val),
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
                    materialButton(
                        txtButton: Strings.submit,
                        onPressed: () {
                          provider.onTapSubmitQuery(
                              provider.homeProductDetail!.id.toString(),
                              PrefService.getString(PrefKeys.uid).toString(),
                              provider.description.text.toString(),
                              provider.homeProductDetail!.name.toString());
                        })
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
      ),
    ],
  );
}
