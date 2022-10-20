import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class LoginCenter extends StatelessWidget {
  const LoginCenter({super.key});

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
          SizedBox(height: deviceHeight * 0.03),
          Center(
            child: Container(
              height: deviceHeight * 0.050,
              width: deviceWidth * 0.60,
              decoration: BoxDecoration(
                border: Border.all(color: ColorRes.buttonBlue),
                boxShadow: [
                  BoxShadow(
                    color: ColorRes.black.withOpacity(0.5),
                    //color of shadow
                    spreadRadius: 0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: const Offset(0, 0), // changes position of shadow
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      provider.onTapButtonOption();
                    },
                    child: Container(
                      height: deviceHeight * 0.050,
                      decoration: BoxDecoration(
                        color: provider.isPhone == false
                            ? ColorRes.buttonBlue
                            : ColorRes.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.email,
                              color: provider.isPhone == false
                                  ? ColorRes.white
                                  : ColorRes.black),
                          SizedBox(
                            width: deviceWidth * 0.02,
                          ),
                          Text(
                            "Email",
                            style: provider.isPhone == false
                                ? robotoBoldTextStyle(
                                    fontSize: 16,
                                    color: ColorRes.white,
                                  )
                                : robotoBoldTextStyle(
                                    fontSize: 16, color: ColorRes.black),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      provider.onTapButtonOption();
                    },
                    child: Container(
                      height: deviceHeight * 0.050,
                      decoration: BoxDecoration(
                        color: provider.isPhone
                            ? ColorRes.buttonBlue
                            : ColorRes.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call,
                              color: provider.isPhone == true
                                  ? ColorRes.white
                                  : ColorRes.black),
                          SizedBox(
                            width: deviceWidth * 0.02,
                          ),
                          Text(
                            "Call",
                            style: provider.isPhone == true
                                ? robotoBoldTextStyle(
                                    fontSize: 16,
                                    color: ColorRes.white,
                                  )
                                : robotoBoldTextStyle(
                                    fontSize: 16, color: ColorRes.black),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.03),
          Visibility(
            visible: provider.isPhone,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        color: ColorRes.white,
                        // style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ColorRes.black.withOpacity(0.3),
                          //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 3, // blur radius
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              Logger().e(country.toJson());
                              provider.currentCountry = country;
                              // provider.notifyListeners();
                            });
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: provider.currentCountry != null
                                      ? Text(
                                          provider.currentCountry!.flagEmoji,
                                          style: robotoRegularTextStyle(
                                              fontSize: 25),
                                        )
                                      : const Center(
                                          child: Text(""),
                                        )),
                              Expanded(
                                  child: provider.currentCountry != null
                                      ? Text(
                                          " ${provider.currentCountry!.phoneCode.toString()}",
                                          style: robotoMediumTextStyle(
                                              fontSize: 18,
                                              color: ColorRes.greyTextHome),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2)
                                      : const Center(
                                          child: Text(""),
                                        )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: CommonTextField(
                      controller: provider.txtPhone,
                      obscure: false,
                      hintText: Strings.enterMobileNo,
                      error: false,
                      width: deviceWidth,
                      border: false),
                ),
              ],
            ),
          ),
          Visibility(
            visible: provider.isPhone,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(right: 25),
              alignment: Alignment.centerLeft,
              height: 20,
              width: double.infinity,
              // color: Colors.yellow,
              child: Text(
                provider.errorTxtPhone ?? "",
                style: robotoRegularTextStyle(
                  fontSize: 12,
                  color: ColorRes.red,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !provider.isPhone,
            child: CommonTextField(
              controller: provider.txtId,
              obscure: false,
              hintText: Strings.enterYourEmail,
              error: false,
              width: deviceWidth,
              border: false,
            ),
          ),
          Visibility(
            visible: !provider.isPhone,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5, top: 5),
              padding: const EdgeInsets.only(right: 25),
              alignment: Alignment.centerLeft,
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
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          CommonTextField(
            controller: provider.txtPassword,
            obscure: true,
            hintText: Strings.password,
            error: false,
            width: deviceWidth,
            border: false,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(right: 25),
            alignment: Alignment.centerLeft,
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
            height: deviceHeight * 0.01,
          ),
          Center(
            child: materialButton(
                txtButton: Strings.login,
                onPressed: () => provider.onClickLogin(context)),
          ),
        ],
      ),
    );
  }
}
