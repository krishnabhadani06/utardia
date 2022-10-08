import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class OtpCenter extends StatelessWidget {
  const OtpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtpProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.03,
        ),
        Text(
          Strings.enterCode,
          style: title,
        ),
        SizedBox(
          height: deviceHeight * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp1,
                  autoFocus: false),
            ),
            SizedBox(
              width: deviceWidth * 0.03,
            ),
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp2,
                  autoFocus: false),
            ),
            SizedBox(
              width: deviceWidth * 0.03,
            ),
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp3,
                  autoFocus: false),
            ),
            SizedBox(
              width: deviceWidth * 0.03,
            ),
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp4,
                  autoFocus: false),
            ),
            SizedBox(
              width: deviceWidth * 0.03,
            ),
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp5,
                  autoFocus: false),
            ),
            SizedBox(
              width: deviceWidth * 0.03,
            ),
            Container(
              height: deviceWidth * 0.10,
              width: deviceWidth * 0.10,
              decoration: BoxDecoration(
                color: ColorRes.white,
                border: Border.all(
                  color: ColorRes.white,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.4),
                    //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: txtField1(
                  context: context,
                  controllerValue: provider.txtOtp6,
                  autoFocus: false),
            )
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.24,
        ),
        materialButton(
            txtButton: Strings.continues,
            onPressed: () => provider.onTapContinue()),
      ],
    );
  }
}
