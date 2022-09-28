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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: deviceHeight * 0.02),
      Text(
        "Address",
        style: natoMediumTextStyle(fontSize: 15, color: ColorRes.grey),
      ),
      Card(
        elevation: 4.0,
        shadowColor: ColorRes.borderblue.withOpacity(0.7),
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: txtFieldAddress(
            validate: (val) {
              return (val!.isEmpty) ? Strings.pleaseEnterAddress : null;
            },
            controllerValue: provider.txtAddress,
            hintTxt: Strings.address),
      ),
      SizedBox(height: deviceHeight * 0.02),
      Card(
        elevation: 4.0,
        shadowColor: ColorRes.borderblue.withOpacity(0.7),
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: txtFieldAddress(
            validate: (val) {
              return (val!.isEmpty) ? Strings.enterLandmark : null;
            },
            controllerValue: provider.txtLandmark,
            hintTxt: Strings.landMarks),
      ),
      SizedBox(height: deviceHeight * 0.02),
      Text(
        "Pincode",
        style: natoMediumTextStyle(fontSize: 15, color: ColorRes.grey),
      ),
      Card(
        elevation: 4.0,
        shadowColor: ColorRes.borderblue.withOpacity(0.7),
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: txtFieldAddress(
            validate: (val) {
              if (val!.length != 6) return Strings.enterpincode;
              return (val.isEmpty) ? Strings.enterpincode : null;
            },
            controllerValue: provider.txtPincode,
            hintTxt: Strings.pinCode),
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
    ]);
  }
}

/*Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: deviceHeight * 0.055,
                // width: deviceWidth * 0.09,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorRes.lightGrey, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: provider.stateList.length != 0
                    ? DropdownButton<StateModel>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: provider.currentState!,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: provider.stateList
                            .map((e) => DropdownMenuItem<StateModel>(
                                    child: Container(
                                  width: 60,
                                  child: Text(
                                    e.name.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )))
                            .toList(),
                        onChanged: (value) {
                          provider.currentState = value;
                          provider
                              .getCity(provider.currentState!.id.toString());
                        },
                      )
                    : const Center(child: CircularProgressIndicator())),
            // child: provider.stateList.length != 0
            // ? DropdownButton<StateModel>(
            // isExpanded: true,
            // underline: const SizedBox(),
            // value: provider.currentState!,
            // hint: Text("city"),
            // icon: const Icon(Icons.arrow_drop_down),
            // items: provider.stateList
            //     .map((e) => DropdownMenuItem<StateModel>(
            // child: Container(
            // width: 60,
            // child: Text(
            // e.name.toString(),
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
            // ),
            // )))
            //     .toList(),
            // onChanged: (value) {
            // provider.currentState = value;
            // provider
            //     .getCity(provider.currentState!.id.toString());
            // },
            // )
            //     : const Center(child: CircularProgressIndicator()))
          ),
          SizedBox(width: deviceWidth * 0.08),
          Expanded(
            flex: 2,
            child: Container(
              height: deviceHeight * 0.055,
              width: 155,
              decoration: BoxDecoration(
                border: Border.all(color: ColorRes.lightGrey, width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              // child: DropdownButton(
              //     value: provider.abc,
              //     icon: const Icon(Icons.arrow_drop_down),
              //     items:
              //         ['PROJECT', 'INTERMEDIATE', 'EXPERT'].map((String items) {
              //       return DropdownMenuItem(
              //         value: items,
              //         child: Text(items),
              //       );
              //     }).toList(),
              //     onChanged: (String? newValue) =>
              //         provider.onChange(provider.abc = newValue!.toString())
              //     //   setState(() {
              //     //     abc = newValue!.toString();
              //     //   });
              //     // },
              //     ),
            ),
          ),
        ],
      ),*/
