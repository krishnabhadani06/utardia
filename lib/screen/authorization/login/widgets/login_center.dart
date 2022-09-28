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
          CommonTextField(
              controller: provider.txtId,
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
              provider.errorTxtId ?? "",
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
              provider.errorTxtPass ?? "",
              style: robotoRegularTextStyle(
                fontSize: 12,
                color: ColorRes.red,
              ),
            ),
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
    );
  }
}
