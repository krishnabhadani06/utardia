import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/productModel/today_product_detail_model.dart';
import 'package:utardia/services/http_service.dart';

class ProductTodayApi {
  static Future<TodayProductDetail> productDetailApi() async {
    try {
      String url = "ApiEndPoint.productTodayDetail";
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        return todayProductDetailFromJson(response.body);
      } else {
        return todayProductDetailFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return todayProductDetailFromJson("");
    }
  }
}
