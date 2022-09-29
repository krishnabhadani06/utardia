import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/screen/edit_profile/editprofile_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class EditProfileCenter extends StatelessWidget {
  const EditProfileCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProfileProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: deviceHeight * 0.071,
                // width: deviceWidth * 0.10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: ColorRes.lightGrey, width: 2.0),
                ),
                child: _buildCountryPickerDropdownSoloExpanded(context),
              ),
            ),
            SizedBox(width: deviceWidth * 0.02),
            Expanded(
              flex: 5,
              child: CommonTextField(
                  controller: provider.txtContact,
                  obscure: false,
                  hintText: Strings.phoneNum,
                  error: false,
                  width: deviceWidth,
                  border:
                      false), // txtfield(controllervalue: mobilenoController, hinttxt: mobileNo),
            ),
          ],
        ),
      ],
    );
  }
}

_buildCountryPickerDropdownSoloExpanded(BuildContext context) {
  return CountryPickerDropdown(
    /* underline: Container(
        height: 2,
        color: Colors.red,
      ),*/
    //show'em (the text fields) you're in charge now
    onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    //if you want your dropdown button's selected item UI to be different
    //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
    onValuePicked: (Country country) {
      if (kDebugMode) {
        print(country.phoneCode);
      }
    },
    itemBuilder: (Country country) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 2.0),
          CountryPickerUtils.getDefaultFlagImage(country),
          // SizedBox(width: 8.0),
          Expanded(child: Text('+${country.phoneCode}')),
        ],
      );
    },
    itemHeight: null, //50,
    isExpanded: true,
    //initialValue: 'TR',
    icon: const Icon(Icons.arrow_downward),
  );
}
