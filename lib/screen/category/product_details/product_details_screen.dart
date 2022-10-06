import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/product_details/widget/product_details_bottom.dart';
import 'package:utardia/screen/category/product_details/widget/product_detials_center.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

import 'product_details_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    // final provider1 = Provider.of<FavoriteProvider>(context);
    return Consumer<ProductDetailsProvider>(builder: (context, pro, x) {
      return WillPopScope(
        onWillPop: () async {
          Provider.of<ProductDetailsProvider>(context, listen: false)
              .onTapClose();
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorRes.appBarColor,
              leading: GestureDetector(
                child: Icon(IconRes.icBack, size: 30),
                onTap: () {
                  // navigator.currentState!.pushReplacement(
                  //     MaterialPageRoute(builder: (context) => const CategoryScreen()));
                  Provider.of<ProductDetailsProvider>(context, listen: false)
                      .onTapClose();
                },
              ),
              centerTitle: true,
              title: Text(Strings.productDetails,
                  style:
                      ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white)),
            ),
            body: pro.loader
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                margin: EdgeInsets.zero,
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      ImageSlideshow(
                                        width: double.infinity,
                                        height: deviceHeight * 0.30,
                                        initialPage: 0,
                                        indicatorColor: ColorRes.appBarColor,
                                        indicatorBackgroundColor: Colors.grey,
                                        onPageChanged: (value) {
                                          if (kDebugMode) {
                                            print('Page changed: $value');
                                          }
                                        },
                                        autoPlayInterval: 3000,
                                        isLoop: true,
                                        children: pro.homeProductDetail != null
                                            ? pro.homeProductDetail!.photos!
                                                .map((e) {
                                                return CachedNetworkImage(
                                                  imageUrl:
                                                      "https://dharmeshs42.sg-host.com/public/${e.path.toString()}",
                                                  placeholder: (context, x) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  },
                                                );
                                              }).toList()
                                            : [
                                                Image.asset(AssetsImagesRes
                                                    .productGirl),
                                              ],
                                      ),
                                      const ProductDetailsCenter()
                                    ],
                                  ),
                                ),
                              ),
                              const ProductDetailsBottom(),
                              SizedBox(
                                height: deviceHeight * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Todays Deal",
                                  style: robotoSemiBoldTextStyle(
                                      fontSize: 15, color: ColorRes.blackLight),
                                ),
                              ),
                              Container(
                                height: deviceHeight * 0.35,
                                width: deviceWidth,
                                // color: ColorRes.blackLight,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pro.allTodayProducts.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          pro.onTapProductDetails(
                                              index,
                                              pro.todayProduct!.data![index]
                                                  .links!.details
                                                  .toString(),
                                              context,
                                              pro.todayProduct!.data![index].id
                                                  .toString());
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          height: deviceHeight * 0.20,
                                          width: deviceWidth * 0.45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: ColorRes.black
                                                    .withOpacity(0.2),
                                                //color of shadow
                                                spreadRadius: 0, //spread radius
                                                blurRadius: 3, // blur radius
                                                offset: Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                            color: ColorRes.white,
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      // color: ColorRes.blue,
                                                      height:
                                                          deviceHeight * 0.18,
                                                      width: deviceWidth,
                                                      child: CachedNetworkImage(
                                                          imageUrl: pro
                                                              .allTodayProducts[
                                                                  index]
                                                              .thumbnailImage
                                                              .toString(),
                                                          progressIndicatorBuilder: (context,
                                                                  url,
                                                                  downloadProgress) =>
                                                              SizedBox(
                                                                  height: 40,
                                                                  width: 40,
                                                                  child: CircularProgressIndicator(
                                                                      value: downloadProgress
                                                                          .progress)),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                                  AssetsImagesRes
                                                                      .girl1)),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                height: 25,
                                                                width: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: ColorRes
                                                                      .white,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.20),
                                                                      blurRadius:
                                                                          5,
                                                                      offset: Offset
                                                                          .zero,
                                                                      spreadRadius:
                                                                          0,
                                                                    ),
                                                                  ],
                                                                ),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      ColorRes
                                                                          .white,
                                                                  radius: 15,
                                                                  child: Center(
                                                                    child: InkWell(
                                                                        onTap: () async {
                                                                          if (await Provider.of<FavoriteProvider>(context, listen: false).checkWishList(pro.allTodayProducts[index].id.toString(), PrefService.getString(PrefKeys.uid)) ==
                                                                              false) {
                                                                            pro.addTodayProductWishList(context,
                                                                                pro.allTodayProducts[index].id.toString());
                                                                          } else {
                                                                            pro.removeTodayProductWishList(context,
                                                                                pro.allTodayProducts[index].id.toString());
                                                                          }
                                                                          Provider.of<CategoryProvider>(context, listen: false)
                                                                              .getWishList();
                                                                        },
                                                                        child: Icon(
                                                                          Icons
                                                                              .favorite,
                                                                          color: Provider.of<CategoryProvider>(context, listen: false).wishListId.contains(pro.allTodayProducts[index].id.toString())
                                                                              ? ColorRes.red
                                                                              : ColorRes.grey,
                                                                          // color: like!
                                                                          //     ? ColorRes.red
                                                                          //     : ColorRes.grey,
                                                                          size:
                                                                              18,
                                                                        )),
                                                                  ),
                                                                ),
                                                              ),
                                                              //SizedBox(height: deviceHeight * 0.01),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      SizedBox(
                                                          height: deviceHeight *
                                                              0.006),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 4.0),
                                                        child: Text(
                                                          pro
                                                              .allTodayProducts[
                                                                  index]
                                                              .name
                                                              .toString(),
                                                          style:
                                                              robotoMediumTextStyle(
                                                                  color: ColorRes
                                                                      .greyDark,
                                                                  fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: deviceHeight *
                                                              0.01),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    right:
                                                                        10.0),
                                                            height: 22,
                                                            width: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.0),
                                                              color: ColorRes
                                                                  .yellow,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  pro
                                                                      .allTodayProducts[
                                                                          index]
                                                                      .rating
                                                                      .toString(),
                                                                  // rate!,
                                                                  style: const TextStyle(
                                                                      color: ColorRes
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                                const Icon(
                                                                  Icons.star,
                                                                  color: ColorRes
                                                                      .white,
                                                                  size: 15,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            Strings.tops,
                                                            style:
                                                                robotoSemiBoldTextStyle(
                                                                    color:
                                                                        ColorRes
                                                                            .grey,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: deviceHeight *
                                                            0.004,
                                                      ),
                                                      Wrap(
                                                        children: [
                                                          //mainAxisAlignment: MainAxisAlignment.start,
                                                          Text(
                                                            // "Rs${mainPrice!.toString()}",
                                                            pro
                                                                .allTodayProducts[
                                                                    index]
                                                                .mainPrice
                                                                .toString(),
                                                            style:
                                                                robotoBoldTextStyle(
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                          SizedBox(
                                                            width: deviceWidth *
                                                                0.02,
                                                          ),
                                                          Text(
                                                              // "Rs${strokedPrice!.toString()}",
                                                              pro
                                                                  .allTodayProducts[
                                                                      index]
                                                                  .strokedPrice
                                                                  .toString(),
                                                              style: robotoBoldTextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      color: ColorRes
                                                                          .clrFont
                                                                          .withOpacity(
                                                                              0.7))
                                                                  .copyWith(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )),
                                                          SizedBox(
                                                            width: deviceWidth *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            Strings.off57,
                                                            style: natoMediumTextStyle(
                                                                color: ColorRes
                                                                    .darkGreen,
                                                                fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                      // ),
                                                    ],
                                                  ),
                                                  //],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 15.5,
                          right: 10.0,
                          left: 280.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5)
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: ColorRes.white,
                              radius: 15,
                              child: Center(
                                  child: InkWell(
                                onTap: () {
                                  pro.addToWishList(context);
                                  Provider.of<CategoryProvider>(context,
                                          listen: false)
                                      .getWishList();
                                  Provider.of<HomeProvider>(context,
                                          listen: false)
                                      .getWishList();
                                  Provider.of<FavoriteProvider>(context,
                                          listen: false)
                                      .checkWishList(
                                          pro.homeProductDetail!.id.toString(),
                                          PrefService.getString(PrefKeys.uid));
                                  pro.homeProductDetails(
                                      pro.currentProdductLink);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: pro.isLiked
                                      ? ColorRes.red
                                      : ColorRes.grey,
                                  size: 18,
                                ),
                              )),
                            ),
                          )),
                      Positioned(
                        bottom: 15.5,
                        right: 10.0,
                        left: 10.0,
                        child: Center(
                          child: Container(
                            height: deviceHeight / 15,
                            width: deviceWidth / 1,
                            decoration: BoxDecoration(
                                color: ColorRes.blue,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 5,
                                    color: Color.fromRGBO(0, 0, 0, 0.16),
                                  )
                                ]
                                // color: green
                                ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    pro.onTapCart();
                                    // pro.addToCartAPiData(
                                    //     id: pro.homeProductDetail!.id,
                                    //     quantity: 1,
                                    //     variant: "3kg");
                                  },
                                  child: Container(
                                    height: deviceHeight / 15,
                                    width: deviceWidth * 0.35,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        color: ColorRes.appBarColor),
                                    child: Center(
                                      child: pro.pressed
                                          // ? Text("fhkfjkrjlr")
                                          ? Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    pro.onTapDelete();
                                                  },
                                                  child: Container(
                                                    height: deviceHeight,
                                                    width: 40,
                                                    color: ColorRes.buttonBlue,
                                                    child: Icon(
                                                      pro.counter == 1
                                                          ? IconRes.icDelete
                                                          : Icons.remove,
                                                      color: ColorRes.white,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: deviceHeight,
                                                  width: 45,
                                                  color: ColorRes.white,
                                                  child: Center(
                                                      child: Text(
                                                    "${pro.counter}",
                                                    style:
                                                        robotoMediumTextStyle(
                                                            color:
                                                                ColorRes.blue,
                                                            fontSize: 20),
                                                  )),
                                                ),
                                                GestureDetector(
                                                  onTap: () => pro.onTapPlus(),
                                                  child: Container(
                                                    height: deviceHeight,
                                                    width: 40,
                                                    color: ColorRes.buttonBlue,
                                                    child: Icon(
                                                      IconRes.icPlus,
                                                      color: ColorRes.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Text(
                                              Strings.addToCart,
                                              style: natoSemiBoldTextStyle(
                                                  fontSize: 16,
                                                  color: ColorRes.white),
                                              //    textAlign: TextAlign.center,
                                            ),
                                    ),
                                  ),
                                ),
                                // SizedBox(width: 20),
                                GestureDetector(
                                  //onTap: ()=>provider.onTap(context),
                                  child: Container(
                                    height: deviceHeight / 15,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                        color: ColorRes.buttonBlue),

                                    ///
                                    ///addtocartApi
                                    ///
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          ///
                                          ///[ADD_TO_CART] function
                                          ///
                                          pro.addToCartAPiData(
                                              productDetail:
                                                  pro.homeProductDetail,
                                              context: context);
                                        },
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: deviceWidth * 0.51,
                                              child: Center(
                                                child: Text(
                                                  Strings.checkOut,
                                                  style: natoMediumTextStyle(
                                                      fontSize: 16,
                                                      color: ColorRes.white),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: deviceWidth / 12,
                                              child: Center(
                                                child: Icon(
                                                  IconRes.icNext,
                                                  color: ColorRes.white,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
