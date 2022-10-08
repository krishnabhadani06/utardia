import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/profile_model/profile_detail_model.dart';
import 'package:utardia/screen/dashboard/profile/all_profile_api/profile_detail_api.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class EditProfileProvider extends ChangeNotifier {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtContact = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();
  Country? intialCountry;
  String? intialCountryCode;

  ProfileModel? profileModel;
  Country? currentCountry;
  XFile? img;
  bool loader = false;
  void getImage() async {
    img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      notifyListeners();
    } else {
      return;
    }
  }

  Future<void> allProfileDataList(BuildContext context) async {
    ProfileModel? profileMode1;
    loader = true;
    notifyListeners();
    profileMode1 = await AllProfileDetailApi.allProfileData();
    if (profileModel != null) {
      profileModel = profileMode1;
      init();
    } else {
      // print(allProfileDetails.length);
      if (kDebugMode) {
        // print('*******************${profileModel.data!.length}');
      }
    }
    loader = false;
    notifyListeners();
  }

  void onTapUpdate(BuildContext context) async {
    if (img != null) {
      updateImage();
      if (txtName.text.toString() != profileModel!.data![0].name ||
          txtEmail.text.toString() != profileModel!.data![0].email ||
          txtAddress.text.toString() != profileModel!.data![0].address ||
          txtContact.text.toString() !=
              profileModel!.data![0].phone.toString()) {
        updateProfile();
      }
    } else {
      updateProfile();
      String path = profileModel!.data![0].avatarOriginal.toString();
      if (path != profileModel!.data![0].avatarOriginal.toString()) {
        updateImage();
      }
    }

  void updateProfile() async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.updateProfile, body: {
        "id": profileModel!.data![0].id.toString(),
        "name": txtName.text.toString(),
        "email": txtEmail.text.toString(),
        "address": txtAddress.text.toString(),
        "phone": txtContact.text.toString(),
        "country": "${intialCountry!.name.toString()}",
      });
      if (res != null && res.statusCode == 200) {
        Logger().e(jsonDecode(res.body));
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        showToast(map['message']);
      }
    } catch (e, x) {
      Logger().e(x.toString());
    }
  }

  void init() {
    getProFileData();
  }

  void updateImage() async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.profileImageUpdate, body: {
        "id": profileModel!.data![0].id.toString(),
        // "id": 190.toString(),
        "filename":
            img == null ? "" : img!.path.toString().split("/").last.toString(),
        "image": img == null ? "" : img!.path.toString()
      }, header: {
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
      });
      if (res != null && res.statusCode == 200) {
        Logger().e(jsonDecode(res.body));
        Map<dynamic, dynamic> map =
            jsonDecode(res.body) as Map<dynamic, dynamic>;
        await PrefService.setValue(PrefKeys.profileImage, map['path']);
        if (map['result']) {
          getProFileData();
        }
        showToast(map['message']);
      }
    } catch (e, x) {
      showToast(e.toString());
      Logger().e(x.toString());
    }
  }

  void getProFileData() async {
    try {
      profileModel = await AllProfileDetailApi.allProfileData();
      if (profileModel != null) {
        txtName.text = profileModel!.data![0].name ?? "";
        txtAddress.text =
            "${profileModel!.data![0].address!.data != null ? profileModel!.data![0].address!.data![0].address ?? "" : "No Address"}";
        txtContact.text = profileModel!.data![0].phone ?? "";
        txtEmail.text = profileModel!.data![0].email ?? "";
      }
      notifyListeners();
    } catch (e, x) {
      kDebugMode ? Logger().e(e.toString() + x.toString()) : "";
      showToast(e.toString());
    } finally {
      notifyListeners();
    }
  }

  void onTapCountry(Country country) {
    currentCountry = country;
  }
}
