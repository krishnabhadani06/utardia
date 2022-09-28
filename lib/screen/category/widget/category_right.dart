import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

import '../../../common/helper.dart';
import 'category_product_card.dart';

class CategoryRight extends StatefulWidget {
  const CategoryRight({Key? key}) : super(key: key);

  @override
  State<CategoryRight> createState() => _CategoryRightState();
}

class _CategoryRightState extends State<CategoryRight> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Provider.of<CategoryProvider>(context, listen: false)
              .allHomeCategories
              .length !=
          0) {
        // Provider.of<CategoryProvider>(context, listen: false)
        //     .getSubCategoryData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<HomeProvider>(context);
    final provider = Provider.of<CategoryProvider>(context);
    final provider1 = Provider.of<ProductDetailsProvider>(context);
    return Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(top: 11.0),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: provider2.allHomeCategories.length,
            //scrollDirection: Axis.vertical,
            controller: provider.pageCon,
            onPageChanged: (n) async => provider.currentSelect(n),
            itemBuilder: (context, index) {
              return provider.loader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(), // important
                      child: Container(
                        // color: Colors.blue,
                        color: Colors.white12,
                        // height: 480,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                provider2.allHomeCategories[index].name
                                    .toString(), //pageview data
                                style: natoMediumTextStyle(
                                    fontSize: 14, color: ColorRes.grey),
                              ),
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.5,
                                mainAxisSpacing: 0.5,
                                childAspectRatio: 0.8,
                                // (deviceWidth) / (deviceHeight * 0.58),
                              ),
                              itemCount: provider.categoryProducts == null
                                  ? 0
                                  : provider.categoryProducts!.data!.length,
                              itemBuilder: (context, index1) {
                                return categoryProductCard(
                                  context: context,
                                  index: index1,
                                  strokedPrice: provider.categoryProducts!
                                      .data![index1].strokedPrice!,
                                  mainPrice: provider.categoryProducts!
                                      .data![index1].mainPrice!,
                                  image: provider.categoryProducts!
                                      .data![index1].thumbnailImage!,
                                  name: provider
                                      .categoryProducts!.data![index1].name!,
                                  gro: provider.categoryProducts!.data![index1]
                                      .isGrocery!,
                                  rate: provider
                                      .categoryProducts!.data![index1].rating!
                                      .toString(),
                                  url: provider.categoryProducts!.data![index1]
                                      .links!.details
                                      .toString(),
                                  productUrl: provider2
                                      .allHomeCategories[index].links!.products
                                      .toString(),
                                  islike: provider.wishListId.contains(provider
                                      .categoryProducts!.data![index1].id
                                      .toString()),
                                  id: provider
                                      .categoryProducts!.data![index1].id
                                      .toString(),
                                  onTap: () {
                                    provider1.onTapProductDetails(
                                        index1,
                                        provider.categoryProducts!.data![index1]
                                            .links!.details
                                            .toString(),
                                        context,
                                        provider
                                            .categoryProducts!.data![index1].id
                                            .toString());
                                  },
                                );
                              },
                            ),
                            SizedBox(height: deviceHeight * 0.01),
                            Row(
                              children: [
                                Text(
                                  "Sub Category",
                                  style: natoSemiBoldTextStyle(
                                      fontSize: 12, color: ColorRes.grey),
                                ),
                              ],
                            ),
                            Container(
                              height: deviceHeight * 0.25,
                              width: deviceWidth,
                              //color: ColorRes.yellow,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      provider.allHomeSubCategories != null
                                          ? provider.allHomeSubCategories!.data!
                                              .length
                                          : 0,
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
                                              imageUrl: provider
                                                  .allHomeSubCategories!
                                                  .data![index1]
                                                  .banner
                                                  .toString(),
                                              //imageUrl: provider.allHomeCategories[index].banner.toString(),
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                AssetsImagesRes.girl1,
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Text(provider.allHomeSubCategories!
                                              .data![index1].name
                                              .toString()),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ));
  }
}
