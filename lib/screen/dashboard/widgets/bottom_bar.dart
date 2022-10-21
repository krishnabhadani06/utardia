import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (con, provider, widget) {
        return Container(
          height: 57,
          color: ColorRes.appBarColor,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              tab(Image.asset(AssetsImagesRes.homeIcon),
                  Image.asset(AssetsImagesRes.homeIcon1), 0, context),
              tab(Image.asset(AssetsImagesRes.categoryIcon),
                  Image.asset(AssetsImagesRes.categoryIcon1), 1, context),
              tab(Image.asset(AssetsImagesRes.cartIcon),
                  Image.asset(AssetsImagesRes.cartIcon1), 2, context),
              tab(Image.asset(AssetsImagesRes.campaignIcon),
                  Image.asset(AssetsImagesRes.campaignIcon1), 3, context),
              tab(Image.asset(AssetsImagesRes.profileIcon,),
                  Image.asset(AssetsImagesRes.profileIcon1), 4, context),
            ],
          ),
        );
      },
    );
  }
}

Widget tab(Image icon1, Image icon2, int index, BuildContext context) {
  return Consumer<DashboardProvider>(builder: (con, provider, widget) {
    return Expanded(
      child: InkWell(
        hoverColor: Colors.grey,
        // splashColor: Colors.transparent,
        // focusColor: ColorRes.,
        // highlightColor: ColorRes.lightGrey,
        onTap: () => provider.onBottomBarChange(index, context),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: index == provider.currentTab ? icon2 : icon1,
              ),

              // ? Icon(icon2, color: ColorRes.white, size: 33)
              // : Icon(icon1, color: ColorRes.white, size: 33)
            ],
          ),
        ),
      ),
    );
  });
}
