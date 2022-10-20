import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:http/http.dart' as http;
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class SplashProvider extends ChangeNotifier {
  List<String> wishListid = <String>[];

  void init() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      navigateToHomeScreen();
    });
    populateWishList();
  }

  // void navigateToHomeScreen()  {
  //   navigator.currentState!.pushReplacement(MaterialPageRoute(builder: (context) {
  //     return const LoginPage();
  //   }
  //   ));
  //
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => const RegisterPage(),
  //
  // }

  void navigateToHomeScreen() {
    if (PrefService.getBool(PrefKeys.isLogin)) {
      navigator.currentState!
          .pushReplacement(MaterialPageRoute(builder: (context) {
        Provider.of<HomeProvider>(context, listen: false).init();
        return const DashScreen();
      }));
      populateWishList();
    } else {
      navigator.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  void populateWishList() async {
    wishListid = await getWishList();
  }

  void wishListOperation(String pid, [bool isRemove = false]) async {
    if (wishListid.contains(pid)) {
      wishListid.remove(pid);
    } else {
      wishListid.add(pid);
    }

    notifyListeners();
    try {
      if (PrefService.getString(PrefKeys.uid) != "") {
        String url =
            "${isRemove ? ApiEndPoint.removeWishList : ApiEndPoint.addWishList}?product_id=${pid}&user_id=${PrefService.getString(PrefKeys.uid)}";
        http.Response? res = await HttpService.getApi(url: url);
        if (res!.statusCode == 200) {
          Map<dynamic, dynamic> map = jsonDecode(res.body);
          if (kDebugMode) {
            print("aaaaaaaaaaaaaaaaaaaa $map");
          }

          // ignore: use_build_context_synchronously
          // getWishList();

          Logger().e(jsonDecode(res.body));
          showToast(map['message']);
        } else {}
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
    notifyListeners();
  }
}

Future<List<String>> getWishList() async {
  try {
    String url =
        "${ApiEndPoint.getWishList}${PrefService.getString(PrefKeys.uid)}";
    http.Response? res = await HttpService.getApi(url: url);
    if (res != null && res.statusCode == 200) {
      Map<dynamic, dynamic> map = jsonDecode(res.body) as Map<dynamic, dynamic>;

      if (map['success'] && map['data'] != []) {
        List<dynamic> list = map['data'] as List<dynamic>;

        List<String> tempList =
            list.map((e) => e['product']['id'].toString()).toList();

        return tempList;
      }
    }
    return [];
  } catch (e, x) {
    kDebugMode ? Logger().e(e.toString() + x.toString()) : "";

    kDebugMode ? showToast(e.toString()) : "";
    return [];
  }
}
