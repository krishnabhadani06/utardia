import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

import '../../../../model/profile_model/profile_detail_model.dart';

class AllProfileDetailApi {
  static Future<ProfileModel> allProfileData() async {
    try {
      // PrefService.init();
      // Map<String, dynamic> userData =
      //     jsonDecode(PrefService.getString("UserData").toString())
      //         as Map<String, dynamic>;
      // Logger().d(userData);

      String url =
          "${ApiEndPoint.profileDetail}${PrefService.getString(PrefKeys.uid).toString()}";
      // Logger().e(url);
      http.Response? response = await HttpService.getApi(url: url, header: {
        "Authorization":
            "Bearer ${PrefService.getString(PrefKeys.accessToken).toString()}"
      });
      // Logger().i(response!.body);
      if (response != null && response.statusCode == 200) {
        Logger().e(jsonDecode(response.body));
        return ProfileModel.fromJson(jsonDecode(response.body));
      } else {
        showToast("eror code from api ${response!.statusCode}");
        return ProfileModel();
      }
    } catch (e, x) {
      Logger().i(x.toString() + e.toString());
      showToast(e.toString());
      return ProfileModel();
    }
  }
}

// class AllProfileDetailApi{
//
//   static Future<profileModel> allProfileData()async {
//     try {
//       PrefService.init();
//      List<dynamic> userData= PrefService.getList("UserData");
//      // MapEntry<dynamic,dynamic> map=jsonDecode(userData[userData.length-1].toString());
//      //      Logger().d(map);
//      // String url = ApiEndPoint.profileDetail+"190";
//       String url = "${ApiEndPoint.profileDetail}190";
//
//       Logger().e(url);
//       http.Response? response = await HttpService.getApi(url: url,
//       header: {
//         "Authorization":"Bearer 64|8bdfMWvqVS06ClSymgGy6cpXIuzFIxvelRu3jK3D"
//       }
//       );
//       Logger().i(response!.body);
//       if (response != null && response.statusCode == 200){
//         return profileModel.fromJson(jsonDecode(response.body));
//
//       }else {
//         return profileModel();
//       }
//       }catch(e,x){
//       Logger().i(x.toString());
//       showToast(e.toString());
//       return profileModel();
//     }
//   }
// }
