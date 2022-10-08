import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
// import 'package:utardia/model/address_model/country_model.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/common_textfield.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class AddressBottomSheetCenter extends StatelessWidget {
  const AddressBottomSheetCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 6.0),
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
              hintText: Strings.nameSurname,
              error: false,
              width: deviceWidth,
              border: false),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(right: 25),
            alignment: Alignment.centerLeft,
            height: 15,
            width: double.infinity,
            // color: Colors.yellow,
            child: Text(
              provider.errorTextName ?? "",
              style: robotoRegularTextStyle(
                fontSize: 12,
                color: ColorRes.red,
              ),
            ),
          ),
          SizedBox(height: deviceHeight * 0.02),
          Column(
            children: [
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
                        border:
                            Border.all(color: ColorRes.lightGrey, width: 2.0),
                      ),
                      child: _buildCountryPickerDropdownSoloExpanded(context),
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
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.only(right: 25),
                alignment: Alignment.centerRight,
                height: 15,
                width: double.infinity,
                // color: Colors.yellow,
                child: Text(
                  provider.errorTextPhone ?? "",
                  style: robotoRegularTextStyle(
                    fontSize: 12,
                    color: ColorRes.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_buildCountryPickerDropdownSoloExpanded(BuildContext context) {
  return CountryPickerDropdown(
    onTap: () => FocusScope.of(context).requestFocus(FocusNode()),

    onValuePicked: (Country country) {
      if (kDebugMode) {
        print(country.phoneCode);
      }

      Provider.of<AddressProvider>(context, listen: false).currentCountry =
          country;
    },
    itemBuilder: (Country country) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 2.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          // SizedBox(width: 8.0),
          Expanded(child: Text('${country.phoneCode}')),
        ],
      );
    },
    itemHeight: null, //50,
    isExpanded: true,
    initialValue: Provider.of<AddressProvider>(context, listen: false)
        .currentCountry
        .isoCode,
    icon: const Icon(Icons.arrow_downward),
  );
}
