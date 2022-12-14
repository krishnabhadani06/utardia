import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/screen/authorization/login/widgets/login_bottom.dart';
import 'package:utardia/screen/authorization/login/widgets/login_center.dart';
import 'package:utardia/util/image_res.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 58.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: deviceHeight * 0.25,
                  child: Image.asset(
                    AssetsImagesRes.loginUtradiyaImage,
                    // AssetsImagesRes.loginMainImage,
                    //fit: BoxFit.fill,
                  ),
                ),
                const LoginCenter(),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                const LoginBottom(),
              ],
            ),
          ),
          provider.loader == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox()
        ],
      ),
    ));
  }
}
