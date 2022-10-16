// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/terms_bottom_sheet.dart';
import 'package:utardia/screen/authorization/registration/registration_api/registration_api.dart';
import 'package:utardia/screen/dashboard/change_password/change_password_screen.dart';
import 'package:utardia/screen/dashboard/change_password/chnage_password_provider.dart';

class OtpProvider extends ChangeNotifier {
  TextEditingController txtOtp1 = TextEditingController();
  TextEditingController txtOtp2 = TextEditingController();
  TextEditingController txtOtp3 = TextEditingController();
  TextEditingController txtOtp4 = TextEditingController();
  TextEditingController txtOtp5 = TextEditingController();
  TextEditingController txtOtp6 = TextEditingController();
  String? uid;
  bool isForgot = false;
  bool isResend = false;
  bool isPhone = false;
  Timer? timer;
  int start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          isResend = true;
          notifyListeners();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }

  void onTapResendButton() {
    isResend = !isResend;
    startTimer();
    SingUpApi.reSendApi(uid.toString(), isPhone);
    // reSendApi()
  }

  // void reSendApi( String uid, String code) async
  // {
  // try{
  //   http.Response? res= await HttpService.postApi(url: )
  // }catch(e,x){
  //   kDebugMode?Logger().e(e.toString()+x.toString()):"";
  //   showToast(e.toString());
  // }

  void onTapContinue() async {
    if (txtOtp1.text.isNotEmpty &&
        txtOtp2.text.isNotEmpty &&
        txtOtp3.text.isNotEmpty &&
        txtOtp4.text.isNotEmpty &&
        txtOtp5.text.isNotEmpty &&
        txtOtp6.text.isNotEmpty) {
      String otp =
          "${txtOtp1.text}${txtOtp2.text}${txtOtp3.text}${txtOtp4.text}${txtOtp5.text}${txtOtp6.text}";
      if (kDebugMode) {
        print(uid);
      }
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
        SingUpApi.conformCode(uid!, otp).then((value) => {
              print(value),
              if (value["result"] == true)
                {
                  navigator.currentState!
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  })),
                  txtOtp1.clear(),
                  txtOtp2.clear(),
                  txtOtp3.clear(),
                  txtOtp4.clear(),
                  txtOtp5.clear(),
                  txtOtp6.clear(),
                }
            });
      }
    } else {
      SingUpApi.reSendApi(uid.toString(), isPhone);
      Fluttertoast.showToast(msg: "please fill Otp!!");
      notifyListeners();
    }
  }

  Widget onTapTerms(BuildContext context, String title, String subText) {
    return TermsBottomSheet(title, subText);
  }
}
