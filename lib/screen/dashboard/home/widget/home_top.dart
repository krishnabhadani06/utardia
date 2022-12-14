
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/view_all_category/view_screen_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

import 'slider.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of <HomeProvider>(context);
    final provider2 = Provider.of <ViewAllCategoryProvider>(context);
    return provider.loader? const Center(child: CircularProgressIndicator(),):Column(
      children: [
        sliderHome(context: context),
        // sliderHome(imgPath: provider.bannerData[index].photo.toString(), context:context),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.showByCategory,
                style: robotoMediumTextStyle(fontSize: 14),
              ),
              TextButton(
                onPressed: () => provider2.onTapViewCategory(),
                child: Text(
                  Strings.viewAll,
                  style: robotoMediumTextStyle(color: ColorRes.grey, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
