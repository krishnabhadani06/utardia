import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/view_all_category/view_screen_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';

import 'view_product_card.dart';

class ViewProductScreen extends StatelessWidget {
  int index;
  ViewProductScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewAllCategoryProvider>(context);
    final provider2 = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            navigator.currentState!.pop();
            // Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(provider2.allCategories[index].name.toString(),
            style: const TextStyle(fontSize: 22)),
      ),
      body: provider.loader == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.5,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: deviceWidth / (deviceHeight * 0.76),
                    ),
                    itemCount:
                        provider2.allCategoriesProducts[index].data!.length,
                    //itemCount: provider.homeViewCategoryProduct==null?0:provider.homeViewCategoryProduct!.data!.length,
                    itemBuilder: (context, index1) {
                      return viewCategoryProductCard(
                        context: context,
                        index: index1,
                        strokedPrice: provider2.allCategoriesProducts[index]
                            .data![index1].strokedPrice!,
                        mainPrice: provider2.allCategoriesProducts[index]
                            .data![index1].mainPrice!,
                        image: provider2.allCategoriesProducts[index]
                            .data![index1].thumbnailImage!,
                        name: provider2
                            .allCategoriesProducts[index].data![index1].name!,
                        gro: provider2.allCategoriesProducts[index]
                            .data![index1].isGrocery!,
                        url: provider2.allCategoriesProducts[index]
                            .data![index1].links!.details
                            .toString(),
                      );
                    },
                  ),
                  Container(
                    height: deviceHeight * 0.25,
                    width: deviceWidth,
                    //color: ColorRes.yellow,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // itemCount:provider.allHomeSubCategories!.data!.length,
                        itemBuilder: (context, index1) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            height: 50,
                            width: 100,
                            color: ColorRes.white,
                            child: Column(
                              children: [
                                Container(
                                  height: deviceHeight * 0.15,
                                  // color: ColorRes.blue,
                                  child: CachedNetworkImage(
                                    imageUrl: "",
                                    //imageUrl: provider.allHomeCategories[index].banner.toString(),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      AssetsImagesRes.girl4,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text("data"),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
