import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/mycard/my_card_provider.dart';
import 'package:utardia/screen/mycard/widget/card_bottomsheet_center.dart';
import 'package:utardia/screen/mycard/widget/comman_textfield.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../../../util/icon_res.dart';

class AddCardBottomSheet extends StatelessWidget {
  const AddCardBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCardProvider>(context);
    return Form(
      key: provider.myCardFormKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Expanded(
          child: Container(
            height: deviceHeight * 0.56,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight / 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          width: deviceWidth / 10,
                        )),
                    Flexible(
                        flex: 7,
                        child: Container(
                            width: deviceWidth / 1,
                            // color: ColorRes.grey,
                            child: Center(
                              child: Text(
                                Strings.newCard,
                                style: robotoSemiBoldTextStyle(
                                    fontSize: 20, color: ColorRes.black),
                                //
                                // style: natoMediumTextStyle(
                                //     fontSize: 20, color: ColorRes.black),
                              ),
                            ))),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: deviceWidth / 20,
                        child: Icon(
                          IconRes.icClose,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                    color: ColorRes.lightGrey,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 17.0, top: 30.0),
                  child: cardNumberTextField(
                      validate: (val) {
                        return (val!.isEmpty) ? Strings.enterCardNumber : null;
                      },
                      // validate: (val) { provider.type = validateCardType(provider.txtCardNumber.text)!;},
                      hintText: Strings.cardNumber,
                      iconString: provider.type == 'visa'
                          ? AssetsImagesRes.visaImg
                          : provider.type == 'master'
                              ? AssetsImagesRes.masterImg
                              : AssetsImagesRes.campaingImg,
                      controllerValue: provider.txtCardNumber),
                ),
                const CardBottomSheetCenter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
