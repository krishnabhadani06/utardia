import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/model/SignUp_Model/signup_model.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';

import 'registration_api/registration_api.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

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

  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  SingUpModel singUpModel = SingUpModel();
  bool loader = false;
  String? errorTextEmail;
  String? errorTextPassword;
  String? errorTextRePassword;
  String? errorTextPhone;
  bool isPhone = false;

  void onTapRegistration(BuildContext context) {
    if (isPhone == true) {
      phoneValidation();
      passwordValidation();
      rePasswordValidation();
      if (errorTextPhone == null &&
          errorTextPassword == null &&
          errorTextRePassword == null) {
        singUpApiData(
          context,
          txtEmail.text,
          txtPhone.text,
          txtPassword.text,
          txtRePassword.text,
        );
      }
    } else {
      emailValidation();
      passwordValidation();
      rePasswordValidation();
      if (errorTextEmail == null &&
          errorTextPassword == null &&
          errorTextRePassword == null) {
        singUpApiData(
          context,
          txtEmail.text,
          txtPhone.text,
          txtPassword.text,
          txtRePassword.text,
        );
      }
    }
  }

  void emailValidation() {
    errorTextEmail = validateEmail(txtEmail.text);
    notifyListeners();
  }

  void passwordValidation() {
    errorTextPassword = validatePassword(txtPassword.text);
    notifyListeners();
  }

  void rePasswordValidation() {
    errorTextRePassword = rePassValidation(txtRePassword.text);
    notifyListeners();
  }

  void phoneValidation() {
    errorTextPhone = phoneNumberValidator(txtPhone.text.toString().trim());
    notifyListeners();
  }

  String? rePassValidation(val) {
    if (kDebugMode) {
      print(val);
    }
    if (val.isEmpty) {
      return 'Please re-enter your new password';
    }
    if (val != txtRePassword.text) {
      return 'Password must be same..';
    }
    return null;
  }

  void onTapButtonRegis(int index) {
    isPhone = !isPhone;
    notifyListeners();
  }

  Widget onTapTerms(BuildContext context, String title, String subText) {
    return TermsBottomSheet(title, subText);
  }

  Future<void> singUpApiData(BuildContext context, String email,
      String password, String retypePassword, String phone) async {
    loader = true;
    await SingUpApi.singUpApi(
        context: context,
        email: email,
        password: password,
        retypePassword: retypePassword,
        phone: phone,
        isPhone: isPhone,
        code: currentCountry?.phoneCode ?? "91");

    loader = false;
    notifyListeners();
  }

  void onchangedCountry(Country country) {
    currentCountry = country;
    notifyListeners();
  }
}
