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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: deviceHeight * 0.04),
                  provider.isForgot
                      ? const SizedBox()
                      : Text(
                          "Enter Old Password",
                          style: robotoRegularTextStyle(
                              fontSize: 15, color: ColorRes.textfielTitleColor),
                        ),
                  CommonTextField(
                      controller: provider.txtOldPassword,
                      obscure: true,
                      hintText: Strings.oldPassword,
                      error: false,
                      width: deviceWidth,
                      border: false),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.only(right: 25),
                    alignment: Alignment.centerLeft,
                    height: 15,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: Text(
                      provider.errorOldPassword ?? "",
                      style: robotoRegularTextStyle(
                        fontSize: 12,
                        color: ColorRes.red,
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    "Enter New Password",
                    style: robotoRegularTextStyle(
                        fontSize: 15, color: ColorRes.textfielTitleColor),
                  ),
                  CommonTextField(
                      controller: provider.txtNewPassword,
                      obscure: true,
                      hintText: Strings.newPassword,
                      error: false,
                      width: deviceWidth,
                      border: false),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.only(right: 25),
                    alignment: Alignment.centerLeft,
                    height: 15,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: Text(
                      provider.errorReNewPassword ?? "",
                      style: robotoRegularTextStyle(
                        fontSize: 12,
                        color: ColorRes.red,
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * 0.01),
                  Text(
                    "Enter Re-New Password",
                    style: robotoRegularTextStyle(
                        fontSize: 15, color: ColorRes.textfielTitleColor),
                  ),
                  CommonTextField(
                      controller: provider.txtRePassword,
                      obscure: true,
                      hintText: Strings.verifyPass,
                      error: false,
                      width: deviceWidth,
                      border: false),
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.only(right: 25),
                    alignment: Alignment.centerLeft,
                    height: 15,
                    width: double.infinity,
                    // color: Colors.yellow,
                    child: Text(
                      provider.errorReNewPassword ?? "",
                      style: robotoRegularTextStyle(
                        fontSize: 12,
                        color: ColorRes.red,
                      ),
                    ),
                  ),
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
