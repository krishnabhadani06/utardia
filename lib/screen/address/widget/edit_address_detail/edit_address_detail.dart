import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/widget/edit_address_detail/edit_address_detail_bottom.dart';
import 'package:utardia/screen/address/widget/edit_address_detail/edit_address_detail_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class EditAddressDetail extends StatelessWidget {
  const EditAddressDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return Form(
      key: provider.key1,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: deviceWidth / 3),
                  Text(Strings.editAddress,
                      style: natoMediumTextStyle(fontSize: 20)),
                  SizedBox(width: deviceWidth / 5),
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
                padding:
                    const EdgeInsets.only(left: 16.0, right: 15.0, top: 10.0),
                child: Row(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      height: 36,
                      minWidth: 97,
                      color: provider.isSelect == Strings.home
                          ? ColorRes.blue
                          : ColorRes.lightGrey,
                      onPressed: () {
                        provider.onTapButton(0);
                      },
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
                                  ).copyWith(fontWeight: FontWeight.bold)
                                : robotoRegularTextStyle(
                                    fontSize: 16, color: ColorRes.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 13),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        height: 36,
                        minWidth: 97,
                        color: provider.isSelect == Strings.work
                            ? ColorRes.blue
                            : ColorRes.lightGrey,
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
                                    ).copyWith(fontWeight: FontWeight.bold)
                                  : robotoRegularTextStyle(
                                      fontSize: 16, color: ColorRes.grey),
                            ),
                          ],
                        )),
                    const SizedBox(width: 14),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        height: 36,
                        minWidth: 97,
                        color: provider.isSelect == Strings.other
                            ? ColorRes.blue
                            : ColorRes.lightGrey,
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
                                    ).copyWith(fontWeight: FontWeight.bold)
                                  : robotoRegularTextStyle(
                                      fontSize: 16, color: ColorRes.grey),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const EditAddressDetailsCenter(),
              const EditAddressDetailBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
