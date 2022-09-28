import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class LoginCenter extends StatefulWidget {
  const LoginCenter({Key? key}) : super(key: key);

  @override
  State<LoginCenter> createState() => _LoginCenterState();
}

class _LoginCenterState extends State<LoginCenter> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 18),
      child: Form(
        key: provider.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.login,
                  style: title,
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.02,
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
                controllerValue: provider.txtId,
                hintTxt: Strings.enterEmail,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Card(
              elevation: 4.0,
              shadowColor: ColorRes.borderblue.withOpacity(0.7),
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: txtfield(
                  isObs: true,
                  validate: (val) {
                    if (val!.length < 8) return Strings.enterMinimumPassword;
                    return (val!.isEmpty) ? Strings.pleaseEnterPassword : null;
                  },
                  controllerValue: provider.txtPassword,
                  hintTxt: Strings.password),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => provider.onTapForgot(),
                  child: Text(
                    Strings.forgotPassword,
                    style: robotoBoldTextStyle(
                        fontSize: 16, color: ColorRes.textBlue),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            materialButton(
                txtButton: Strings.login,
                onPressed: () => provider.onClickLogin(context)),
          ],
        ),
      ),
    );
  }
}
