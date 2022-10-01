// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

class HomeCenter extends StatelessWidget {
  const HomeCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 10, right: 10),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 1.6),
        ),
        itemCount: provider.allHomeCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => provider.onTapCategory(index, context, ""),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Card(
                    shadowColor: ColorRes.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: CachedNetworkImage(
                        imageUrl:
                            provider.allHomeCategories[index].banner.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetsImagesRes.girl1)),
                    margin: const EdgeInsets.only(bottom: 5),
                    elevation: 4,
                    surfaceTintColor: ColorRes.lightGrey,
                  ),
                ),
                Text(
                  provider.allHomeCategories[index].name.toString(),
                  style: robotoSemiBoldTextStyle()
                      .copyWith(overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
