import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/address_model/city_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

// class CityApiServices {
//   static Future<CityApi> cityData() async {
//     try {
//       String url = ApiEndPoint.city;
//       http.Response? response = await HttpService.getApi(url: url);
//
//       if (response != null && response.statusCode == 200) {
//         return cityApiFromJson(response.body);
//       } else {
//         return cityApiFromJson("");
//       }
//     } catch (e) {
//       showToast(e.toString());
//       return cityApiFromJson("");
//     }
//   }
// }
