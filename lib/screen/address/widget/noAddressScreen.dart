import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class NoAddressScreen extends StatelessWidget {
  const NoAddressScreen({Key? key}) : super(key: key);

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
          child: Icon(IconRes.icBack, size: 30),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(Strings.myAddresses, style: TextStyle(fontSize: 22)),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.17),
          Padding(
            padding: const EdgeInsets.only(left: 77.0, right: 76.18),
            child: Image.asset(AssetsImagesRes.noAddressImage),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Text(
            Strings.noSavedAddress,
            style: natoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            Strings.saveYourAddress,
            style: natoMediumTextStyle(fontSize: 16),
          ),
          Text(
            Strings.useItAll,
            style: natoMediumTextStyle(fontSize: 16),
          ),
        ],
      ),
    ));
  }
}

// body: Column(
// children: [
// SizedBox(height: MediaQuery.of(context).size.height * 0.17),
// Padding(
// padding: const EdgeInsets.only(left: 77.0,right:76.18 ),
// child: Image.asset(AssetsString.noAddressImage),
// ),
//
// SizedBox(height:MediaQuery.of(context).size.height * 0.04),
// Text(Strings.noSavedAddress,style:robotoBoldTextStyle(fontSize: 20,color: ColorRes.black)),
//
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// Text(Strings.saveYourAddress,style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grey)),
// Text(Strings.useItAll,style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grey)),
// ],
// ),
