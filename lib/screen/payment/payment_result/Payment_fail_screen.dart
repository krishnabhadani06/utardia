import 'package:flutter/material.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class PaymentFailScreen extends StatelessWidget {
  const PaymentFailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.20),
          Image.asset(AssetsImagesRes.paymentFailImg),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            Strings.oopsOrder,
            style: natoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            Strings.somethingWentWrong,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child:
                materialButton(txtButton: Strings.tryAgain, onPressed: () {}),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.backHome,
                style: natoBoldTextStyle(fontSize: 16),
              )),
        ],
      ),
    ));
  }
}
