import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class OrderDetailsCart extends StatelessWidget {
  const OrderDetailsCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 13.0),
          child: GridView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 1,
                childAspectRatio: deviceWidth / (deviceHeight * 0.26),
              ),
              itemCount: 2,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      height: deviceHeight * 0.11,
                      width: deviceWidth * 0.50,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        // border: Border.all(color: ColorRes.lightGrey,width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 1, //spread radius
                            blurRadius: 5, // blur radius
                            offset: const Offset(
                                0, 1), // changes position of shadow
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
                            margin:
                                const EdgeInsets.only(left: 4.0, right: 4.0),
                            height: deviceHeight * 0.16,
                            width: deviceWidth * 0.20,
                            // color: Colors.amber,
                            //  decoration: BoxDecoration(
                            //    borderRadius: BorderRadius.circular(8),
                            //    color: Colors.amber
                            //  ),
                            child: Image.asset(
                              AssetsImagesRes.girl1,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: deviceHeight * 0.005,
                              ),
                              Text(
                                Strings.top,
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
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1.0),
                                        // color: Colors.blue,
                                      ),
                                      child: Center(
                                          child: Text(
                                        Strings.xl,
                                        style: natoSemiBoldTextStyle(
                                            color: ColorRes.grey,
                                            fontSize: 12.0),
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
                                Strings.rs3000,
                                style: robotoBoldTextStyle(
                                    fontSize: 15, color: ColorRes.blue),
                              ),
                            ],
                          )
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
