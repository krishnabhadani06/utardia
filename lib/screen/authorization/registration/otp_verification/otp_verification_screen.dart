import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/wigdets/otp_bottom.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/wigdets/otp_center.dart';
import 'package:utardia/util/image_res.dart';

class OtpReceiverScreen extends StatelessWidget {
  const OtpReceiverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 74.0),
            child: Column(children: [
              Container(
                height: deviceHeight * 0.25,
                child: Image.asset(
                  AssetsImagesRes.loginUtradiyaImage,
                  //fit: BoxFit.fill,
                ),
              ),
              const OtpCenter(),
              const OtpBottom(),
            ]),
          ),
        ),
      ),
    );
  }
}
