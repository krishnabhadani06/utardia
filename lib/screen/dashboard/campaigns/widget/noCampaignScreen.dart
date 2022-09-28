import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class NoCampaignScreen extends StatelessWidget {
  const NoCampaignScreen({Key? key}) : super(key: key);

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
            navigator.currentState!.pop();
            // Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title:
            const Text(Strings.campaignsTitle, style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.18),
          Padding(
            padding: const EdgeInsets.only(left: 64.0, right: 61.0),
            child: Image.asset(AssetsImagesRes.noCampaignImage),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            Strings.noCampaignFound,
            style: natoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Text(
            Strings.noWorries,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          Text(
            Strings.ourCampaigns,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
        ],
      ),
    ));
  }
}
