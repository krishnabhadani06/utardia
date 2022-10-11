import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/payment/PaymentProcessScreen.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class PaymentStatusScreen extends StatefulWidget {
  int isSuccess = 0;
  String? link;
  String? orderId;
  String? amount;
  PaymentStatusScreen(
      {Key? key, required this.isSuccess, this.link, this.orderId, this.amount})
      : super(key: key);

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorRes.appBarColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          leading: GestureDetector(
            child: Icon(IconRes.icBack, size: 28),
            onTap: () {
              if (navigator.currentState!.canPop() == true) {
                navigator.currentState!.pop();
              } else {
                navigator.currentState!
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return DashScreen();
                }));
              }
            },
          ),
          centerTitle: true,
          title: Text(
            "Place Order",
            style: TextStyle(fontSize: 22, color: ColorRes.white),
          )),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            Padding(
              padding: EdgeInsets.only(right: deviceWidth * 0.06),
              child: Image.asset(
                widget.isSuccess == 0
                    ? AssetsImagesRes.paymentDoneImg
                    : AssetsImagesRes.paymentFailImg,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              Strings.yourOrderHasBeen,
              style: natoBoldTextStyle(fontSize: 20),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
              child: Text(
                Strings.weHaveAcceptedOrder,
                textAlign: TextAlign.center,
                style:
                    natoMediumTextStyle(fontSize: 16, color: ColorRes.grayText),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: materialButton(
                    txtButton: widget.isSuccess == 0
                        ? Strings.trackOrder
                        : Strings.tryAgain,
                    onPressed: widget.isSuccess == 0
                        ? () {
                            Provider.of<PaymentProvider>(context, listen: false)
                                .onTapTrackOrder(
                                    widget.orderId.toString(), context);
                          }
                        : () {
                            navigator.currentState!.pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return PaymentProcessScreen(
                                amount: widget.amount,
                                id: widget.orderId,
                              );
                            }));
                          })),
            TextButton(
                onPressed: () {
                  navigator.currentState!
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return DashScreen();
                  }));
                },
                child: Text(Strings.backHome))
          ],
        ),
      ),
    );
  }
}
