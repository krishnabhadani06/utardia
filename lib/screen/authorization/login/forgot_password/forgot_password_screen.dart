import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
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
      body: Form(
        key: provider.forgotPasswordFormKey,
        child: Padding(
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
                    Card(
                      elevation: 4.0,
                      shadowColor: ColorRes.borderblue.withOpacity(0.7),
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: txtfield(
                          validate: (val) => validateEmail1(val),
                          controllerValue: provider.txtEmail,
                          hintTxt: Strings.enterEmail),
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
      ),
    ));
  }
}
