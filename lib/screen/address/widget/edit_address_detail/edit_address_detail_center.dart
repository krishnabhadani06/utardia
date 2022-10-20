import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/common_textfield.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class EditAddressDetailsCenter extends StatelessWidget {
  const EditAddressDetailsCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: deviceHeight * 0.02),
          Text(
            "Enter name",
            style: natoMediumTextStyle(fontSize: 15, color: ColorRes.grey),
          ),
          CommonTextFieldAddress(
              controller: provider.txtName,
              obscure: false,
              hintText: Strings.name,
              error: false,
              width: deviceWidth,
              border: false),
          SizedBox(height: deviceHeight * 0.02),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: deviceHeight * 0.071,
                  // width: deviceWidth * 0.10,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: ColorRes.lightGrey, width: 2.0),
                      boxShadow: [
                        BoxShadow(
                          color: ColorRes.black.withOpacity(0.1),
                          //color of shadow
                          spreadRadius: 0, //spread radius
                          blurRadius: 3, // blur radius
                          offset: const Offset(0, 0),
                        ),
                      ],
                      color: ColorRes.white),
                  child: InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (Country country) {
                            provider.currentCountry = country;
                            // provider.notifyListeners();
                          });
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: provider.currentCountry != null
                                    ? Text(
                                        provider.currentCountry!.flagEmoji,
                                        style: robotoRegularTextStyle(
                                            fontSize: 25),
                                      )
                                    : const Center(
                                        child: Text(""),
                                      )),
                            Expanded(
                                child: provider.currentCountry != null
                                    ? Text(
                                        " +${provider.currentCountry!.phoneCode.toString()}",
                                        style: robotoMediumTextStyle(
                                            fontSize: 18,
                                            color: ColorRes.greyTextHome),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2)
                                    : const Center(
                                        child: Text(""),
                                      )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // child: _buildCountryPickerDropdownSoloExpanded(context),
                ),
              ),
              SizedBox(width: deviceWidth * 0.02),
              Expanded(
                flex: 5,
                child: CommonTextFieldAddress(
                    controller: provider.txtContact,
                    obscure: false,
                    hintText: Strings.phoneNum,
                    error: false,
                    width: deviceWidth,
                    border: false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
