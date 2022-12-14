import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/SignUp_Model/signup_model.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_screen.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class SingUpApi {
  static Future<SingUpModel?> singUpApi(BuildContext context, String email,
      String password, String retypePassword) async {
    try {
      String url = ApiEndPoint.signUp;
      Map<String, String> param = {
        "name": "ram",
        "email_or_phone": email.toString(),
        "password": password.toString(),
        "passowrd_confirmation": retypePassword.toString(),
        "register_by": "email"
      };
      http.Response? response = await HttpService.postApi(
          url: url,
          body: param,
          header: {"X-Requested-With": "XMLHttpRequest"});
      if (response != null && response.statusCode == 201) {
        Fluttertoast.showToast(msg: "Registration Successful.");
        var res = jsonDecode(response.body);
        print("*****************************${res['user_id']}");
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          Provider.of<OtpProvider>(context, listen: false).uid =
              res['user_id'].toString();
          Provider.of<OtpProvider>(context, listen: false).isForgot = false;
          return const OtpReceiverScreen();
        }));
        return singUpModelFromJson(response.body);
      }
      return null;
    } catch (e) {
      print(e);
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
      http.Response? response = await http.post(Uri.parse(url),
          headers: {"X-Requested-With": "XMLHttpRequest"}, body: param);

      if (response.statusCode == 200) {
        print(response.body);
        print("true condition");
        Fluttertoast.showToast(msg: "Verified SuccsessFully");
        navigator.currentState!.pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()));
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
