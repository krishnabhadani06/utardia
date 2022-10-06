import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/common/textform_field.dart';
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
                      provider.onTapButtonOption(0);
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
                      provider.onTapButtonOption(1);
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
                    child: _buildCountryPickerDropdownSoloExpanded(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: CommonTextField(
                      controller: provider.txtPhone,
                      obscure: false,
                      hintText: Strings.phoneNum,
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
                provider.errorTxtId ?? "",
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
              hintText: Strings.enterNameEmail,
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

_buildCountryPickerDropdownSoloExpanded(BuildContext context) {
  return CountryPickerDropdown(
    /* underline: Container(
        height: 2,
        color: Colors.red,
      ),*/
    //show'em (the text fields) you're in charge now
    onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    //if you want your dropdown button's selected item UI to be different
    //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
    onValuePicked: (Country country) {
      Provider.of<LoginProvider>(context, listen: false).onTapCountry(country);
    },
    itemBuilder: (Country country) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(width: 2.0),
          Expanded(
              flex: 1, child: CountryPickerUtils.getDefaultFlagImage(country)),
          // SizedBox(width: 8.0),
          Expanded(
              flex: 2,
              child: Text(
                '+${country.phoneCode},',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      );
    },
    itemHeight: null,
    //50,
    isExpanded: true,
    //initialValue: 'TR',
    icon: const Icon(Icons.arrow_downward),
  );
}
// class LoginCenter extends StatefulWidget {
//   const LoginCenter({Key? key}) : super(key: key);
//
//   @override
//   State<LoginCenter> createState() => _LoginCenterState();
// }
//
// class _LoginCenterState extends State<LoginCenter> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<LoginProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: deviceHeight * 0.03,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 Strings.login,
//                 style: title,
//               ),
//             ],
//           ),
//           SizedBox(height: deviceHeight * 0.01),
//           Center(
//             child: Container(
//               height: deviceHeight * 0.050,
//               width: deviceWidth * 0.60,
//               decoration: BoxDecoration(
//                   border: Border.all(color: ColorRes.buttonBlue),
//                   borderRadius: BorderRadius.all(Radius.circular(12.0))),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       onPressed: () {
//                         provider.onTapButtonOption(0);
//                       },
//                       color: provider.isPhone == false
//                           ? ColorRes.buttonBlue
//                           : ColorRes.white,
//                       minWidth: deviceWidth * 0.30,
//                       shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12.0),
//                         bottomLeft: Radius.circular(12.0),
//                       )),
//                       child: Row(
//                         children: [
//                           Icon(Icons.email,
//                               color: provider.isPhone == false
//                                   ? ColorRes.white
//                                   : ColorRes.black),
//                           SizedBox(
//                             width: deviceWidth * 0.02,
//                           ),
//                           Text(
//                             "Email",
//                             style: provider.isPhone == false
//                                 ? robotoBoldTextStyle(
//                                     fontSize: 16,
//                                     color: ColorRes.white,
//                                   )
//                                 : robotoBoldTextStyle(
//                                     fontSize: 16, color: ColorRes.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: MaterialButton(
//                       onPressed: () {
//                         provider.onTapButtonOption(1);
//                       },
//                       color: provider.isPhone
//                           ? ColorRes.buttonBlue
//                           : ColorRes.white,
//                       minWidth: deviceWidth * 0.29,
//                       shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(12.0),
//                         bottomRight: Radius.circular(12.0),
//                       )),
//                       child: Row(
//                         children: [
//                           Icon(Icons.call,
//                               color: provider.isPhone == true
//                                   ? ColorRes.white
//                                   : ColorRes.black),
//                           SizedBox(
//                             width: deviceWidth * 0.02,
//                           ),
//                           Text(
//                             "Call",
//                             style: provider.isPhone == true
//                                 ? robotoBoldTextStyle(
//                                     fontSize: 16,
//                                     color: ColorRes.white,
//                                   )
//                                 : robotoBoldTextStyle(
//                                     fontSize: 16, color: ColorRes.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: deviceHeight * 0.02,
//           ),
//           Visibility(
//             visible: provider.isPhone,
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: ColorRes.white,
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                       border: Border.all(
//                         color: ColorRes.white,
//                         // style: BorderStyle.solid,
//                         width: 1.0,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: ColorRes.black.withOpacity(0.3),
//                           //color of shadow
//                           spreadRadius: 1, //spread radius
//                           blurRadius: 3, // blur radius
//                           offset: Offset(0, 0), // changes position of shadow
//                         ),
//                       ],
//                     ),
//                     child: _buildCountryPickerDropdownSoloExpanded(context),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 Expanded(
//                   flex: 5,
//                   child: CommonTextField(
//                       controller: provider.txtPhone,
//                       obscure: false,
//                       hintText: Strings.phoneNum,
//                       error: false,
//                       width: deviceWidth,
//                       border: false),
//                 ),
//               ],
//             ),
//           ),
//           Visibility(
//             visible: provider.isPhone,
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 5),
//               padding: const EdgeInsets.only(right: 25),
//               alignment: Alignment.centerLeft,
//               height: 20,
//               width: double.infinity,
//               // color: Colors.yellow,
//               child: Text(
//                 provider.errorTxtId ?? "",
//                 style: robotoRegularTextStyle(
//                   fontSize: 12,
//                   color: ColorRes.red,
//                 ),
//               ),
//             ),
//           ),
//           Visibility(
//             visible: !provider.isPhone,
//             child: CommonTextField(
//                 controller: provider.txtId,
//                 obscure: false,
//                 hintText: Strings.enterNameEmail,
//                 error: false,
//                 width: deviceWidth,
//                 border: false),
//           ),
//           Visibility(
//             visible: !provider.isPhone,
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 5),
//               padding: const EdgeInsets.only(right: 25),
//               alignment: Alignment.centerLeft,
//               height: 20,
//               width: double.infinity,
//               // color: Colors.yellow,
//               child: Text(
//                 provider.errorTxtId ?? "",
//                 style: robotoRegularTextStyle(
//                   fontSize: 12,
//                   color: ColorRes.red,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: deviceHeight * 0.01,
//           ),
//           CommonTextField(
//               controller: provider.txtPassword,
//               obscure: true,
//               hintText: Strings.password,
//               error: false,
//               width: deviceWidth,
//               border: false),
//           Container(
//             margin: const EdgeInsets.only(bottom: 5),
//             padding: const EdgeInsets.only(right: 25),
//             alignment: Alignment.centerLeft,
//             height: 20,
//             width: double.infinity,
//             // color: Colors.yellow,
//             child: Text(
//               provider.errorTxtPass ?? "",
//               style: robotoRegularTextStyle(
//                 fontSize: 12,
//                 color: ColorRes.red,
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () => provider.onTapForgot(),
//                 child: Text(
//                   Strings.forgotPassword,
//                   style: robotoBoldTextStyle(
//                       fontSize: 16, color: ColorRes.textBlue),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: deviceHeight * 0.01,
//           ),
//           materialButton(
//               txtButton: Strings.login,
//               onPressed: () => provider.onClickLogin(context)),
//         ],
//       ),
//     );
//   }
// }
//
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
//       Provider.of<LoginProvider>(context, listen: false).onTapCountry(country);
//     },
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
//     icon: const Icon(Icons.arrow_downward),
//   );
// }
