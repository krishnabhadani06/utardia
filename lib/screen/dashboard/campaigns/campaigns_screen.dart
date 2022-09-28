import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/dashboard/home/widget/slider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/sliderCampaign_screen.dart';

class CampaingScreen extends StatelessWidget {
  const CampaingScreen({Key? key}) : super(key: key);

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
              if (navigator.currentState!.canPop()) {
                navigator.currentState!.pop();
              } else {
                Provider.of<DashboardProvider>(context, listen: false)
                    .onBottomBarChange(0, context);
              }
            },
          ),
          centerTitle: true,
          title: Text(Strings.campaignsTitle,
              style: ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: [
                Image.asset(AssetsImagesRes.buy2GetFreeImage),
                SizedBox(height: deviceHeight / 45),

                // sliderHome(imgPath: AssetsImagesRes.sliderHome),
                sliderHome(context: context),
                SizedBox(height: deviceHeight / 50),

                sliderCampaign(
                  imgSliderPath: AssetsImagesRes.saleValentiveDayImage,
                ),
                SizedBox(height: deviceHeight / 55),
                Image.asset(AssetsImagesRes.bigSale),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
