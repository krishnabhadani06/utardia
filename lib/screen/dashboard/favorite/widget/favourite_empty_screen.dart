import 'package:flutter/material.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class FavouriteEmptyScreen extends StatelessWidget {
  const FavouriteEmptyScreen({Key? key}) : super(key: key);
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
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(Strings.favourites, style: TextStyle(fontSize: 22)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          Image.asset(AssetsImagesRes.favouriteImage),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Text(
            Strings.yourHeartIsEmpty,
            style: natoBoldTextStyle(fontSize: 20),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            Strings.startFallInLove,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          Text(
            Strings.goods,
            style: natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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

// body: Column(
// children: [
// SizedBox(height:117),
// Image.asset(AssetsString.favouriteImage),
//
// SizedBox(height:34.11),
// Text(Strings.yourHeartIsEmpty,style:robotoBoldTextStyle(fontSize: 20,color: ColorRes.black)),
//
// SizedBox(height: 8),
// Text(Strings.startFallInLove,style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grey)),
// Text(Strings.goods,style: natoMediumTextStyle(fontSize: 16,color: ColorRes.grey)),
//
// SizedBox(height: 42),
// materialButton(txtButton: Strings.startShopping, onPressed: (){}),
// ],
// ),
