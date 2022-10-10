import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/dashboard_screen.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/screen/order/widget/order_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/order_top.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context, listen: false);
    return SafeArea(
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
                  if (navigator.currentState!.canPop()) {
                    Navigator.pop(context);
                  } else {
                    navigator.currentState!
                        .pushReplacement(MaterialPageRoute(builder: (con) {
                      return DashScreen();
                    }));
                  }
                },
              ),
              centerTitle: true,
              title: const Text(Strings.order, style: TextStyle(fontSize: 22)),
            ),
            body: provider.orderModel.data != null && provider.loader == false
                ? ListView.builder(
                    itemCount: provider.orderModel.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 13.0, right: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: deviceHeight * 0.02,
                            ),
                            OrderTop(
                              inde: index,
                            ),
                            OrderCenter(inde: index),
                          ],
                        ),
                      );
                    })
                : provider.orderModel.data == null && provider.loader == false
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.12),
                            Image.asset(AssetsImagesRes.favouriteImage),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            Text(
                              Strings.noOrder,
                              style: natoBoldTextStyle(fontSize: 20),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Text(
                              Strings.NoOrderDes,
                              style: natoMediumTextStyle(
                                  fontSize: 16, color: ColorRes.grayText),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: materialButton(
                                  txtButton: Strings.startShopping,
                                  onPressed: () {
                                    navigator.currentState!.pop();
                                  }),
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )));
  }
}
