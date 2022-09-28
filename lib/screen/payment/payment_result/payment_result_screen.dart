import 'package:flutter/material.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          Padding(
            padding: const EdgeInsets.only(left: 34.0, right: 71.92),
            child: Image.asset(AssetsImagesRes.paymentDoneImg),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            Strings.yourOrderHasBeen,
            style: natoBoldTextStyle(fontSize: 20, color: ColorRes.green),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            Strings.weHaveAcceptedOrder,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          Text(
            Strings.gettingReady,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child:
                materialButton(txtButton: Strings.trackOrder, onPressed: () {}),
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
