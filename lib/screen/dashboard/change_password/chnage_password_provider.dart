// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:http/http.dart" as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';
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

  /* void onTapSubmit() async {
    oldPasswordValidation.toString();
    newPasswordValidation.toString();
    rePasswordValidation.toString();
    if (isForgot == true) {
      errorOldPassword == null &&
          errorNewPassword == null &&
          errorReNewPassword == null;
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
  }*/

  void onTapSubmit(BuildContext context) {
    if (isForgot) {
      newPasswordValidation.toString();
      rePasswordValidation.toString();
      // phoneValidation();
      if (errorNewPassword == null && errorReNewPassword == null) {
        resetPassword(txtNewPassword.text, otp.toString()).then((value) => {
              print(value),
              if (value["result"] == true)
                {
                  navigator.currentState!
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  })),
                }
            });
      } else {}
    } else {
      oldPasswordValidation.toString();
      newPasswordValidation.toString();
      rePasswordValidation.toString();
      // phoneValidation();
      if (errorOldPassword == null &&
          errorNewPassword == null &&
          errorReNewPassword == null) {
        changePasswordWithNewPass(
            txtRePassword.text, txtNewPassword.text, txtOldPassword.text);
      } else {}
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
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
        // "Authorization": "Bearer ${userData['access_token']}"
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

  static Future<Map<dynamic, dynamic>> resetPassword(
      String password, String code) async {
    try {
      String url = ApiEndPoint.resetPassword;
      Map<String, String> param = {
        // "user_id": uid,
        "verification_code": code,
        "password": password
      };
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print("true condition");
        }
        Fluttertoast.showToast(msg: "password Change SuccessFully");
        // Fluttertoast.showToast(msg: response.body);
        // navigator.currentState!.pushReplacement(
        //     MaterialPageRoute(builder: (context) => const LoginPage()));
        return jsonDecode(response.body);
      } else {
        Fluttertoast.showToast(msg: response.body.toString());
        return {};
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
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
