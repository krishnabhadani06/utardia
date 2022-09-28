import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/view_all_category/view_screen_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

class ViewCenterScreen extends StatelessWidget {
  const ViewCenterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final provider2 = Provider.of<ViewAllCategoryProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 10, right: 10),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.6),
        ),
        itemCount: provider.allCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => provider.onTapViewProduct(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceWidth * 0.30,
                  width: deviceWidth * 0.30,
                  child: Card(
                    shadowColor: ColorRes.black.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.only(bottom: 5),
                    elevation: 4,
                    surfaceTintColor: ColorRes.lightGrey,
                    child: CachedNetworkImage(
                        imageUrl:
                            provider.allCategories[index].banner.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetsImagesRes.girl1)),
                  ),
                ),
                Text(
                  provider.allCategories[index].name.toString(),
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
