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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: deviceHeight * 0.02),
        Text(
          "Address",
          style: natoMediumTextStyle(fontSize: 15, color: ColorRes.grey),
        ),
        CommonTextFieldAddress(
            controller: provider.txtAddress,
            obscure: false,
            hintText: Strings.address,
            error: false,
            width: deviceWidth,
            border: false),
        SizedBox(height: deviceHeight * 0.02),
        CommonTextFieldAddress(
            controller: provider.txtLandmark,
            obscure: false,
            hintText: Strings.landMarks,
            error: false,
            width: deviceWidth,
            border: false),
        SizedBox(height: deviceHeight * 0.02),
        Text(
          "Pincode",
          style: natoMediumTextStyle(fontSize: 15, color: ColorRes.grey),
        ),
        CommonTextFieldAddress(
            controller: provider.txtPincode,
            obscure: false,
            hintText: Strings.pinCode,
            error: false,
            width: deviceWidth,
            border: false),
        SizedBox(height: deviceHeight * 0.02),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: provider.stateList.isNotEmpty &&
                        provider.currentState != null
                    ? Container(
                        height: deviceHeight * 0.06,
                        width: deviceWidth * 0.20,
                        padding: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          border: Border.all(
                            color: ColorRes.lightGrey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorRes.black.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 0, //spread radius
                              blurRadius: 3, // blur radius
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: DropdownButton<StateModel>(
                          value: provider.currentState!,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: provider.stateList
                              .map((e) => DropdownMenuItem<StateModel>(
                                  value: e,
                                  child: Container(
                                    width: deviceWidth * 0.20,
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
                        ),
                      )
                    : const Center(child: CircularProgressIndicator())),

            const SizedBox(width: 10),
            Expanded(
                flex: 2,
                child: provider.cityList.isNotEmpty &&
                        provider.currentCity != null
                    ? Container(
                        height: deviceHeight * 0.06,
                        width: deviceWidth * 0.20,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          border: Border.all(
                            color: ColorRes.lightGrey,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorRes.black.withOpacity(0.3),
                              //color of shadow
                              spreadRadius: 0, //spread radius
                              blurRadius: 3, // blur radius
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: DropdownButton<CityModel>(
                          value: provider.currentCity!,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: provider.cityList
                              .map((e) => DropdownMenuItem<CityModel>(
                                  value: e,
                                  child: Container(
                                    width: deviceWidth * 0.20,
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
                        ),
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
          child: Center(
            child: Text(
              Strings.reMove,
              style: natoRegularTextStyle(color: ColorRes.grey, fontSize: 18),
            ),
          ),
        ),
      ]),
    );
  }
}
