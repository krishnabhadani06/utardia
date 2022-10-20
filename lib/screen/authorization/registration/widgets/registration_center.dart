import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
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
          SizedBox(height: deviceHeight * 0.02),
          Center(
            child: Container(
              height: deviceHeight * 0.050,
              width: deviceWidth * 0.60,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.buttonBlue),
                  boxShadow: [
                    BoxShadow(
                      color: ColorRes.buttonBlue.withOpacity(0.5),
                      //color of shadow
                      spreadRadius: 0, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(0, 0), // changes position of shadow
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      provider.onTapButtonRegis(0);
                    },
                    child: Container(
                      height: deviceHeight * 0.050,
                      decoration: BoxDecoration(
                        color: provider.isPhone == false
                            ? ColorRes.buttonBlue
                            : ColorRes.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(14.0),
                            bottomLeft: Radius.circular(14.0)),
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
                        provider.onTapButtonRegis(1);
                      },
                      child: Container(
                        height: deviceHeight * 0.050,
                        decoration: BoxDecoration(
                          color: provider.isPhone
                              ? ColorRes.buttonBlue
                              : ColorRes.white,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(14.0),
                            topRight: Radius.circular(14.0),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.02,
          ),
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
                                          child: Text("+91"),
                                        )),
                            ],
                          ),
                        ),
                      ),
                      // child: _buildCountryPickerDropdownSoloExpanded(context),
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
          // Visibility(
          //   visible: provider.isPhone,
          //   child: Container(
          //     margin: const EdgeInsets.only(bottom: 5),
          //     padding: const EdgeInsets.only(right: 25),
          //     alignment: Alignment.centerLeft,
          //     height: 15,
          //     width: double.infinity,
          //     // color: Colors.yellow,
          //     child: Text(
          //       provider.errorTextPhone ?? "",
          //       style: robotoRegularTextStyle(
          //         fontSize: 12,
          //         color: ColorRes.red,
          //       ),
          //     ),
          //   ),
          // ),
          Visibility(
            visible: !provider.isPhone,
            child: CommonTextField(
                controller: provider.txtEmail,
                obscure: false,
                hintText: Strings.enterYourEmail,
                error: false,
                width: deviceWidth,
                border: false),
          ),
          Visibility(
            visible: !provider.isPhone,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(right: 25),
              alignment: Alignment.centerLeft,
              height: 15,
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
            height: 15,
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
            height: 15,
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

// _buildCountryPickerDropdownSoloExpanded(BuildContext context) {
//   return CountryPickerDropdown(
//     /* underline: Container(
//         height: 2,
//         color: Colors.red,
//       ),*/
//     //show'em (the text fields) you're in charge now
//     onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//     //if you want your dropdown button's selected item UI to be different
//     //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
//     onValuePicked: (Country country) {
//       Provider.of<RegistrationProvider>(context, listen: false)
//           .onchangedCountry(country);
//     },
//
//     initialValue: "IN",
//     itemBuilder: (Country country) {
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // const SizedBox(width: 2.0),
//           Expanded(
//               flex: 1, child: CountryPickerUtils.getDefaultFlagImage(country)),
//           // SizedBox(width: 8.0),
//           Expanded(
//               flex: 2,
//               child: Text(
//                 '+${country.phoneCode},',
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               )),
//         ],
//       );
//     },
//     itemHeight: null, //50,
//     isExpanded: true,
//     //initialValue: 'TR',
//     icon: const Icon(Icons.keyboard_arrow_down_rounded),
//   );
// }
