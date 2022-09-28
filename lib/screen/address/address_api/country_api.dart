import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/address_model/country_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

// class CountryApiServices {
//   static Future<CountryApi> cityData() async {
//     try {
//       String url = ApiEndPoint.country;
//       http.Response? response = await HttpService.getApi(url: url);
//
//       if (response != null && response.statusCode == 200) {
//         return countryApiFromJson(response.body);
//       } else {
//         return countryApiFromJson("");
//       }
//     } catch (e) {
//       showToast(e.toString());
//       return countryApiFromJson("");
//     }
//   }
// }
