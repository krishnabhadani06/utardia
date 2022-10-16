import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/screen/authorization/login/widgets/login_bottom.dart';
import 'package:utardia/screen/authorization/login/widgets/login_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
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
                            fontSize: 20, color: ColorRes.borderblue)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Strings.marketPlace,
                    style: robotoRegularTextStyle(
                        fontSize: 09, color: ColorRes.borderblue),
                  ),
                  const LoginCenter(),
                  SizedBox(
                    height: deviceHeight * 0.04,
                  ),
                  const LoginBottom(),
                ],
              ),
            ),
            provider.loader == true ? commonLoader() : const SizedBox()
          ],
        ),
      ),
    ));
  }
}
