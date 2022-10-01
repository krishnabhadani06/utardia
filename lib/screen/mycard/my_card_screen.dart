import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/mycard/my_card_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCardProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorRes.appBarColor,
          leading: GestureDetector(
            child: Icon(IconRes.icBack, size: 30),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(Strings.myCard, style: TextStyle(fontSize: 22)),
          actions: [
            GestureDetector(
                onTap: () => showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      // constraints: BoxConstraints(minHeight: deviceHeight/4),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                      ),

                      builder: (context) => provider.onTapNew(context),
                    ),
                child: Icon(
                  IconRes.icPlus,
                  size: 45,
                )),
            SizedBox(
              width: deviceWidth * 0.02,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Container(
              height: deviceHeight * 0.08,
              width: deviceWidth * 0.96,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                // border: Border.all(color: ColorRes.lightGrey, width: 2),
                boxShadow: [
                  BoxShadow(
                      color: ColorRes.black.withOpacity(0.25),
                      blurRadius: 3,
                      offset: Offset.zero,
                      spreadRadius: 0.5)
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: deviceWidth * 0.05,
                  ),
                  Container(
                    height: deviceHeight * 0.05,
                    width: deviceWidth * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(color: ColorRes.lightGrey, width: 2),
                    ),
                    // child: Image.asset(AssetsString.ruPayImg,
                    //     width: deviceWidth * 0.12,
                    //     height: deviceHeight * 0.05),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.04,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.ruPay,
                        style: natoBoldTextStyle(fontSize: 16),
                      ),
                      Text(
                        '1234544545485',
                        style: natoMediumTextStyle(
                            fontSize: 12, color: ColorRes.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    width: deviceWidth * 0.30,
                  ),
                  GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      // constraints: BoxConstraints(minHeight: deviceHeight/4),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0)),
                      ),

                      builder: (context) => provider.onTapEdit(),
                    ),
                    child: Icon(
                      IconRes.icNext,
                      size: 45,
                      color: ColorRes.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
