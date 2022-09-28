import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/registration/registration_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class RegistrationCenter extends StatelessWidget {
  const RegistrationCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 18),
      child: Form(
        key: provider.registrationFormKey,
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.register,
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
                  // validate: (val) => validateEmail(val),
                  controllerValue: provider.txtEmail,
                  hintTxt: Strings.enterEmail),
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
                  //validate: (val) => validatePassword(val),
                  controllerValue: provider.txtPassword,
                  hintTxt: Strings.password),
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
                    if (val!.isEmpty) {
                      return 'Please re-enter your new password';
                    }
                    if (val != provider.txtRePassword.text) {
                      return 'Password must be same..';
                    }
                    return null;
                  },
                  controllerValue: provider.txtRePassword,
                  hintTxt: Strings.verifyPass),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            materialButton(
                txtButton: Strings.register,
                onPressed: () => provider.onTapRegistration(context)),
          ],
        ),
      ),
    );
  }
}
