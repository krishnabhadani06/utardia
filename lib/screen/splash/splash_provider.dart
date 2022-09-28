import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/pref_key.dart';

class SplashProvider extends ChangeNotifier {
  void init() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      navigateToHomeScreen();
    });
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
    } else {
      navigator.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
