import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class NoCardScreen extends StatelessWidget {
  const NoCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.appBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 30),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(Strings.myCard, style: TextStyle(fontSize: 22)),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              IconRes.icPlus,
              size: 45,
            ),
          ),
          SizedBox(width: deviceWidth / 45),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.16),
          Padding(
            padding: const EdgeInsets.only(left: 78.0, right: 77.72),
            child: Image.asset(AssetsImagesRes.noCardImage),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            Strings.noSavedCard,
            style: natoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            Strings.saveYourCardInfo,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          Text(
            Strings.purchaseEasier,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
        ],
      ),
    ));
  }
}
