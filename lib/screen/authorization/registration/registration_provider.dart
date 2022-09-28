import 'package:flutter/material.dart';
import 'package:utardia/model/SignUp_Model/signup_model.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';

import 'registration_api/registration_api.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  SingUpModel singUpModel = SingUpModel();
  bool loader = false;

  void onTapRegistration(BuildContext context) {
    if (registrationFormKey.currentState!.validate()) {
      singUpApiData(
        context,
        txtEmail.text,
        txtPassword.text,
        txtRePassword.text,
      );
    } else {}
  }

  // Navigator.push(context, MaterialPageRoute(builder: (context)=>const OtpReceiverScreen()));

  Widget onTapTerms(BuildContext context, String title, String subText) {
    return TermsBottomSheet(title, subText);
  }

  Future<void> singUpApiData(BuildContext context, String email,
      String password, String retypePassword) async {
    loader = true;
    await SingUpApi.singUpApi(context, email, password, retypePassword);

    loader = false;
    notifyListeners();
  }
}
