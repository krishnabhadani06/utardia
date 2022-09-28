//import 'package:chhabildas_project/screen/authorization/login/forgot_password/forgot_password_api.dart';
import 'package:flutter/material.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_api.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool loader = false;

  void onTapResetPassword() {
    if (forgotPasswordFormKey.currentState!.validate()) {
      forgotPasswordData(
        txtEmail.text,
      );
    }
  }

  Future<void> forgotPasswordData(
    String email,
  ) async {
    loader = true;
    await ForgotPasswordApi.forgotPassword(email).then((value) => {
          txtEmail.clear(),
        });
    loader = false;
    notifyListeners();
  }
}
