import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/category_model/all_category_detail_model.dart';
import 'package:utardia/model/category_model/all_category_model.dart';
import 'package:utardia/model/category_model/product_description_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';

class AllCategoryProductApi {
  static Future<AllCategoryApi> allCategoryData() async {
    try {
      String url = ApiEndPoint.allCategoryProduct;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return allCategoryApiFromJson(response.body);
      } else {
        return allCategoryApiFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return allCategoryApiFromJson("");
    }
  }

  static Future<AllCategoryDetailApi> categoryProductView(String url1) async {
    try {
      String url = url1;
      http.Response? response = await HttpService.getApi(url: url);

      if (response != null && response.statusCode == 200) {
        return allCategoryDetailApiFromJson(response.body);
      } else {
        return allCategoryDetailApiFromJson("");
      }
    } catch (e) {
      showToast(e.toString());
      return allCategoryDetailApiFromJson("");
    }
  }

  static Future<ProductDescriptionApi> productDetail(String url2) async {
    try {
      String url = url2;
      http.Response? response = await HttpService.getApi(url: url);
      if (response != null && response.statusCode == 200) {
        return productDescriptionFromJson(response.body);
      } else {
        return productDescriptionFromJson("");
      }
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      showToast(e.toString());
      return productDescriptionFromJson("");
    }
  }
}
