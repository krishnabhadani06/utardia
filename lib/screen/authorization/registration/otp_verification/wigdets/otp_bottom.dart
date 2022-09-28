import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class OtpBottom extends StatelessWidget {
  const OtpBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtpProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 18),
      child: Column(
        children: [
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.byCreatingAccount,
                style: robotoRegularTextStyle(fontSize: 12),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: deviceWidth / 1.1,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                    ),
                    builder: (BuildContext context) => provider.onTapTerms(
                        context,
                        Strings.termsOfService,
                        Strings.subBottomText)),
                child: Text(
                  Strings.termsOfService,
                  style: natoRegularTextStyle(
                      fontSize: 12, color: ColorRes.textBlue),
                ),
              ),
              SizedBox(
                width: deviceWidth / 70,
              ),
              Text(
                Strings.and,
                style: robotoRegularTextStyle(fontSize: 12),
              ),
              SizedBox(
                width: deviceWidth / 70,
              ),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: deviceWidth / 1.1,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0)),
                    ),
                    builder: (BuildContext context) => provider.onTapTerms(
                        context, Strings.privacyPolicy, Strings.subBottomText)),
                child: Text(
                  Strings.privacyPolicy,
                  style: natoRegularTextStyle(
                      fontSize: 12, color: ColorRes.textBlue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
