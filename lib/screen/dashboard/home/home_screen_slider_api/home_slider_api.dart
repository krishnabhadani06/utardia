import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/home_screen_slider_model/home_screen_slider_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class HomeSliderApiServices {
  static Future<HomeSliderApi> homeSliderData() async {
    try {
      String url = ApiEndPoint.homeSlider;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return homeSliderApiFromJson(response.body);
      } else {
        return homeSliderApiFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeSliderApiFromJson("");
    }
  }
}
