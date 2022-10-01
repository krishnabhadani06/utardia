import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/model/address_model/city_model.dart';
import 'package:utardia/model/address_model/state_model.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/common_textfield.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class AddressBottomSheetBottom extends StatelessWidget {
  const AddressBottomSheetBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressProvider>(context);
    // provider.init();
    return Padding(
      padding: const EdgeInsets.only(left: 7.0, right: 6.0),
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
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.only(right: 25),
          alignment: Alignment.centerLeft,
          height: 15,
          width: double.infinity,
          // color: Colors.yellow,
          child: Text(
            provider.errorTextAddress ?? "",
            style: robotoRegularTextStyle(
              fontSize: 12,
              color: ColorRes.red,
            ),
          ),
        ),
        SizedBox(height: deviceHeight * 0.02),
        CommonTextFieldAddress(
            controller: provider.txtLandmark,
            obscure: false,
            hintText: Strings.landMarks,
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
            provider.errorTextLandmark ?? "",
            style: robotoRegularTextStyle(
              fontSize: 12,
              color: ColorRes.red,
            ),
          ),
        ),
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
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.only(right: 25),
          alignment: Alignment.centerLeft,
          height: 15,
          width: double.infinity,
          // color: Colors.yellow,
          child: Text(
            provider.errorTextPincode ?? "",
            style: robotoRegularTextStyle(
              fontSize: 12,
              color: ColorRes.red,
            ),
          ),
        ),
        SizedBox(height: deviceHeight * 0.02),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                  child: provider.stateList.isNotEmpty
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
            ),
            Expanded(
              flex: 1,
              child: AnimatedContainer(
                  curve: Curves.ease,
                  duration: const Duration(seconds: 1),
                  child: provider.cityList.length != 0
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
                      : const Center(child: CircularProgressIndicator())),
            ),
          ],
        ),
        SizedBox(height: deviceHeight * 0.02),
        materialButton(
            txtButton: Strings.add,
            onPressed: () => provider.onTapNewAdd(context)),
      ]),
    );
  }
}
