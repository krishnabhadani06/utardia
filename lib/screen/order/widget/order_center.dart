import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';

class OrderCenter extends StatelessWidget {
  int? inde;
  OrderCenter({Key? key, this.inde}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        SizedBox(
          height: deviceHeight * 0.20,
          width: deviceWidth,
          child: ListView.builder(
              shrinkWrap: true,

              //physics: NeverScrollableScrollPhysics(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:
                  provider.orderModel!.data![inde!].productDetail!.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: deviceWidth * 0.02),
                      // height: deviceHeight * 0.12,
                      width: deviceWidth * 0.70,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        // color: green,
                        border: Border.all(color: ColorRes.lightGrey, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.20),
                              blurRadius: 3,
                              offset: Offset.zero,
                              spreadRadius: 0)
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: 4.0, right: 4.0),
                            height: deviceHeight * 0.16,
                            width: deviceWidth * 0.17,
                            // color: Colors.amber,
                            //  decoration: BoxDecoration(
                            //    borderRadius: BorderRadius.circular(8),
                            //    color: Colors.amber
                            //  ),
                            child: Image.network(
                              provider.orderModel!.data![inde!]
                                  .productDetail![i].thumbnailImage
                                  .toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10.0),
                          //   child: Image.asset(data[0].details[i].icimage,height: deviceHeight/10,width: deviceWidth/4.5,),
                          // ),
                          SizedBox(
                            width: deviceWidth * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: deviceHeight * 0.01,
                                ),
                                Text(
                                  "Prod",
                                  style: robotoBoldTextStyle(
                                      fontSize: 16, color: ColorRes.greyDark),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7.0, right: 15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 38,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.orange,
                                          // shape: BoxShape.circle,

                                          // color: Colors.blue,
                                        ),
                                        child: Center(
                                            child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 18.0,
                                            ),
                                            Text(
                                              provider.orderModel!.data![inde!]
                                                  .productDetail![i].rating
                                                  .toString(),
                                              style: natoSemiBoldTextStyle(
                                                  color: ColorRes.white,
                                                  fontSize: 12.0),
                                            ),
                                          ],
                                        )),
                                      ),
                                      SizedBox(width: deviceWidth * 0.02),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        child: Text(
                                          provider
                                              .orderModel!
                                              .data![inde!]
                                              .productDetail![i]
                                              .photos![0]
                                              .variant
                                              .toString(),
                                          style: TextStyle(
                                              color: ColorRes.grey,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          // border: Border.all(width: 1.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: deviceHeight * 0.01,
                                ),
                                Text(
                                  provider.orderModel!.data![inde!]
                                      .productDetail![i].priceHighLow!
                                      .toString(),
                                  style: robotoBoldTextStyle(
                                    fontSize: 15,
                                    color: ColorRes.black,
                                  ).copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: deviceHeight * 0.01,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      provider.orderModel!.data![inde!]
                                          .productDetail![i].strokedPrice
                                          .toString(),
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: ColorRes.grey,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: deviceWidth * 0.02,
                                    ),
                                    Text(
                                      "(${provider.orderModel!.data![inde!].productDetail![i].discount.toString()} ${provider.orderModel!.data![inde!].productDetail![i].discountType == "percent" ? "%" : "Rs"} off)",
                                      style: TextStyle(
                                          // decoration: TextDecoration.lineThrough,
                                          color: ColorRes.green,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                // SizedBox(height: deviceHeight * 0.01,),
                                // Text('${data[0].details[i].rs}.00 ${Strings.rs}',style: robotoBoldTextStyle(fontSize: 16,color: ColorRes.green),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
