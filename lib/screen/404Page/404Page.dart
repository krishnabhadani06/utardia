import 'package:flutter/material.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.22),
          Image.asset(AssetsImagesRes.Image404),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(Strings.pageNotFound,
              style: robotoBoldTextStyle(fontSize: 20, color: ColorRes.black)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(Strings.thereIsNoPage,
              style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grey)),
          Text(Strings.youAreLooking,
              style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grey)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: materialButton(txtButton: Strings.goBack, onPressed: () {}),
          ),
        ],
      ),
    ));
    //     child: Scaffold(
    //   body: Column(
    //     children: [
    //       const SizedBox(height: 227),
    //       Image.asset(AssetsString.Image404),
    //       const SizedBox(height: 42),
    //       Text(
    //         Strings.pageNotFound,
    //         style: natoBoldTextStyle(fontSize: 20),
    //       ),
    //       const SizedBox(height: 8),
    //
    //       Text(
    //         Strings.thereIsNoPage,
    //         style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grayText),
    //       ),
    //       Text(
    //         Strings.youAreLooking,
    //         style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grayText) ,
    //       ),
    //       const SizedBox(height: 42),
    //       materialButton(txtButton: Strings.goBack, onPressed: () {}),
    //     ],
    //   ),
    // ));
  }
}
