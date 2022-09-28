import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/product_details/widget/product_details_bottom.dart';
import 'package:utardia/screen/category/product_details/widget/product_detials_center.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
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
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
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
