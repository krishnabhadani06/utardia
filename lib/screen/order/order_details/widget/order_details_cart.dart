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
          padding: EdgeInsets.only(left: deviceWidth * 0.1),
          scrollDirection: Axis.horizontal,
          itemCount: provider.orderModel.data![i!].productDetail!.length,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: deviceHeight * 0.11,
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
                      Container(
                        margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                        height: deviceHeight * 0.16,
                        width: deviceWidth * 0.20,
                        child: Image.network(
                          provider.orderModel.data![i].productDetail![i]
                              .thumbnailImage
                              .toString(),
                          fit: BoxFit.fill,
                        ),
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
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: robotoBoldTextStyle(
                                  fontSize: 16, color: ColorRes.greyDark),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 7.0, right: 15.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
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
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      // border: Border.all(width: 1.0),
                                      color: ColorRes.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: deviceHeight * 0.002,
                          ),
                          Text(
                            provider.orderModel.data![i].productDetail![i]
                                .priceHighLow!
                                .toString(),
                            style: robotoBoldTextStyle(
                                fontSize: 15, color: ColorRes.blue),
                          ),
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
                            fixedSize: Size(30.0, 20.0),
                            backgroundColor: ColorRes.borderblue,
                            minimumSize: Size(deviceWidth * 0.2, 27.0)),
                        child: Text("Rate"))
                    : const SizedBox()
              ],
            );
          }),
    );
  }
}
