import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/splash/splash_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    Provider.of<SplashProvider>(context).init();

    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorRes.white,
            body: SizedBox(
                // height: deviceHeight * 0.95,
                width: deviceWidth,
                child: Image.asset(
                  AssetsImagesRes.splashScreenImage,
                  fit: BoxFit.fill,
                ))));
  }
}
