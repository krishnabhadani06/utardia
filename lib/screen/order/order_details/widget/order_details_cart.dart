import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_details/widget/rating_dialog.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

class OrderDetailsCart extends StatelessWidget {
  int? i;
  OrderDetailsCart({Key? key, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context, listen: false);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: deviceHeight * 0.18,
      child: ListView.builder(
          // shrinkWrap: true,
          //physics: NeverScrollableScrollPhysics(),
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: deviceWidth * 0.03),
          scrollDirection: Axis.horizontal,
          itemCount: provider.orderModel.data![i!].productDetail!.length,
          itemBuilder: (context, i) {
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: deviceHeight * 0.14,
                  width: deviceWidth * 0.50,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    // border: Border.all(color: ColorRes.lightGrey,width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 1, //spread radius
                        blurRadius: 5, // blur radius
                        offset:
                            const Offset(0, 1), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4.0, right: 4.0, top: 4.0),
                            child: Container(
                              // margin: const EdgeInsets.only(
                              //     left: 4.0, right: 4.0, top: 5.0, ),
                              height: deviceHeight * 0.10,
                              width: deviceWidth * 0.18,
                              child: Image.network(
                                provider.orderModel.data![i].productDetail![i]
                                    .thumbnailImage
                                    .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(height: deviceHeight * 0.006),
                          Container(
                            height: deviceHeight * 0.02,
                            width: deviceWidth * 0.16,
                            decoration: BoxDecoration(
                                color: ColorRes.buttonBlue,
                                borderRadius: BorderRadius.circular(3.0)),
                            child: Center(
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  "View",
                                  style: robotoBoldTextStyle(
                                      fontSize: 10.0, color: ColorRes.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: deviceHeight * 0.005,
                          ),
                          SizedBox(
                            // height: deviceHeight * 0.,
                            width: deviceWidth * 0.25,
                            child: Text(
                              provider.orderModel.data![i].productDetail![i]
                                  .productName
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: robotoMediumTextStyle(
                                  fontSize: 10, color: ColorRes.greyDark),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       margin: const EdgeInsets.only(right: 10.0),
                          //       height: 22,
                          //       width: 40,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(4.0),
                          //         color: ColorRes.yellow,
                          //       ),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Text(
                          //             provider.orderModel.data![i]
                          //                 .productDetail![i].rating
                          //                 .toString(),
                          //             style: const TextStyle(
                          //                 color: ColorRes.white, fontSize: 12),
                          //           ),
                          //           const Icon(
                          //             Icons.star,
                          //             color: ColorRes.white,
                          //             size: 15,
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     const Spacer(),
                          //     Text(
                          //       Strings.tops,
                          //       style: robotoSemiBoldTextStyle(
                          //           color: ColorRes.grey, fontSize: 12),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       provider.orderModel.data![i].productDetail![i]
                          //           .rating
                          //           .toString(),
                          //     )
                          //   ],
                          // ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1.0),
                                    // color: Colors.blue,
                                  ),
                                  child: Center(
                                      child: Text(
                                    provider.orderModel.data![i]
                                        .productDetail![i].photos![0].variant
                                        .toString(),
                                    style: natoSemiBoldTextStyle(
                                        color: ColorRes.grey, fontSize: 12.0),
                                  )),
                                ),
                                SizedBox(width: deviceWidth * 0.02),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      // border: Border.all(width: 1.0),
                                      color: ColorRes.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.005,
                          ),
                          Text(
                            provider.orderModel.data![i].productDetail![i]
                                .priceHighLow!
                                .toString(),
                            style: robotoBoldTextStyle(
                                fontSize: 15, color: ColorRes.blue),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //         provider.orderModel.data![i].productDetail![i]
                          //             .strokedPrice!
                          //             .toString(),
                          //         style: robotoBoldTextStyle(
                          //                 fontSize: 10,
                          //                 color:
                          //                     ColorRes.clrFont.withOpacity(0.7))
                          //             .copyWith(
                          //           decoration: TextDecoration.lineThrough,
                          //         )),
                          //     Spacer(),
                          //     Text(
                          //       Strings.off57,
                          //       style: natoMediumTextStyle(
                          //           color: ColorRes.darkGreen, fontSize: 7.3),
                          //     ),
                          //   ],
                          // )
                        ],
                      )
                    ],
                  ),
                ),
                provider.orderModel.data![i].deliveryStatus == "deliverd"
                    ? ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Rating_dialog(
                                      pid: provider.orderModel.data![i]
                                          .productDetail![i].id
                                          .toString(),
                                      uid: PrefService.getString(PrefKeys.uid)
                                          .toString()),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(30.0, 20.0),
                            backgroundColor: ColorRes.borderblue,
                            minimumSize: Size(deviceWidth * 0.2, 27.0)),
                        child: const Text("Rate"))
                    : const SizedBox()
              ],
            );
          }),
    );
  }
}
