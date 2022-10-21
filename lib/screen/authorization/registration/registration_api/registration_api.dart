// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/SignUp_Model/signup_model.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class SingUpApi {
  static Future<SingUpModel?> singUpApi(
      {required BuildContext context,
      required String email,
      required String phone,
      required String password,
      required String retypePassword,
      required String cCode,
      required bool isPhone}) async {
    try {
      String url = ApiEndPoint.signUp;
      Map<String, String> param = {
        "name": "ram",
        "email_or_phone": isPhone == true ? phone : email,
        "country_code": cCode,
        "password": password,
        "passowrd_confirmation": retypePassword,
        "register_by": isPhone == true ? "phone" : "email",
      };

      Logger().e(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: param,
          header: {"X-Requested-With": "XMLHttpRequest"});
      if (response != null && response.statusCode == 201) {
        Fluttertoast.showToast(msg: response.body);

        var res = jsonDecode(response.body);

        if (kDebugMode) {
          print("*****************************${res['user_id']}");
        }
        Logger().e(jsonDecode(response.body));
        if (res['user_id'] != 0) {
          navigator.currentState!
              .pushReplacement(MaterialPageRoute(builder: (context) {
            Provider.of<OtpProvider>(context, listen: false).startTimer();
            Provider.of<OtpProvider>(context, listen: false).uid =
                res['user_id'].toString();
            Provider.of<OtpProvider>(context, listen: false).isForgot = false;
            return const OtpReceiverScreen();
          }));
        }

        return singUpModelFromJson(response.body);
      }
      return null;
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<Map<dynamic, dynamic>> conformCode(
      String uid, String code) async {
    try {
      String url = ApiEndPoint.conformCode;
      Map<String, String> param = {
        "user_id": uid,
        "verification_code": code,
      };
      Logger().e(param);
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print("true condition");
        }

        Fluttertoast.showToast(msg: response.body);
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

  static Future<Map<dynamic, dynamic>> reSendApi(
      String uid, bool isPhone) async {
    try {
      String url = ApiEndPoint.reSendOtp;
      Map<String, String> param = {
        "user_id": uid,
        "register_by": isPhone == true ? "Phone" : "email",
      };
      Logger().e(param);
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);
      if (response.statusCode == 200) {
        Logger().e(jsonDecode(response.body));
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print("true condition");
        }
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const OtpReceiverScreen();
        }));
        Fluttertoast.showToast(msg: "Your code is reSent SuccessFully");
        // Fluttertoast.showToast(msg: response.body);
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
  static Future<void> sendForgotRequestAgain(
      {required String phone, String? email, required bool isPhone}) async {
    try {
      String url = ApiEndPoint.reSendOtp;
      Map<String, String> param = {
        "email_or_phone": isPhone ? phone : email!,
        "verify_by": isPhone ? "phone" : "email"
      };
      Logger().e(param);
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);
      if (response.statusCode == 200) {
        Logger().e(jsonDecode(response.body));
        if (kDebugMode) {
          print(response.body);
        }
        if (kDebugMode) {
          print("true condition");
        }
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const OtpReceiverScreen();
        }));

        Fluttertoast.showToast(msg: response.body);
        return jsonDecode(response.body);
      } else {
        Fluttertoast.showToast(msg: response.body.toString());
        // return {};
      }
    } on SocketException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // return {};
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // return {};
    }
  }
}
