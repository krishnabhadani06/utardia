import 'package:flutter/material.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

class PaymentStatusScreen extends StatefulWidget {
  const PaymentStatusScreen({Key? key}) : super(key: key);

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
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "Place Order",
            style: TextStyle(fontSize: 22, color: ColorRes.white),
          )),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
