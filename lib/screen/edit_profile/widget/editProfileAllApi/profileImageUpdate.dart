import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/profile_model/updateProfileImageModel.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class ProfileImageUpdateApi {
  static imageUpdate({int? id, String? filename, String? path}) async {
    try {
      String url = ApiEndPoint.profileImageUpdate;
      int uid = PrefService.getInt(PrefKeys.uid);
      // String accessToken = PrefService.getString(PrefKeys.accessToken);
      Map<String, String> param = {
        "id": id.toString(),
        "filename": filename.toString(),
        "image": path.toString(),
      };

      http.Response? response =
          await HttpService.postApi(url: url, body: param, header: {
        "X-Requested-With": "XMLHttpRequest",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.accessToken)}"
        // "Authorization": "Bearer 443|OeR04DIOgGc84IzEDWu4AHoGOpIDkulWGaB7qt5z",
      });

      if (response != null && response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        showToast(responseJson["message"]);

        return imageUpdateModelFromJson(response.body);
      } else {
        return imageUpdateModelFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return imageUpdateModelFromJson("");
    }
  }
}

// static Future<updateProfileImageModel> profileImageUpdate(int? id,String? path) async{
// try{
// int uid(PrefService.getInt(PrefKeys.uid));
// String url = "${ApiEndPoint.profileImageUpdate}${uid}";
//
// String accesToken = PrefService.getString(PrefKeys.accessToken);
//
// http.Response? response = await HttpService.postApi(url: url,body: {},header: {
//
// });
// }
// }
