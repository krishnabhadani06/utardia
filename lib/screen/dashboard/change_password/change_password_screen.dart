import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/dashboard/change_password/chnage_password_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangePasswordProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorRes.appBarColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          leading: GestureDetector(
            child: Icon(IconRes.icBack, size: 30),
            onTap: () {
              navigator.currentState!.pop();
              // Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(Strings.changePassword,
              style: ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white)),
        ),
        body: Form(
          key: provider.changePasswordFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 19),
              child: Column(
                children: [
                  SizedBox(height: deviceHeight * 0.04),
                  provider.isForgot
                      ? const SizedBox()
                      : txtfield(
                          isObs: true,
                          validate: (val) {
                            if (val!.length < 8) {
                              return Strings.enterMinimumPassword;
                            }
                            return (val!.isEmpty)
                                ? Strings.pleaseEnterPassword
                                : null;
                          },
                          controllerValue: provider.txtOldPassword,
                          hintTxt: Strings.oldPassword,
                          // validate: (val) => validatePassword(provider.txtOldPassword)),
                          // validate: (val) => validatePassword(val),
                        ),
                  SizedBox(height: deviceHeight * 0.02),
                  txtfield(
                    isObs: true,
                    validate: (val) {
                      if (val!.length < 8) return Strings.enterMinimumPassword;
                      return (val!.isEmpty)
                          ? Strings.pleaseEnterPassword
                          : null;
                    },
                    controllerValue: provider.txtNewPassword,
                    hintTxt: Strings.newPassword,
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  txtfield(
                      isObs: true,
                      controllerValue: provider.txtRePassword,
                      hintTxt: Strings.verifyPassword,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return 'Please re-enter your new password';
                        }
                        if (val != provider.txtRePassword.text) {
                          return 'Password must be same..';
                        }
                        return null;
                      }),

                  // SizedBox(height:deviceHeight/25),
                  // materialButton(txtButton: Strings.submit, onPressed: (){
                  //   print(provider.txtNewPassword.text);
                  //   print(provider.txtRePassword.text);
                  //   print(provider.txtOldPassword.text);
                  //   provider.onTapSubmit(context,provider.txtOldPassword,provider.txtRePassword,provider.txtNewPassword);}),

                  SizedBox(height: deviceHeight * 0.04),
                  materialButton(
                      txtButton: Strings.submit,
                      onPressed: () {
                        if (provider.changePasswordFormKey.currentState!
                                .validate() ==
                            true) {
                          provider.onTapSubmit();
                        }
                        // onPressed: () {
                        //   provider.onTapSubmit();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
