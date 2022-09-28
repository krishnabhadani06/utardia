// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:utardia/common/toast_msg.dart';
// import 'package:utardia/model/address_model/add_address_model.dart';
// import 'package:utardia/services/http_service.dart';
// import 'package:utardia/services/pref_service.dart';
// import 'package:utardia/util/api_endpoints.dart';
// import 'package:utardia/util/pref_key.dart';
//
// class AddToAddressApi {
//   static addToAddressApi(int? countryId, int? cityId, int? stateId,
//       int? postalCode, int? phone) async {
//     try {
//       String url = ApiEndPoint.addAddress;
//       int uid = PrefService.getInt(PrefKeys.uid);
//       String accesToken = PrefService.getString(PrefKeys.accessToken);
//       Map<String, String> param = {
//         "user_id": uid.toString(),
//         "country_id": countryId.toString(),
//         "city_id": cityId.toString(),
//         "state_id": stateId.toString(),
//         "postal_code": postalCode.toString(),
//         "phone": phone.toString(),
//       };
//       http.Response? response =
//           await HttpService.postApi(url: url, body: param, header: {
//         "X-Requested-With": "XMLHttpRequest",
//         'Authorization': "Bearer $accesToken",
//       });
//       // if (response != null && response.statusCode == 200){
//       //   var responseJson = json.decode(response.body);
//       //   showToast(responseJson["message"]);
//
//       if (response != null && response.statusCode == 200) {
//         Fluttertoast.showToast(msg: "Address Successfully added");
//         var res = jsonDecode(response.body);
//         return addAddressApiFromJson(response.body);
//       } else {
//         return addAddressApiFromJson("");
//       }
//     } catch (e) {
//       showToast(e.toString());
//       return addAddressApiFromJson("");
//     }
//   }
// }
