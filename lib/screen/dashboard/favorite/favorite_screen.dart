import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../../../util/icon_res.dart';

class FavoriteScreen extends StatelessWidget {
  int index1;
  FavoriteScreen({super.key, required this.index1});

  @override
  Widget build(BuildContext context) {
    final provider1 = Provider.of<ProductDetailsProvider>(context);
    final provider2 = Provider.of<HomeProvider>(context);
    // final provider = Provider.of<FavoriteProvider>(context);
    return Consumer<FavoriteProvider>(builder: (con, provider, widget) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorRes.appBarColor,
            leading: GestureDetector(
              child: Icon(IconRes.icBack, size: 30),
              onTap: () {
                navigator.currentState!.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(Strings.favorite, style: TextStyle(fontSize: 22)),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: provider.Wishlist2 != null
                  ? provider.loader == true && provider.Wishlist2!.data!.isEmpty
                      ? commonLoader()
                      : provider.loader == false &&
                              provider.Wishlist2!.data!.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.12),
                                Image.asset(AssetsImagesRes.favouriteImage),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                Text(
                                  Strings.yourHeartIsEmpty,
                                  style: natoBoldTextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Text(
                                  Strings.startFallInLove,
                                  style: natoMediumTextStyle(
                                      fontSize: 16, color: ColorRes.grayText),
                                ),
                                Text(
                                  Strings.goods,
                                  style: natoMediumTextStyle(
                                      fontSize: 16, color: ColorRes.grayText),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: materialButton(
                                      txtButton: Strings.startShopping,
                                      onPressed: () =>
                                          provider.onTapShopping()),
                                ),
                              ],
                            )
                          // ? Text("NO Any Favr")
                          : GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15.0,
                                mainAxisSpacing: 8.0,
                                childAspectRatio:
                                    deviceWidth / (deviceHeight * 0.68),
                              ),
                              itemCount: provider.Wishlist2!.data!.isEmpty
                                  ? 4
                                  : provider.Wishlist2!.data!.length,
                              itemBuilder: (context, index) {
                                // print(fruit[index]['counter'].toString());
                                // fashion[i].counter == 0
                                //     ? provider.quality = false
                                //     : provider.quality = true;
                                return Container(
                                  margin: const EdgeInsets.only(
                                      left: 3.0,
                                      right: 3.0,
                                      top: 7.0,
                                      bottom: 7.0),
                                  // height: 215,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
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
                                  child: GestureDetector(
                                    onTap: () {
                                      provider1.onTapProductDetails(
                                          index,
                                          provider2.allHomeTopProducts[index1]
                                              .data![index].links!.details
                                              .toString(),
                                          context,
                                          provider2.allHomeTopProducts[index1]
                                              .data![index].id
                                              .toString());
                                    },
                                    // onTap: () => widget.onTap(widget.index!, widget.url!),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: deviceHeight * 0.17,
                                                width: deviceWidth,
                                                child: CachedNetworkImage(
                                                    imageUrl: provider
                                                        .Wishlist2!
                                                        .data![index ?? 0]
                                                        .product!
                                                        .thumbnailImage
                                                        .toString(),
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        SizedBox(
                                                            child: CircularProgressIndicator(
                                                                value: downloadProgress
                                                                    .progress)),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                                AssetsImagesRes
                                                                    .girl1)),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 6.0,
                                                                right: 5.0),
                                                        child: Container(
                                                          height: 25,
                                                          width: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                ColorRes.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.20),
                                                                blurRadius: 5,
                                                                offset:
                                                                    Offset.zero,
                                                                spreadRadius: 0,
                                                              ),
                                                            ],
                                                          ),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                ColorRes.white,
                                                            radius: 15,
                                                            child: Center(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    provider.removeWishList(
                                                                        context,
                                                                        provider
                                                                            .Wishlist2!
                                                                            .data![index!]
                                                                            .id
                                                                            .toString());
                                                                  },
                                                                  child:
                                                                      const Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color:
                                                                        ColorRes
                                                                            .red,
                                                                    size: 18,
                                                                  )),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // SizedBox(height: deviceHeight * 0.01),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
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
                                              SizedBox(
                                                  height: deviceHeight * 0.006),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0),
                                                child: Text(
                                                  index == null
                                                      ? Strings.anglesMaluZip
                                                      : provider
                                                          .Wishlist2!
                                                          .data![index ?? 0]
                                                          .product!
                                                          .name
                                                          .toString(),
                                                  style: robotoMediumTextStyle(
                                                      color: ColorRes.greyDark,
                                                      fontSize: 12),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              SizedBox(
                                                height: deviceHeight * 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    height: 22,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      color: ColorRes.yellow,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          provider
                                                              .Wishlist2!
                                                              .data![index ?? 0]
                                                              .product!
                                                              .rating
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color: ColorRes
                                                                  .white,
                                                              fontSize: 12),
                                                        ),
                                                        const Icon(
                                                          Icons.star,
                                                          color: ColorRes.white,
                                                          size: 15,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  // const Spacer(),
                                                  Text(
                                                    Strings.tops,
                                                    style:
                                                        robotoSemiBoldTextStyle(
                                                            color:
                                                                ColorRes.grey,
                                                            fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: deviceHeight * 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    index == null
                                                        ? Strings.rs3800
                                                        : "Rs.${provider.Wishlist2!.data![index ?? 0].product!.basePrice.toString()}",
                                                    style: robotoBoldTextStyle(
                                                            fontSize: 15)
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                      index == null
                                                          ? Strings.rs3800
                                                          : "Rs.${provider.Wishlist2!.data![index ?? 0].product!.basePrice.toString()}",
                                                      style: TextStyle(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: ColorRes
                                                                  .clrFont
                                                                  .withOpacity(
                                                                      0.7))
                                                          .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                  const Spacer(),
                                                  Text(
                                                    index != null
                                                        ? Strings.off57
                                                        : provider
                                                            .Wishlist2!
                                                            .data![index ?? 0]
                                                            .product!
                                                            .basePrice
                                                            .toString(),
                                                    style: robotoBoldTextStyle(
                                                            fontSize: 8,
                                                            color: ColorRes
                                                                .darkGreen)
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ],
                                              ),
                                              // SizedBox(
                                              //   height: deviceHeight * 0.01,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                // return FavoriteCenter(
                                //   index: i,
                                // );
                              },
                            )
                  : commonLoader()),
        ),
      );
    });
  }
}
