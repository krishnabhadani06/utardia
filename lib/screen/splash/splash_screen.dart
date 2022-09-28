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
            body: Container(
                // height: deviceHeight * 0.95,
                width: deviceWidth,
                child: Image.asset(
                  AssetsImagesRes.splashScreenImage,
                  fit: BoxFit.fill,
                ))));
  }
}
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Padding(
// padding: EdgeInsets.only(
// left: deviceWidth * 0.1, right: deviceWidth * 0.1),
// child: Image.asset(
// AssetsImagesRes.loginMainImage,
// fit: BoxFit.fill,
// height: deviceHeight * 0.17,
// width: deviceWidth,
// ),
// ),
// SizedBox(height: deviceHeight * 0.02),
// Padding(
// padding: EdgeInsets.only(
// left: deviceWidth * 0.05, right: deviceWidth * 0.05),
// child: Text(
// '"WE BELIEVE THAT QUALITY IS THE SOUL OF AN ENTERPRISE!"',
// style:
// robotoSemiBoldTextStyle(color: ColorRes.blue, fontSize: 24),
// textAlign: TextAlign.center,
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// left: deviceWidth * 0.05, right: deviceWidth * 0.05),
// child: Text(
// 'Maybe we are not Providing the Cheap Rate',
// style: natoRegularTextStyle(color: ColorRes.blue, fontSize: 24),
// textAlign: TextAlign.center,
// ),
// ),
// ],
// ),
