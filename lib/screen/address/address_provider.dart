// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:utardia/common/helper.dart';
//
// import 'package:utardia/common/toast_msg.dart';
// import 'package:utardia/model/address_model/city_model.dart';
//
// import 'package:utardia/model/address_model/getUserAddressModel.dart';
// import 'package:utardia/model/address_model/state_model.dart';
// import 'package:utardia/screen/address/address_screen.dart';
// import 'package:utardia/screen/address/widget/address_bottom_sheet.dart';
// import 'package:utardia/screen/address/widget/edit_address_detail/edit_address_detail.dart';
// import 'package:utardia/services/http_service.dart';
// import 'package:utardia/services/pref_service.dart';
//
// import 'package:utardia/util/api_endpoints.dart';
// import 'package:utardia/util/pref_key.dart';
//
// import 'package:utardia/util/string.dart';
// import 'package:http/http.dart' as http;
//

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/common/validations.dart';
import 'package:utardia/model/address_model/city_model.dart';
// import 'package:utardia/model/address_model/country_model.dart';
import 'package:utardia/model/address_model/getUserAddressModel.dart';
import 'package:utardia/model/address_model/state_model.dart';
import 'package:utardia/screen/address/widget/address_bottom_sheet.dart';
import 'package:utardia/screen/address/widget/edit_address_detail/edit_address_detail.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';
import 'package:utardia/util/string.dart';

class AddressProvider extends ChangeNotifier {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtLandmark = TextEditingController();
  TextEditingController txtPincode = TextEditingController();
  TextEditingController txtState = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  final key1 = GlobalKey<FormState>();

  String isSelect = "Home";
  bool isReadOnly = false;
  Data? currentAddress;
  bool loader = false;
  List<StateModel> stateList = [];
  StateModel? currentState;
  List<CityModel> cityList = [];
  CityModel? currentCity;

  Country? currentCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "9123456789",
      displayName: "India",
      displayNameNoCountryCode: "India (IN)",
      e164Key: "91-IN-0");

  String? errorTextName;
  String? errorTextPhone;
  String? errorTextAddress;
  String? errorTextLandmark;
  String? errorTextPincode;

  UserGetAddress? userAddress;
  bool isHome = true, isWork = false, isOther = false;

  void onTapCountry(Country country) {
    currentCountry = country;
  }

  void setStateCustom() {
    notifyListeners();
  }

  void nameValidation() {
    errorTextName = validateName(txtName.text);
    notifyListeners();
  }

  void addressValidation() {
    errorTextAddress = validateAddress(txtAddress.text);
    notifyListeners();
  }

  void phoneValidation() {
    errorTextPhone = phoneNumberValidator(txtContact.text);
    notifyListeners();
  }

  void landMarkValidation() {
    errorTextLandmark = validateLandMark(txtLandmark.text);
    notifyListeners();
  }

  void pinCodeValidation() {
    errorTextPincode = validatePinCode(txtPincode.text);
    notifyListeners();
  }

  Widget onTapAddressBottomSheet() {
    return const AddressBottomSheet();
  }

  Widget onTapEditAddress(Data Addresss) {
    currentAddress = Addresss;

    if (Addresss.countryName!.isEmpty) {
    } else {}

    return const EditAddressDetail();
  }

  void onTapButton(int index) {
    if (index == 0) {
      isSelect = Strings.home;
    } else if (index == 1) {
      isSelect = Strings.work;
    } else {
      isSelect = Strings.other;
    }
    notifyListeners();
  }

  void postAddress({bool isNew = false, String id = ""}) {
    if (isNew) {
      postNewAddress();
    } else {
      updateAddress(id);
    }
  }

  void deleteAddress() async {
    try {
      String url = ApiEndPoint.deleteAddress;
      http.Response? res = await HttpService.getApi(
        url: "$url${currentAddress!.id}",
        header: {
          "Authorization":
              "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
        },
      );
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        showToast(data['message']);
        if (data['result'] == true) {
          getAddress();
          navigator.currentState!.pop();
        }
      } else {
        showToast("went wrong ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void updateAddress(String? addressId) async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.updateAddss, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      }, body: {
        "id": "$addressId",
        "address": txtAddress.text.toString(),
        "country_id": "${currentState!.countryId}",
        "city_id": "${currentCity!.id}",
        "state_id": "${currentState!.id}",
        "postal_code": txtPincode.text.toString(),
        "phone": "${currentCountry!.phoneCode}${txtContact.text.toString()}",
        "work_type": isSelect
      });

      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> data =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        showToast(data['message']);
        if (data['result'] == true) {
          getAddress();
          navigator.currentState!.pop();
        }
      } else {
        showToast("went Wrong ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void postNewAddress() async {
    if (txtName.text.isEmpty ||
        txtAddress.text.isEmpty ||
        txtLandmark.text.isEmpty ||
        txtContact.text.isEmpty ||
        txtPincode.text.isEmpty) {
      showToast("Please Fill all details");
    } else {
      try {
        String url = ApiEndPoint.addAddress;
        http.Response? res = await HttpService.postApi(url: url, header: {
          "Authorization":
              "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
        }, body: {
          "user_id": PrefService.getString(PrefKeys.uid),
          "address":
              "${txtAddress.text.toString()}${txtLandmark.text.toString()}",
          "country_id": "${currentState!.countryId}",
          "city_id": "${currentCity!.id}",
          "state_id": "${currentState!.id}",
          "work_type": isSelect,
          "postal_code": txtPincode.text.toString(),
          "phone": txtContact.text.toString()
        });

        if (res != null && res.statusCode == 200) {
          Map<dynamic, dynamic> result =
              jsonDecode(res.body) as Map<dynamic, dynamic>;
          showToast(result['message']);
          if (result['result'] == true) {
            getAddress();
            onTapCloseBottomSheet();
            // navigator.currentState!.pop();
          }
        } else {
          showToast("went wrong !${res!.statusCode}");
        }
      } catch (e, x) {
        kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
        showToast(e.toString());
      }
    }
  }

  void onTapNewAdd(BuildContext context) {
    nameValidation();
    addressValidation();
    phoneValidation();
    landMarkValidation();
    pinCodeValidation();
    if (errorTextName == null &&
        errorTextPhone == null &&
        errorTextAddress == null &&
        errorTextLandmark == null &&
        errorTextPincode == null) {
      postAddress(isNew: true);
      notifyListeners();
    }
  }

  void onTapAddEdit(BuildContext context) {
    if (key1.currentState!.validate()) {
      txtPincode;
      txtLandmark;
      txtName;
      txtAddress;
      txtContact;
      postAddress(
        id: currentAddress!.id.toString(),
        isNew: false,
      );
      notifyListeners();
    }
  }

  void getStates(String StateId, String CityId) async {
    String url = '';
    try {
      url = "${ApiEndPoint.getStateByCountries}101";
      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        List<dynamic> list = map['data'] as List<dynamic>;
        stateList = list.map((e) {
          return StateModel.fromJson(e);
        }).toList();
        if (stateList.isNotEmpty) {
          if (CityId != "" && StateId != "") {
            for (var element in stateList) {
              if (element.id.toString() == StateId) {
                currentState = element;
              }
            }
            if (kDebugMode) {
              print(currentState == null);
            }
            if (currentState != null) {
              getCity(currentState!.id.toString(), CityId, StateId);
            }

            notifyListeners();
          } else {
            currentState = stateList[0];
            getCity(currentState!.id.toString(), CityId, StateId);
            // notifyListeners();
          }
        }
      } else {
        showToast("went Wrong code ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    }
  }

  void getCity(String id, String CityId, String StateId) async {
    String url = '';
    if (cityList.isNotEmpty) {
      cityList.clear();
      notifyListeners();
    }
    try {
      url = "${ApiEndPoint.getCitiesByStates}$id";

      http.Response? res = await HttpService.getApi(url: url);
      if (res != null && res.statusCode == 200) {
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        List<dynamic> list = map['data'] as List<dynamic>;
        cityList = list.map((e) {
          return CityModel.fromJson(e);
        }).toList();

        if (cityList.isNotEmpty) {
          if (StateId == id) {
            for (var element in cityList) {
              if (element.id.toString() == CityId) {
                currentCity = element;
              }
            }
          } else {
            currentCity = cityList[0];
          }
        } else {
          currentCity = cityList[0];
        }
      } else {
        showToast("went Wrong !! code ${res!.statusCode}");
      }
      notifyListeners();
    } on RangeError catch (e) {
      if (kDebugMode) {
        print("hello$e");
      }
      currentCity = CityModel.fromJson({});
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      notifyListeners();
    }
  }

  void onTapCloseBottomSheet() {
    if (currentState != null || currentCity != null) {
      currentState = null;
      currentCity = null;
      stateList.clear();
      cityList.clear();

      isSelect = Strings.home;
      txtName.clear();
      txtAddress.clear();
      txtLandmark.clear();
      txtPincode.clear();
      txtContact.clear();
      // txtName.clear();

    }
    navigator.currentState!.pop();
  }

  void init(
      {bool? isAdd,
      String? state_id = "",
      String? city_id = "",
      String? workType,
      Data? data}) {
    if (isAdd == true) {
      getStates(state_id.toString(), city_id.toString());
    } else {
      getStates(state_id.toString(), city_id.toString());
      isSelect = workType.toString();
      if (data != null) {
        txtAddress.text = data.address ?? "";
        txtContact.text =
            data.phone.toString().substring(3, data.phone!.length).toString();
        txtLandmark.text = data.address ?? "";
        txtPincode.text = data.postalCode ?? "";
      }
    }
  }

  void getAddress() async {
    loader = true;
    notifyListeners();
    try {
      http.Response? res = await HttpService.getApi(
          url:
              "${ApiEndPoint.getAddress}${PrefService.getString(PrefKeys.uid)}",
          header: {
            "Authorization":
                "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
          });
      if (res != null && res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body) as Map<String, dynamic>;

        userAddress = UserGetAddress.fromJson(map);
        if (userAddress != null) {
          notifyListeners();
        }
      } else {
        showToast("went Wrong ${res!.statusCode}");
      }
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
      loader = false;
      notifyListeners();
    } finally {
      loader = false;
      notifyListeners();
    }
  }

  IconData? getIcon(String? workType) {
    if (workType == Strings.home) {
      return Icons.home;
    } else if (workType == Strings.work) {
      return Icons.business_center;
    } else {
      return Icons.location_on;
    }
  }
}
