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
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_proivder.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_screen.dart';
import 'package:utardia/util/api_endpoints.dart';

class ForgotPasswordApi {
  static Future<Map<dynamic, dynamic>> forgotPassword(
      BuildContext context, String email, String phone, bool isPhone) async {
    try {
      String url = ApiEndPoint.forgotPassword;
      Map<String, String> param = {
        "email or phone": Provider.of<ForgotPasswordProvider>(context,
                        listen: false)
                    .isPhone ==
                true
            ? "${Provider.of<ForgotPasswordProvider>(context, listen: false).currentCountry!.phoneCode}${phone.toString()}"
            : email.toString(),
        "send_code_by": isPhone == true ? "Phone" : "email",
        // "send_code_by": "email",
      };
      Logger().e(param);
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);
      if (response.statusCode == 200) {
        Logger().e(jsonDecode(response.body));
        if (kDebugMode) {
          print(response.body);
        }
        Fluttertoast.showToast(msg: "Code is sent Successfully");
        // Fluttertoast.showToast(msg: response.body.toString());
        if (jsonDecode(response.body)['result']) {
          // Provider.of<OtpProvider>(context, listen: false).isForgot = true;
          navigator.currentState!
              .pushReplacement(MaterialPageRoute(builder: (context) {
            Provider.of<OtpProvider>(context, listen: false).startTimer();
            Provider.of<OtpProvider>(context, listen: false).isForgot = true;
            return const OtpReceiverScreen();
          }));
        }
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
