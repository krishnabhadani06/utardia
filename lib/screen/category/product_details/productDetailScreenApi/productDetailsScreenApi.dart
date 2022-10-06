import "package:http/http.dart" as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/todays_product_model/todays_product_deal_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class ProductDetailApi {
  static postQueryOfProduct() async {
    try {
      http.Response? res =
          await HttpService.postApi(url: ApiEndPoint.profileDetail);
    } catch (e) {
      return {};
    }
  }
}

class TodayProductDealServices {
  static Future<TodaysProductDealModel> allTodaysProduct() async {
    try {
      String url = ApiEndPoint.todayProductDeal;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return todaysProductDealModelFromJson(response.body);
      } else {
        return todaysProductDealModelFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return todaysProductDealModelFromJson("");
    }
  }
}
