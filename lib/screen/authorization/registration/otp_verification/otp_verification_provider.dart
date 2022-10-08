import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';
import 'package:utardia/screen/authorization/registration/registration_api/registration_api.dart';
import 'package:utardia/screen/dashboard/change_password/change_password_screen.dart';
import 'package:utardia/screen/dashboard/change_password/chnage_password_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/pref_key.dart';

class OtpProvider extends ChangeNotifier {
  TextEditingController txtOtp1 = TextEditingController();
  TextEditingController txtOtp2 = TextEditingController();
  TextEditingController txtOtp3 = TextEditingController();
  TextEditingController txtOtp4 = TextEditingController();
  TextEditingController txtOtp5 = TextEditingController();
  TextEditingController txtOtp6 = TextEditingController();
  String? uid;
  bool isForgot = false;

  void onTapContinue() async {
    if (txtOtp1.text.isNotEmpty &&
        txtOtp2.text.isNotEmpty &&
        txtOtp3.text.isNotEmpty &&
        txtOtp4.text.isNotEmpty &&
        txtOtp5.text.isNotEmpty &&
        txtOtp6.text.isNotEmpty) {
      String otp =
          "${txtOtp1.text}${txtOtp2.text}${txtOtp3.text}${txtOtp4.text}${txtOtp5.text}${txtOtp6.text}";
      print(uid);
      if (isForgot) {
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          Provider.of<ChangePasswordProvider>(context, listen: false).isForgot =
              true;
          Provider.of<ChangePasswordProvider>(context, listen: false)
              .txtOldPassword
              .text = "000000000";
          Provider.of<ChangePasswordProvider>(context, listen: false).otp = otp;
          Provider.of<ChangePasswordProvider>(context, listen: false).notify();
          txtOtp1.clear();
          txtOtp2.clear();
          txtOtp3.clear();
          txtOtp4.clear();
          txtOtp5.clear();
          txtOtp6.clear();
          return const ChangePasswordScreen();
        }));
      } else {
        await SingUpApi.conformCode(PrefService.getString(PrefKeys.uid), otp)
            .then((value) => {
                  txtOtp1.clear(),
                  txtOtp2.clear(),
                  txtOtp3.clear(),
                  txtOtp4.clear(),
                  txtOtp5.clear(),
                  txtOtp6.clear(),
                });
      }
    } else {
      Fluttertoast.showToast(msg: "please fill Otp!!");
    }
  }

  Widget onTapTerms(BuildContext context, String title, String subText) {
    return TermsBottomSheet(title, subText);
  }
}
