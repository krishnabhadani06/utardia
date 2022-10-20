import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/category/product_details/product_details_screen.dart';
import 'package:utardia/screen/category/product_list_screen/product_list_provider.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/splash/splash_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class ProductListScreen extends StatelessWidget {
  String? title;
  ProductListScreen({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String? id;
    final provider = Provider.of<ProductListProvider>(context);
    final provider1 = Provider.of<ProductDetailsProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.appBarColor,
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            if (navigator.currentState!.canPop() == true) {
              navigator.currentState!.pop();
            } else {
              Provider.of<DashboardProvider>(context, listen: false)
                  .onBottomBarChange(0, context);
            }
          },
        ),
        centerTitle: true,
        title: Text(title!, style: TextStyle(fontSize: 20)),
        // title: const Text(Strings.productList, style: TextStyle(fontSize: 20)),
      ),
      body: provider.loader == true
          ? commonLoader()
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0.5,
                        mainAxisSpacing: 0.5,
                        childAspectRatio: 12 / 16,
                      ),
                      itemCount: provider.productList!.data!.length,
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorRes.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.20),
                                  blurRadius: 5,
                                  offset: Offset.zero,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                provider1.onTapProductDetails(
                                    index1,
                                    provider.productList!.data![index1].links!
                                        .details!
                                        .toString(),
                                    context,
                                    provider.productList!.data![index1].id
                                        .toString());
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: deviceHeight * 0.24,
                                            width: deviceWidth,
                                            child: CachedNetworkImage(
                                                imageUrl: provider
                                                    .productList!
                                                    .data![index1]
                                                    .thumbnailImage!,
                                                // imageUrl: image!,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        SizedBox(
                                                            height: 40,
                                                            width: 40,
                                                            child: Center(
                                                              child: CircularProgressIndicator(
                                                                  value: downloadProgress
                                                                      .progress),
                                                            )),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        AssetsImagesRes.girl1)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 25,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: ColorRes.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.20),
                                                            blurRadius: 5,
                                                            offset: Offset.zero,
                                                            spreadRadius: 0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            ColorRes.white,
                                                        radius: 15,
                                                        child: Center(child:
                                                            Consumer<
                                                                    SplashProvider>(
                                                                builder:
                                                                    (context,
                                                                        con,
                                                                        child) {
                                                          return InkWell(
                                                              onTap: () {
                                                                con.wishListOperation(
                                                                    provider
                                                                        .productList!
                                                                        .data![
                                                                            index1]
                                                                        .id
                                                                        .toString(),
                                                                    con.wishListid.contains(provider
                                                                            .productList!
                                                                            .data![index1]
                                                                            .id
                                                                            .toString())
                                                                        ? true
                                                                        : false);
                                                              },
                                                              child: Icon(
                                                                Icons.favorite,
                                                                color: con.wishListid.contains(provider
                                                                        .productList!
                                                                        .data![
                                                                            index1]
                                                                        .id
                                                                        .toString())
                                                                    ? ColorRes
                                                                        .red
                                                                    : ColorRes
                                                                        .grey,
                                                                size: 18,
                                                              ));
                                                        })),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: deviceHeight *
                                                            0.01),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        SizedBox(height: deviceHeight * 0.006),
                                        SizedBox(
                                          width: deviceWidth * 0.36,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 4.0),
                                            child: Text(
                                              provider.productList!
                                                  .data![index1].name!,
                                              // name!,
                                              style: robotoMediumTextStyle(
                                                  color: ColorRes.greyDark,
                                                  fontSize: 12),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: deviceHeight * 0.01),
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10.0),
                                              height: 22,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                color: ColorRes.yellow,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    // rate!,
                                                    provider.productList!
                                                        .data![index1].rating!
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: ColorRes.white,
                                                        fontSize: 12),
                                                  ),
                                                  const Icon(
                                                    Icons.star,
                                                    color: ColorRes.white,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // const Spacer(),
                                            Text(
                                              Strings.tops,
                                              style: robotoSemiBoldTextStyle(
                                                  color: ColorRes.grey,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: deviceHeight * 0.01),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                provider.productList!
                                                    .data![index1].mainPrice!
                                                    .toString(),
                                                // mainPrice!.toString(),
                                                style: robotoBoldTextStyle(
                                                    fontSize: 12),
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                provider.productList!
                                                    .data![index1].strokedPrice!
                                                    .toString(),
                                                // strokedPrice!.toString(),
                                                style: robotoBoldTextStyle(
                                                        fontSize: 10,
                                                        color: ColorRes.clrFont
                                                            .withOpacity(0.7))
                                                    .copyWith(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  overflow: TextOverflow.fade,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                Strings.off57,
                                                style: natoMediumTextStyle(
                                                    color: ColorRes.darkGreen,
                                                    fontSize: 7.3),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ),
                                      ],
                                    ),
                                    //],
                                  ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          // child: Container(
                          //   decoration: const BoxDecoration(
                          //       color: ColorRes.yellow,
                          //       borderRadius:
                          //           BorderRadius.all(Radius.circular(10.0))),
                          //   child: Column(
                          //     children: [
                          //       Container(
                          //         height: deviceHeight * 0.15,
                          //         width: deviceWidth,
                          //         // color: ColorRes.white,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        );
                      }),
                )
              ],
            ),
    ));
  }
}
