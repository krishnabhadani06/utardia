import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/SinIn_Model/singin_model.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class SingInpApi {
  static Future<SingInModel?> singInWithEmailApi(
      String email, String password, BuildContext context) async {
    try {
      String url = ApiEndPoint.signIn;
      Map<String, dynamic> param = {
        "login_type": "email",
        "email_or_phone": email.toString(),
        "password": password,
        "identity_matrix": true.toString()
      };
      http.Response? response = await HttpService.postApi(
          url: url,
          body: param,
          header: {"X-Requested-With": "XMLHttpRequest"});
      if (response != null && response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        Fluttertoast.showToast(msg: "Login Successful.");
        await PrefService.setValue(PrefKeys.isLogin, true);
        await PrefService.setValue(
            PrefKeys.accessToken, responseJson["access_token"].toString());
        await PrefService.setValue(
            PrefKeys.uid, responseJson["user"]["id"].toString());
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          Provider.of<HomeProvider>(context, listen: false).init();
          return const DashScreen();
        }));
        return singInModelFromJson(response.body);
      } else {
        Fluttertoast.showToast(msg: "Enter valid email or password.");
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  static Future<SingInModel?> singInWithPhoneApi(
      {required String phone,
      required String password,
      required BuildContext context,
      required String country}) async {
    try {
      String url = ApiEndPoint.signIn;
      Map<String, dynamic> param = {
        "login_type": "phone",
        "country_code": country.replaceAll("+", ""),
        // "country_code": "+${country}",
        "email_or_phone": phone,
        "password": password,
        "identity_matrix": true.toString(),
      };
      Logger().e(param);
      http.Response? response = await HttpService.postApi(
          url: url,
          body: param,
          header: {"X-Requested-With": "XMLHttpRequest"});
      if (response != null && response.statusCode == 200) {
        Logger().e(jsonDecode(response.body));
        var responseJson = json.decode(response.body);
        Fluttertoast.showToast(msg: "Login Successful.");
        await PrefService.setValue(PrefKeys.isLogin, true);
        await PrefService.setValue(
            PrefKeys.accessToken, responseJson["access_token"].toString());
        await PrefService.setValue(
            PrefKeys.uid, responseJson["user"]["id"].toString());
        navigator.currentState!
            .pushReplacement(MaterialPageRoute(builder: (context) {
          Provider.of<HomeProvider>(context, listen: false).init();
          return const DashScreen();
        }));
        return singInModelFromJson(response.body);
      } else {
        Fluttertoast.showToast(msg: "Enter valid phone or password.");
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}

// class SingInpApi {
//   static Future<SingInModel?> singInApi(
//       String email, String password, BuildContext context) async {
//     try {
//       String url = ApiEndPoint.signIn;
//       Map<String, dynamic> param = {
//         // "email": email,
//
//         Provider.of<LoginProvider>(context, listen: false).isPhone == true
//             ? "Phone"
//             : "email": Provider.of<LoginProvider>(context, listen: false)
//             .isPhone
//             ? "${Provider.of<LoginProvider>(context, listen: false).currentCountry!.phoneCode}${Provider.of<LoginProvider>(context, listen: false).txtPhone.toString()}"
//             : email.toString(),
//
//         // "email_or_phone": Provider.of<LoginProvider>(context, listen: false)
//         //             .isPhone ==
//         //         true
//         //     ? "${Provider.of<LoginProvider>(context, listen: false).currentCountry!.phoneCode}${Provider.of<LoginProvider>(context, listen: false).txtPhone.toString()}}"
//         //     : email.toString(),
//         // "country_code": Provider.of<LoginProvider>(context, listen: false)
//         //     .currentCountry!
//         //     .phoneCode,
//         "password": password,
//         "identity_matrix": true.toString()
//       };
//       http.Response? response = await HttpService.postApi(
//           url: url,
//           body: param,
//           header: {"X-Requested-With": "XMLHttpRequest"});
//       if (response != null && response.statusCode == 200) {
//         var responseJson = json.decode(response.body);
//         // Fluttertoast.showToast(msg: response.body);
//         Fluttertoast.showToast(msg: "Login Successful.");
//         await PrefService.setValue(PrefKeys.isLogin, true);
//         await PrefService.setValue(
//             PrefKeys.accessToken, responseJson["access_token"].toString());
//         await PrefService.setValue(
//             PrefKeys.uid, responseJson["user"]["id"].toString());
//         navigator.currentState!
//             .pushReplacement(MaterialPageRoute(builder: (context) {
//           Provider.of<HomeProvider>(context, listen: false).init();
//           return DashScreen();
//         }));
//         return singInModelFromJson(response.body);
//       } else {
//         Fluttertoast.showToast(msg: "Enter valid email or password.");
//       }
//       return null;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//       return null;
//     }
//   }
// }
