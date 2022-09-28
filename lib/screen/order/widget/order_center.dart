import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../../../model/category_model/category_model_list.dart';

class OrderCenter extends StatelessWidget {
  const OrderCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        GridView.builder(
            shrinkWrap: true,
            //physics: NeverScrollableScrollPhysics(),
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 3,
              childAspectRatio: deviceWidth / (deviceHeight * 0.27),
            ),
            itemCount: data[0].details.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Container(
                    height: deviceHeight * 0.12,
                    width: deviceWidth * 0.48,
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
                          margin: const EdgeInsets.only(left: 4.0, right: 4.0),
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
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10.0),
                        //   child: Image.asset(data[0].details[i].icimage,height: deviceHeight/10,width: deviceWidth/4.5,),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: deviceHeight * 0.01,
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
                                height: deviceHeight * 0.01,
                              ),
                              Text(
                                Strings.rs3000,
                                style: robotoBoldTextStyle(
                                    fontSize: 15, color: ColorRes.blue),
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
      ],
    );
  }
}
