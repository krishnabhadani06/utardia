import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/widget/address_bottomsheet_bottom.dart';
import 'package:utardia/screen/address/widget/address_bottomsheet_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return Container(
      height: deviceHeight * 0.78,

      ///bottom: MediaQuery.of(context).viewInsets.bottom
      padding: const EdgeInsets.only(left: 17, right: 18, top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Form(
        key: provider.key1,
        child: Container(
          height: deviceHeight * 0.80,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: deviceWidth * 0.30),
                    Text(Strings.newAddress,
                        style: natoSemiBoldTextStyle(
                          color: ColorRes.black,
                          fontSize: 20,
                        )),
                    SizedBox(width: deviceWidth * 0.135),
                    IconButton(
                        onPressed: () => provider.onTapCloseBottomSheet(),
                        icon: Icon(
                          IconRes.icClose,
                          size: 35.0,
                        ))
                  ],
                ),
                const Divider(
                  thickness: 2.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 08.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          height: deviceHeight * 0.045,
                          // minWidth: deviceWidth* 0.19,
                          color: provider.isSelect == Strings.home
                              ? ColorRes.blueBox
                              : ColorRes.greyBox,
                          child: Row(
                            children: [
                              Icon(
                                IconRes.ichome1,
                                color: provider.isSelect == Strings.home
                                    ? ColorRes.white
                                    : ColorRes.grey,
                                size: 25,
                              ),
                              Text(
                                Strings.home,
                                style: provider.isSelect == Strings.home
                                    ? robotoBoldTextStyle(
                                        fontSize: 16,
                                        color: ColorRes.white,
                                      )
                                    : robotoBoldTextStyle(
                                        fontSize: 16, color: ColorRes.grey),
                              ),
                              // Icon(AssetsString.icHome),
                              // const Text(Strings.home)
                            ],
                          ),
                          onPressed: () {
                            provider.onTapButton(0);
                          }),
                      const SizedBox(width: 13),
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          height: deviceHeight * 0.045,
                          minWidth: 97,
                          color: provider.isSelect == Strings.work
                              ? ColorRes.blueBox
                              : ColorRes.greyBox,
                          onPressed: () {
                            provider.onTapButton(1);
                          },
                          child: Row(
                            children: [
                              Icon(
                                IconRes.icwork,
                                color: provider.isSelect == Strings.work
                                    ? ColorRes.white
                                    : ColorRes.grey,
                                size: 25,
                              ),
                              Text(
                                Strings.work,
                                style: provider.isSelect == Strings.work
                                    ? robotoBoldTextStyle(
                                        fontSize: 16,
                                        color: ColorRes.white,
                                      )
                                    : robotoBoldTextStyle(
                                        fontSize: 16, color: ColorRes.grey),
                              ),
                              // Icon(AssetsString.icwork),
                              // const Text(Strings.work)
                            ],
                          )),
                      const SizedBox(width: 14),
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          height: deviceHeight * 0.045,
                          minWidth: 97,
                          color: provider.isSelect == Strings.other
                              ? ColorRes.blueBox
                              : ColorRes.greyBox,
                          onPressed: () {
                            provider.onTapButton(2);
                          },
                          child: Row(
                            children: [
                              Icon(
                                IconRes.icother,
                                color: provider.isSelect == Strings.other
                                    ? ColorRes.white
                                    : ColorRes.grey,
                                size: 25,
                              ),
                              Text(
                                Strings.other,
                                style: provider.isSelect == Strings.other
                                    ? robotoBoldTextStyle(
                                        fontSize: 16,
                                        color: ColorRes.white,
                                      )
                                    : robotoBoldTextStyle(
                                        fontSize: 16, color: ColorRes.grey),
                              ),
                              // Icon(AssetsString.icother),
                              // const Text(Strings.other)
                            ],
                          )),
                    ],
                  ),
                ),
                const AddressBottomSheetCenter(),
                const AddressBottomSheetBottom(),
                SizedBox(
                  height: deviceWidth * 0.05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
