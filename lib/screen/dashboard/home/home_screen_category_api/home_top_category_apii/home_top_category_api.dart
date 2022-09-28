import 'package:http/http.dart' as http;
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/home_top_category/home_all_top_category.dart';
import 'package:utardia/model/home_top_category/home_all_top_category_product.dart';
import 'package:utardia/model/home_top_category/home_top_product_detail_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class HomeTopCategoryAPiServices {
  static Future<HomeTopCategory> homeAllTopCategoryData() async {
    try {
      String url = ApiEndPoint.homeTopCategory;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return homeTopCategoryFromJson(response.body);
      } else {
        return homeTopCategoryFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeTopCategoryFromJson("");
    }
  }

  static Future<HomeTopCategoryProduct> homeTopCategoryProductData(
      String url1) async {
    try {
      String url = url1;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return homeTopCategoryProductFromJson(response.body);
      } else {
        return homeTopCategoryProductFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeTopCategoryProductFromJson("");
    }
  }

  static Future<HomeTopProductDetail> homeTopProductDetailData(
      String url) async {
    try {
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        return homeTopProductDetailFromJson(response.body);
      } else {
        return homeTopProductDetailFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return homeTopProductDetailFromJson("");
    }
  }
}
