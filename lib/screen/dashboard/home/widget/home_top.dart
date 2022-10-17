import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

import 'slider.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    // final provider2 = Provider.of<ViewAllCategoryProvider>(context);
    return provider.loader
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              sliderHome(context: context),
              // sliderBottomHome(
              //     context: context, sliderImage: provider.sliderImage),

              // sliderHome(imgPath: provider.bannerData[index].photo.toString(), context:context),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.showByCategory,
                      style: robotoMediumTextStyle(
                              fontSize: 15,
                              color: ColorRes.greyTextHome.withOpacity(0.8))
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      // onPressed: () {},
                      onPressed: () => provider.onTapViewCategory(context),
                      child: Text(
                        Strings.viewAll,
                        style: robotoMediumTextStyle(
                                color: ColorRes.textBlue, fontSize: 15)
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
