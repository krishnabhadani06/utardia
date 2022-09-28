
import "package:http/http.dart"as http;
import 'package:utardia/services/http_service.dart';
import 'package:utardia/util/api_endpoints.dart';
class ProductDetailApi {
  static postQueryOfProduct()async{
    try{
      http.Response? res= await HttpService.postApi(url: ApiEndPoint.profileDetail);
    }catch(e,x){
      return {};
    }
  }
}