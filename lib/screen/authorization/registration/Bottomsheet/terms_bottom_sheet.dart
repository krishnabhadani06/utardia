import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/bottom_sheet_provider.dart';
import 'package:utardia/util/icon_res.dart';

class TermsBottomSheet extends StatelessWidget {
  String title, subTitle;
  TermsBottomSheet(this.title, this.subTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomSheetProvider>(context);
    return SizedBox(
      height: deviceHeight * 0.82,
      width: deviceWidth * 0.90,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: deviceWidth * 0.18,
                  ),
                  Text(
                    title,
                    style: robotoMediumTextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: deviceWidth * 0.10,
                  ),
                  IconButton(
                      onPressed: () => provider.onTapCloseBottomSheet(context),
                      icon: Icon(
                        IconRes.icClose,
                        size: 35.0,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Text(
                subTitle,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
