import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_proivder.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgotPasswordProvider>(context);
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 74.0),
        child: Column(
          children: [
            Container(
              height: deviceHeight * 0.25,
              child: Image.asset(
                AssetsImagesRes.loginUtradiyaImage,
                //fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.forgotPassword1,
                        style: title,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  CommonTextField(
                      controller: provider.txtEmail,
                      obscure: true,
                      hintText: Strings.emailOrPhone,
                      error: false,
                      width: deviceWidth,
                      border: false),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.only(right: 25),
                    alignment: Alignment.centerLeft,
                    height: 20,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: Text(
                      provider.errorTextEmail ?? "",
                      style: robotoRegularTextStyle(
                        fontSize: 12,
                        color: ColorRes.red,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.03,
                  ),
                  materialButton(
                      txtButton: Strings.reSetPassword,
                      onPressed: () => provider.onTapResetPassword()),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
