import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/SinIn_Model/singin_model.dart';
import 'package:utardia/screen/authorization/login/Login_Api/login_Api.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_screen.dart';
import 'package:utardia/services/pref_service.dart';

import '../registration/registration_screen.dart';

class LoginProvider extends ChangeNotifier {
  int page = 0;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool loader = false;
  void onTapForgot() {
    navigator.currentState!.push(
        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
  }

  void onTapCreate() {
    navigator.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const RegistrationScreen()));
  }

  void onClickLogin(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      singUpApiData(txtId.text, txtPassword.text);
    }
  }

  Future<void> singUpApiData(String email, String password) async {
    loader = true;
    SingInModel? model = await SingInpApi.singInApi(email, password);
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
// void writeSignInData(Map<String, dynamic> userdata) {
//   PrefService.init();
//   List<String> list = userdata.entries.map((e) => e.toString()).toList();
//   print(list);
//   PrefService.setValue("UserData", list);
// }
}
