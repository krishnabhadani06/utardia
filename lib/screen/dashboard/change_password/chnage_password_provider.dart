import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';

import '../../../common/toast_msg.dart';

class ChangePasswordProvider extends ChangeNotifier {
  TextEditingController txtOldPassword = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtRePassword = TextEditingController();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  bool isForgot = false;
  String otp = "";
  String? errorOldPassword;
  String? errorNewPassword;
  String? errorReNewPassword;

  void notify() {
    notifyListeners();
  }

  void oldPasswordValidation() {
    errorOldPassword = validatePassword(txtOldPassword.text);
    notifyListeners();
  }

  void newPasswordValidation() {
    errorNewPassword = validatePassword(txtNewPassword.text);
    notifyListeners();
  }

  void rePasswordValidation() {
    errorReNewPassword = rePassValidation(txtRePassword.text);
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

  void onTapSubmit() async {
    oldPasswordValidation.toString();
    newPasswordValidation.toString();
    rePasswordValidation.toString();
    if (isForgot) {
      // final result = await ChangePasswordApi.changePassword(txtNewPassword.text, otp);
      // if (result['result'] == true) {
      //   txtOldPassword.clear();
      //   txtNewPassword.clear();
      //   txtRePassword.clear();
      // } else {
      //   Fluttertoast.showToast(msg: result["message"] ?? "Null");
      // }
    } else {
      await changePasswordWithNewPass(
          txtRePassword.text, txtNewPassword.text, txtOldPassword.text);
    }
  }

  changePasswordWithNewPass(
      String textRe, String text2New, String text3Old) async {
    try {
      Map<dynamic, dynamic> userData =
          jsonDecode(PrefService.getString("UserData").toString())
              as Map<dynamic, dynamic>;
      String url = ApiEndPoint.changePassword;
      Logger().d(userData);
      http.Response? res = await HttpService.postApi(url: url, body: {
        "old_password": text3Old,
        "new_password": text2New,
        "confirm_password": textRe,
        "user_id": userData["user"]["id"].toString()
      }, header: {
        "Authorization": "Bearer ${userData['access_token']}"
      });
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        if (map['result'] == true) {
          txtOldPassword.clear();
          txtNewPassword.clear();
          txtRePassword.clear();
        }
        showToast(map['message']);
      } else {
        showToast("something bad error code is :${res!.statusCode}");
      }
    } catch (ex, x) {
      showToast(ex.toString());
      kDebugMode ? Logger().e(x.toString() + ex.toString()) : "";
    }
  }
}

// void onTapSubmit() async {
//   txtNewPassword.text;
//   txtRePassword.text;
//   if (key.currentState!.validate()) {
//     if (isForgot) {} else {}
//   }

// class ChangePasswordProvider extends ChangeNotifier {
//   TextEditingController txtOldPassword = TextEditingController();
//   TextEditingController txtNewPassword = TextEditingController();
//   TextEditingController txtRePassword = TextEditingController();
//   GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
//   bool isForgot = false;
//   String otp = "";
//
//   void notify() {
//     notifyListeners();
//   }
//
//   void onTapSubmit() async {
//     if (changePasswordFormKey.currentState!.validate()) {
//       if (isForgot) {
//         // final result = await ChangePasswordApi.changePassword(txtNewPassword.text, otp);
//         // if (result['result'] == true) {
//         //   txtOldPassword.clear();
//         //   txtNewPassword.clear();
//         //   txtRePassword.clear();
//         // } else {
//         //   Fluttertoast.showToast(msg: result["message"] ?? "Null");
//         // }
//       } else {
//         await changePasswordWithNewPass(txtRePassword.text, txtNewPassword.text, txtOldPassword.text);
//       }
//     }
//     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),
//   }
// }
//
//
// changePasswordWithNewPass(
//     String textRe, String text2New, String text3Old) async {
//   try {
//     Map<dynamic, dynamic> userData =
//     jsonDecode(PrefService.getString("UserData").toString())
//     as Map<dynamic, dynamic>;
//     String url = ApiEndPoint.changePassword;
//     Logger().d(userData);
//     http.Response? res = await HttpService.postApi(url: url, body: {
//       "old_password": text3Old,
//       "new_password": text2New,
//       "confirm_password": textRe,
//       "user_id": userData["user"]["id"].toString()
//     }, header: {
//       "Authorization": "Bearer ${userData['access_token']}"
//     });
//     if (res != null && res.statusCode == 200) {
//       Map<dynamic, dynamic> map =
//       jsonDecode(res.body) as Map<dynamic, dynamic>;
//       if (map['result'] == true) {
//         txtOldPassword.clear();
//         txtNewPassword.clear();
//         txtRePassword.clear();
//       }
//       showToast(map['message']);
//     } else {
//       showToast("something bad error code is :${res!.statusCode}");
//     }
//   } catch (ex, x) {
//     showToast(ex.toString());
//     kDebugMode ? Logger().e(x.toString() + ex.toString()) : "";
//   }
// }
//
// // void onTapSubmit() async {
// //   txtNewPassword.text;
// //   txtRePassword.text;
// //   if (key.currentState!.validate()) {
// //     if (isForgot) {} else {}
// //   }
