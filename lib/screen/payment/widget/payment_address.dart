import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/model/adddressListMdoel/addressModel.dart';
import 'package:utardia/model/payment_model/pamentModel.dart';
import 'package:utardia/model/payment_model/payment_drop_down.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/address_screen.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class PaymentAddress extends StatelessWidget {
  const PaymentAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Strings.deliveryAddress,
                style: natoBoldTextStyle(fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Provider.of<AddressProvider>(context, listen: false).init();

                  navigator.currentState!
                      .push(MaterialPageRoute(
                          builder: (context) => const AddressScreen()))
                      .whenComplete(() {
                    provider.getShipppingAddress();
                  });
                },
                child: Text(
                  Strings.addAddress,
                  style: natoBoldTextStyle(
                      fontSize: 14, color: ColorRes.appBarColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 14.0, left: 14, top: 8),
          child: Container(
              height: deviceHeight / 14,
              width: deviceWidth / 1,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: ColorRes.lightGrey),
              ),
              child: provider.addressList != null
                  ? provider.addressList!.isNotEmpty && provider.loader == false
                      ? DropdownButtonHideUnderline(
                          child: DropdownButton<addressModel>(
                            icon: Icon(IconRes.icDown),
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            onChanged: (addressModel? newSelectedPayment) =>
                                provider.onDropDownItemSelected(
                                    newSelectedPayment!),
                            value:
                                provider.currentAddress, //_addressListchoice,
                            items: provider.addressList!
                                .map<DropdownMenuItem<addressModel>>(
                                    (addressModel? value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        provider.getIcon(
                                            value!.workType.toString()),
                                        color: ColorRes.appBarColor,
                                        size: 35,
                                      ),
                                    ),
                                    // Icon(valueItem.bank_logo),
                                    SizedBox(
                                      width: deviceWidth / 50,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                value.workType.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: natoBoldTextStyle(
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              value.address.toString(),
                                              style: natoBoldTextStyle(
                                                  fontSize: 12,
                                                  color: ColorRes.grey),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : provider.addressList!.isEmpty &&
                              provider.loader == false
                          ? Center(child: Text("No Address"))
                          : Center(
                              child: CircularProgressIndicator(),
                            )
                  : SizedBox()),
        ),
      ],
    );
  }
}
