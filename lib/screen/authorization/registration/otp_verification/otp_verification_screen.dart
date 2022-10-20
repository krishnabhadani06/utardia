import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/wigdets/otp_bottom.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/wigdets/otp_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class OtpReceiverScreen extends StatelessWidget {
  const OtpReceiverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtpProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Image.asset(
                  AssetsImagesRes.loginUtradiyaImage,
                  height: deviceHeight * 0.174,
                  width: deviceWidth * 0.403,
                ),
                SizedBox(
                  height: deviceHeight * 0.015,
                ),
                Text(
                  Strings.utradia,
                  style: robotoRegularTextStyle(
                          fontSize: 20, color: ColorRes.dailogBoxColor)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  Strings.marketPlace,
                  style: robotoRegularTextStyle(
                      fontSize: 09, color: ColorRes.dailogBoxColor),
                ),
                const OtpCenter(),
                const OtpBottom(),
                provider.loader == true ? commonLoader() : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
