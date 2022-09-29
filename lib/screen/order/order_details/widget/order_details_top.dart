import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:steps_indicator/steps_indicator.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class OrderDetailsTop extends StatelessWidget {
  int? ind;
  OrderDetailsTop({Key? key, this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                Strings.orderInfo,
                style: robotoBoldTextStyle(fontSize: 16, color: ColorRes.black),
              ),
            ),
          ],
        ),
        SizedBox(
          height: deviceHeight / 110,
        ),
        Container(
          height: deviceHeight / 15,
          width: deviceWidth / 1,
          decoration: BoxDecoration(
            border: Border.all(color: ColorRes.lightGrey, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                provider.orderModel!.data![ind!].id.toString(),
                style:
                    robotoMediumTextStyle(fontSize: 14, color: ColorRes.black),
              ),
              Text(
                '${Strings.date}-${Strings.time}',
                style:
                    robotoRegularTextStyle(fontSize: 14, color: ColorRes.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: deviceHeight / 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                provider.orderModel!.data![ind!].deliveryStatus.toString(),
                style: robotoBoldTextStyle(color: ColorRes.black, fontSize: 16),
              ),
            )
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        Container(
          height: deviceHeight * 0.10,
          width: deviceWidth * 0.95,
          decoration: BoxDecoration(
            color: ColorRes.white,
            // border: Border.all(color: ColorRes.lightGrey, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: ColorRes.black.withOpacity(0.25),
                  blurRadius: 3,
                  offset: Offset.zero,
                  spreadRadius: 0.5)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StepsIndicator(
                selectedStep: 1,
                // provider.getSteps(
                //     provider.ordermodel!.data![ind!].deliveryStatus.toString()),
                //selectedStep: provider.selectedStep,
                nbSteps: 3,
                // doneLineColor: Colors.green,
                // doneStepColor: Colors.green,
                undoneLineColor: ColorRes.green,
                undoneLineThickness: 6.0,
                unselectedStepColorIn: ColorRes.grey,
                unselectedStepColorOut: ColorRes.grey,
                lineLength: 110,
                isHorizontal: true,
                doneStepSize: 16,
                unselectedStepSize: 16,
                selectedStepSize: 16,
                selectedStepBorderSize: 8,

                selectedStepColorOut: ColorRes.green,
                // lineLengthCustomStep: [
                //   StepsIndicatorCustomLine(nbStep: 1, length: 105)
                // ],
                enableLineAnimation: true,
                enableStepAnimation: true,
              ),
              SizedBox(height: deviceHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(Strings.preparing,
                      style: natoSemiBoldTextStyle(
                          color: ColorRes.black, fontSize: 12)),
                  Text(Strings.onTheWay,
                      style: natoSemiBoldTextStyle(
                          color: ColorRes.black, fontSize: 12)),
                  Text(Strings.delivered,
                      style: natoSemiBoldTextStyle(
                          color: ColorRes.black, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
    //     ),
    //     SizedBox(
    //       height: deviceHeight / 110,
    //     ),
    //     Container(
    //       height: deviceHeight / 10,
    //       width: deviceWidth / 1,
    //       decoration: BoxDecoration(
    //         border: Border.all(color: ColorRes.lightGrey, width: 2),
    //         borderRadius: const BorderRadius.all(Radius.circular(8)),
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: [],
    //   )
    //   ),
    // ],
    //   );
  }
}
