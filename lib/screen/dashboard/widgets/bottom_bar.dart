import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

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
              tab(IconRes.icHome, IconRes.ichome1, 0, context),
              tab(IconRes.icCategory, IconRes.icCategory1, 1, context),
              tab(IconRes.icCart, IconRes.icCart1, 2, context),
              tab(IconRes.icOffer, IconRes.icOffer1, 3, context),
              tab(IconRes.icProfile, IconRes.icProfile1, 4, context),
            ],
          ),
        );
      },
    );
  }
}

Widget tab(IconData icon1, IconData icon2, int index, BuildContext context) {
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
              index == provider.currentTab
                  ? Icon(icon2, color: ColorRes.white, size: 33)
                  : Icon(icon1, color: ColorRes.white, size: 33)
            ],
          ),
        ),
      ),
    );
  });
}
