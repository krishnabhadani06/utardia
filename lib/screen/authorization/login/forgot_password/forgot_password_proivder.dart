//import 'package:chhabildas_project/screen/authorization/login/forgot_password/forgot_password_api.dart';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_api.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String? errorTextEmail;
  String? errorPhone;
  // Country? currentCountry;

  Country? currentCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "9123456789",
      displayName: "India",
      displayNameNoCountryCode: "India (IN)",
      e164Key: "91-IN-0");

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool loader = false;
  bool isPhone = false;

  void onTapButtonForgotPassword(int index) {
    isPhone = !isPhone;
    notifyListeners();
  }

  void onTapResetPassword(BuildContext context) {
    if (isPhone == true) {
      phoneValidation();
      if (errorPhone == null) {
        forgotPasswordData(
          context,
          txtEmail.text,
          txtPhone.text,
        );
      }
    } else {
      emailValidation();
      if (errorTextEmail == null) {
        forgotPasswordData(
          context,
          txtEmail.text,
          txtPhone.text,
        );
      }
    }
  }

  void emailValidation() {
    errorTextEmail = validateEmail(txtEmail.text);
    notifyListeners();
  }

  void phoneValidation() {
    errorPhone = phoneNumberValidator(txtPhone.text);
    notifyListeners();
  }

  Future<void> forgotPasswordData(
      BuildContext context, String email, String phone) async {
    loader = true;
    await ForgotPasswordApi.forgotPassword(context, email, phone, isPhone)
        .then((value) => {txtEmail.clear(), txtPhone.clear()});
    loader = false;
    notifyListeners();
  }
}
