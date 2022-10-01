import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/model/SignUp_Model/signup_model.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';

import 'registration_api/registration_api.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  TextEditingController txtPhone = TextEditingController();

  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  SingUpModel singUpModel = SingUpModel();
  bool loader = false;
  String? errorTextEmail;
  String? errorTextPassword;
  String? errorTextRePassword;
  String? errorTextPhone;
  bool isPhone = false;

  void onTapRegistration(BuildContext context) {
    if (Provider.of<LoginProvider>(context, listen: false).isPhone) {
      passwordValidation();
      rePasswordValidation();
      phoneValidation();
      if (errorTextPassword == null &&
          errorTextRePassword == null &&
          errorTextPhone == null) {
        singUpApiData(
          context,
          txtEmail.text,
          txtPassword.text,
          txtRePassword.text,
          txtPhone.text,
        );
      } else {}
    } else {
      emailValidation();
      passwordValidation();
      rePasswordValidation();
      // phoneValidation();
      if (errorTextEmail == null &&
          errorTextPassword == null &&
          errorTextRePassword == null) {
        singUpApiData(
          context,
          txtEmail.text,
          txtPassword.text,
          txtRePassword.text,
          txtPhone.text,
        );
      } else {}
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
    errorTextPhone = phoneNumberValidator(txtPhone.text);
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
    await SingUpApi.singUpApi(context, email, password, retypePassword, phone);

    loader = false;
    notifyListeners();
  }
}
