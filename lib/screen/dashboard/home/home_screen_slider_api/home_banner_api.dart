import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/home_screen_slider_model/home_screen_banner_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class HomeBannerApiServices {
  static Future<HomeBannerApi> homeBannerData() async {
    try {
      String url = ApiEndPoint.homeBanner;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return homeBannerApiFromJson(response.body);
      } else {
        return homeBannerApiFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeBannerApiFromJson("");
    }
  }
}
