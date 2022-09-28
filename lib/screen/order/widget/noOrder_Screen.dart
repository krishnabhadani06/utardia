import 'package:flutter/material.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

import '../../../common/text_styles.dart';

class NoOrderScreen extends StatelessWidget {
  const NoOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(Strings.orders, style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
          ),
          //Image.asset(AssetsString.noOrderImage),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Text(
            Strings.noOrder,
            style: robotoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            Strings.orderedYet,
            style:
                robotoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: materialButton(
                txtButton: Strings.startShopping, onPressed: () {}),
          ),
        ],
      ),
    ));
  }
}
