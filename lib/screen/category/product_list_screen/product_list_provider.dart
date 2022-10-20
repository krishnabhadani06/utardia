import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/home_top_category/home_all_top_category.dart';
import 'package:utardia/model/home_top_category/home_all_top_category_product.dart';
import 'package:utardia/screen/category/product_list_screen/product_list_Screen.dart';
import 'package:utardia/screen/dashboard/home/home_screen_category_api/home_top_category_apii/home_top_category_api.dart';

class ProductListProvider extends ChangeNotifier {
  bool loader = false;

  List<HomeTopCategoryList> allHomeTopCategories = [];
  List<HomeTopCategoryProduct> products = [];
  HomeTopCategoryProduct? productList;
  HomeTopCategoryList? allHomeTopCategory;

  Future<void> init(String url, BuildContext context) async {
    loader = true;
    notifyListeners();

    getProducts(url);
    // onTapViewall(context, index, url);

    loader = false;
    notifyListeners();
  }

  void onTapViewall(BuildContext context, String index, String url) {
    Provider.of<ProductListProvider>(context, listen: false).init(url, context);
    navigator.currentState!.push(MaterialPageRoute(builder: (context) {
      getProducts(url);
      return ProductListScreen(title: index);
    }));
  }

  void getProducts(String url) async {
    loader = true;
    notifyListeners();
    HomeTopCategoryProduct products =
        await HomeTopCategoryAPiServices.homeTopCategoryProductData(url);
    if (products.status != 200) {
      productList = products;
      // showToast("went Wrong code ${products.status}");
      // await homeCategoryProduct(url);
    } else {
      productList = products;
      // await getWishList();
      // getSubCategoryData();
      if (kDebugMode) {
        print('-----------------------------${productList!.data!.length}');
      }
    }
    loader = false;
    notifyListeners();
  }
}
