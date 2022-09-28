import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/screen/authorization/registration/registration_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class RegistrationCenter extends StatelessWidget {
  const RegistrationCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegistrationProvider>(context);
    final provider1 = Provider.of<LoginProvider>(context);
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
                Strings.register,
                style: title,
              ),
            ],
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          CommonTextField(
              controller: provider.txtEmail,
              obscure: false,
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
            height: deviceHeight * 0.02,
          ),
          CommonTextField(
              controller: provider.txtPassword,
              obscure: true,
              hintText: Strings.password,
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
              provider.errorTextPassword ?? "",
              style: robotoRegularTextStyle(
                fontSize: 12,
                color: ColorRes.red,
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.02,
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
            height: 20,
            width: double.infinity,
            // color: Colors.yellow,
            child: Text(
              provider.errorTextRePassword ?? "",
              style: robotoRegularTextStyle(
                fontSize: 12,
                color: ColorRes.red,
              ),
            ),
          ),
          // Card(
          //   elevation: 4.0,
          //   shadowColor: ColorRes.borderblue.withOpacity(0.7),
          //   borderOnForeground: true,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: txtfield(
          //       isObs: true,
          //       validate: (val) {
          //         if (val!.isEmpty) {
          //           return 'Please re-enter your new password';
          //         }
          //         if (val != provider.txtRePassword.text) {
          //           return 'Password must be same..';
          //         }
          //         return null;
          //       },
          //       controllerValue: provider.txtRePassword,
          //       hintTxt: Strings.verifyPass),
          // ),
          SizedBox(
            height: deviceHeight * 0.03,
          ),
          materialButton(
              txtButton: Strings.register,
              onPressed: () => provider.onTapRegistration(context)),
        ],
      ),
    );
  }
}
