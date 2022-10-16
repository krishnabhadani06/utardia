import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/registration/registration_provider.dart';
import 'package:utardia/screen/authorization/registration/widgets/registration_bottom.dart';
import 'package:utardia/screen/authorization/registration/widgets/registration_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 58.0),
              child: Column(children: [
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
                          fontSize: 20.0, color: ColorRes.dailogBoxColor)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  Strings.marketPlace,
                  style: robotoRegularTextStyle(
                      fontSize: 09, color: ColorRes.dailogBoxColor),
                ),
                const RegistrationCenter(),
                const RegistrationBottom(),
              ]),
            ),
            provider.loader == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
