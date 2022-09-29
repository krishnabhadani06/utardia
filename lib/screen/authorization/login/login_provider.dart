import 'dart:convert';
import 'package:country_pickers/country.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/model/SinIn_Model/singin_model.dart';
import 'package:utardia/screen/authorization/login/Login_Api/login_Api.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_screen.dart';
import 'package:utardia/services/pref_service.dart';

import '../registration/registration_screen.dart';

class LoginProvider extends ChangeNotifier {
  int page = 0;
  bool isPhone = false;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String? errorTxtId;
  String? errorTxtPass;
  Country? currentCountry;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool loader = false;
  void onTapForgot() {
    navigator.currentState!.push(
        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
  }

  void onTapButtonOption(int index) {
    isPhone = !isPhone;
    notifyListeners();
  }

  void onTapCreate() {
    navigator.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const RegistrationScreen()));
  }

  void onClickLogin(BuildContext context) async {
    emailValidation();
    passwordValidation();
    if (errorTxtPass == null && errorTxtId == null) {
      singUpApiData(
          isPhone ? "${currentCountry!.phoneCode}${txtPhone.text}" : txtId.text,
          txtPassword.text,
          context);
    }
  }

  void emailValidation() {
    errorTxtId = validateEmail(txtId.text);
    notifyListeners();
  }

  void passwordValidation() {
    errorTxtPass = validatePassword(txtPassword.text);
    notifyListeners();
  }

  Future<void> singUpApiData(
      String email, String password, BuildContext context) async {
    loader = true;
    SingInModel? model = await SingInpApi.singInApi(email, password, context);
    if (model != null) {
      writeSignInData(model.toJson());
    } else {
      if (kDebugMode) {
        print("user not found developer");
      }
    }
    loader = false;
    notifyListeners();
  }

  void writeSignInData(Map<String, dynamic> userdata) {
    PrefService.setValue("UserData", jsonEncode(userdata));
  }

  void onTapCountry(Country country) {
    currentCountry = country;
  }
// void writeSignInData(Map<String, dynamic> userdata) {
//   PrefService.init();
//   List<String> list = userdata.entries.map((e) => e.toString()).toList();
//   print(list);
//   PrefService.setValue("UserData", list);
// }
}
