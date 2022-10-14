// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utardia/common/toast_msg.dart';
import 'package:utardia/model/addToCartModel/addToCart_model.dart';
import 'package:utardia/services/http_service.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/api_endpoints.dart';
import 'package:utardia/util/pref_key.dart';

class AddToCartApi {
  static addToCartApi({
    String? productId,
    String? variant,
    String? quantity,
    String? userid,
    String? barrerToken,
  }) async {
    try {
      String url = ApiEndPoint.addToCart;

      String accesToken = PrefService.getString(PrefKeys.accessToken);
      Map<String, dynamic> param = {
        "id": productId.toString(),
        "variant": variant.toString(),
        "user_id": userid.toString(),
        "quantity": quantity.toString()
      };

      http.Response? response =
          await HttpService.postApi(url: url, body: param, header: {
        "X-Requested-With": "XMLHttpRequest",
        'Authorization': "Bearer $accesToken",
      });
      if (response != null && response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        showToast(responseJson["message"]);
        return AddToCartModel.fromJson(json.decode(response.body));
      } else {
        showToast(jsonDecode(response!.body)['message']);
        return AddToCartModel.fromJson({});
      }
    } catch (e, x) {
      Logger().e(e.toString() + x.toString());
      showToast(e.toString() + x.toString());
      return AddToCartModel.fromJson({});
    }
  }
}
