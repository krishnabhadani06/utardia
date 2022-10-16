import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/cart/widget/cart_bottom.dart';
import 'package:utardia/screen/dashboard/cart/widget/cart_center.dart';
import 'package:utardia/screen/dashboard/cart/widget/cart_empty_screen.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CartProvider>(context, listen: false).getCartDate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (con, provider, widget) {
      return provider.cartListDataModel.cartItems == null &&
              provider.loader == false
          ? const CartEmptyScreen()
          : SafeArea(
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: ColorRes.appBarColor,
                    leading: GestureDetector(
                      child: Icon(IconRes.icBack, size: 30),
                      onTap: () {
                        if (navigator.currentState!.canPop()) {
                          navigator.currentState!.pop();
                        } else {
                          Provider.of<DashboardProvider>(context, listen: false)
                              .onBottomBarChange(0, context);
                        }
                      },
                    ),
                    // actions: [
                    //   InkWell(
                    //     onTap: () {
                    //       provider.deleteAllCart();
                    //     },
                    //     child: Icon(
                    //       IconRes.icDelete,
                    //       size: 30,
                    //     ),
                    //   ),
                    //   SizedBox(
                    //     width: deviceWidth / 20,
                    //   )
                    // ],
                    centerTitle: true,
                    title: Text(Strings.cart,
                        style: ubuntuBoldTextStyle(
                            fontSize: 22, color: ColorRes.white)),
                  ),
                  body: provider.loader == true
                      ? commonLoader()
                      : Stack(
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    // shrinkWrap: true,
                                    itemCount:
                                        provider.cartListDataModel.cartItems ==
                                                null
                                            ? 1
                                            : provider.cartListDataModel
                                                .cartItems!.length,
                                    // scrollDirection: Axis.vertical,
                                    // physics: const BouncingScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 18.0,
                                            bottom: 10,
                                            right: 10,
                                            left: 12),
                                        child: Container(
                                          height: deviceHeight * 0.18,
                                          width: deviceWidth,
                                          decoration: BoxDecoration(
                                            // color: Colors.black,
                                            color: ColorRes.white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(2, 2),
                                                blurRadius: 2,
                                                color: const Color.fromRGBO(
                                                        0, 0, 0, 0.25)
                                                    .withOpacity(0.15),
                                                // color: ColorRes.lightGrey,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 4.0,
                                                            right: 4.0),
                                                    height: deviceHeight * 0.16,
                                                    width: deviceWidth * 0.30,
                                                    child: provider
                                                                .cartListDataModel
                                                                .cartItems ==
                                                            null
                                                        ? Image.asset(
                                                            AssetsImagesRes
                                                                .lehengha,
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Image.network(
                                                            provider
                                                                .cartListDataModel
                                                                .cartItems![
                                                                    index]
                                                                .productThumbnailImage!,
                                                            fit: BoxFit.fill,
                                                            loadingBuilder:
                                                                (con, widget,
                                                                    chunk) {
                                                            return chunk == null
                                                                ? widget
                                                                : const Center(
                                                                    child: CircularProgressIndicator
                                                                        .adaptive());
                                                          }),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 12.0,
                                                          left: 10.0,
                                                        ),
                                                        child: SizedBox(
                                                          // color: Colors.black,
                                                          width: deviceWidth *
                                                              0.55,
                                                          child: Text(
                                                            provider
                                                                .cartListDataModel
                                                                .cartItems![
                                                                    index]
                                                                .productName
                                                                .toString(),
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                fontSize: 8,
                                                                color: Color(
                                                                    0xff303030),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: deviceHeight *
                                                            0.006,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 5.0,
                                                                left: 10,
                                                                right: 0.0),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10.0,
                                                                      left:
                                                                          3.0),
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
                                                                children: const [
                                                                  Text(
                                                                    '${0.0}',
                                                                    style: TextStyle(
                                                                        color: ColorRes
                                                                            .white,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: ColorRes
                                                                        .white,
                                                                    size: 15,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 17,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Center(
                                                                  child: Text(
                                                                provider
                                                                    .cartListDataModel
                                                                    .cartItems![
                                                                        index]
                                                                    .variation
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                            .grey[
                                                                        500],
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        10.0),
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            deviceHeight * 0.01,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                    top: 5.0,
                                                                  ),
                                                                  child: Text(
                                                                    provider.cartListDataModel.cartItems ==
                                                                            null
                                                                        ? Strings
                                                                            .rs3000
                                                                        : "${provider.cartListDataModel.cartItems![index].currencySymbol.toString()}${provider.cartListDataModel.cartItems![index].price.toString()}",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width:
                                                                      deviceWidth *
                                                                          0.005,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      provider
                                                                          .cartListDataModel
                                                                          .cartItems![
                                                                              index]
                                                                          .price
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          color: ColorRes
                                                                              .grayText,
                                                                          fontSize:
                                                                              12,
                                                                          decoration:
                                                                              TextDecoration.lineThrough),
                                                                    ), //decoration: TextDecoration.lineThrough),),
                                                                    SizedBox(
                                                                      width: deviceWidth *
                                                                          0.03,
                                                                    ),
                                                                    Text(
                                                                      "No Discount",
                                                                      style: robotoBoldTextStyle(
                                                                          color: ColorRes
                                                                              .darkGreen,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            CartCenter(
                                                                index: index),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const CartBottom(),
                              ],
                            ),
                          ],
                        )),
            );
    });
  }
}
