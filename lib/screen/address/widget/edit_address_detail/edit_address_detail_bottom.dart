import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/model/address_model/city_model.dart';
import 'package:utardia/model/address_model/state_model.dart';
import 'package:utardia/screen/address/common_textfield.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

import '../../address_provider.dart';

class EditAddressDetailBottom extends StatelessWidget {
  const EditAddressDetailBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 14.0),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Card(
          elevation: 4.0,
          shadowColor: ColorRes.borderblue.withOpacity(0.7),
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: txtFieldAddress(
              validate: (val) {
                return (val!.isEmpty) ? Strings.pleaseEnterAddress : null;
              },
              controllerValue: provider.txtAddress,
              hintTxt: Strings.address),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 4.0,
          shadowColor: ColorRes.borderblue.withOpacity(0.7),
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: txtFieldAddress(
              validate: (val) {
                return (val!.isEmpty) ? Strings.enterLandmark : null;
              },
              controllerValue: provider.txtLandmark,
              hintTxt: Strings.landMarks),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 4.0,
          shadowColor: ColorRes.borderblue.withOpacity(0.7),
          borderOnForeground: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: txtFieldAddress(
              validate: (val) {
                return (val!.isEmpty) ? Strings.enterPinCode : null;
              },
              controllerValue: provider.txtPincode,
              hintTxt: Strings.pinCode),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: provider.stateList.isNotEmpty &&
                        provider.currentState != null
                    ? DropdownButton<StateModel>(
                        value: provider.currentState!,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: provider.stateList
                            .map((e) => DropdownMenuItem<StateModel>(
                                value: e,
                                child: Container(
                                  width: deviceWidth * 0.25,
                                  child: Text(
                                    e.name.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )))
                            .toList(),
                        onChanged: (value) {
                          provider.currentState = value;
                          provider.getCity(
                              provider.currentState!.id.toString(), "", "");
                          // provider.setStateCustom();
                        },
                      )
                    : const Center(child: CircularProgressIndicator())),

            const SizedBox(width: 5),
            Expanded(
                flex: 2,
                child:
                    provider.cityList.isNotEmpty && provider.currentCity != null
                        ? DropdownButton<CityModel>(
                            value: provider.currentCity!,
                            icon: const Icon(Icons.arrow_drop_down),
                            items: provider.cityList
                                .map((e) => DropdownMenuItem<CityModel>(
                                    value: e,
                                    child: Container(
                                      width: deviceWidth * 0.25,
                                      child: Text(
                                        e.name.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              provider.currentCity = value;
                              provider.setStateCustom();
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
            // child: txtfield(controllerValue: provider.txtCity,
            //     hintTxt: Strings.city)),
          ],
        ),
        const SizedBox(height: 20),
        materialButton(
            txtButton: Strings.add,
            onPressed: () => provider.onTapAddEdit(
                  context,
                )),
        SizedBox(
          height: deviceHeight / 80,
        ),
        TextButton(
          onPressed: () {
            provider.deleteAddress();
          },
          child: Text(
            Strings.reMove,
            style: natoRegularTextStyle(color: ColorRes.grey, fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
