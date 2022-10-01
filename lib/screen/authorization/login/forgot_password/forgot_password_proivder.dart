//import 'package:chhabildas_project/screen/authorization/login/forgot_password/forgot_password_api.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_api.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String? errorTextEmail;
  String? errorPhone;

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool loader = false;
  bool isPhone = false;

  void onTapButtonForgotPassword(int index) {
    isPhone = !isPhone;
    notifyListeners();
  }

  void onTapResetPassword() {
    emailValidation();
    if (errorTextEmail == null && errorPhone == null) {
      forgotPasswordData(
        txtEmail.text,
        txtPhone.text,
      );
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

  Future<void> forgotPasswordData(String email, String phone) async {
    loader = true;
    await ForgotPasswordApi.forgotPassword(email)
        .then((value) => {txtEmail.clear(), txtPhone.clear()});
    loader = false;
    notifyListeners();
  }
}
