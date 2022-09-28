import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              // flex: 5,
              child: Card(
                elevation: 4.0,
                shadowColor: ColorRes.borderblue.withOpacity(0.7),
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: txtfield(
                    validate: (val) => phoneNumberValidator(val),
                    controllerValue: provider.txtContact,
                    hintTxt: Strings.mobileNo),
              ), // txtfield(controllervalue: mobilenoController, hinttxt: mobileNo),
            ),
          ],
        ),
      ],
    );
  }
}
