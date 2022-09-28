import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/category_model/all_category_detail_model.dart';

import 'view_screen.dart';

class ViewAllCategoryProvider extends ChangeNotifier {
  bool loader = false;

  AllCategoryDetailApi? homeViewCategoryProduct;

  void onTapViewCategory() {
    navigator.currentState!.push(
        MaterialPageRoute(builder: (context) => const ViewAllCategoryScreen()));
  }
  // void onTapViewProduct(int index){
  //   navigator.currentState!.push(
  //       MaterialPageRoute(builder: (context) =>  ViewProductScreen(select: 0,)));
  // }

  // void onTapViewProduct(int index,BuildContext context){
  //   Provider.of<ViewAllCategoryProvider>(context,listen: false).homeViewProduct(allCategories[index].links!.products!);
  //   navigator.currentState!.push(
  //      MaterialPageRoute(builder: (context) => const ViewProductScreen()));
  // }

  // Future<void> homeViewProduct(String url) async{
  //   loader = true;
  //   AllCategoryDetailApi products = await AllCategoryProductApi.categoryProductView(url);
  //   if(products.status !=200){
  //     homeViewProduct(url);
  //   }else {
  //     homeViewCategoryProduct = products;
  //     print('-----------------------------${homeViewCategoryProduct!.data!.length}');
  //     loader = false;
  //     notifyListeners();
  //   }
  // }

  // AllCategoryApi categoryModel = AllCategoryApi();
  // List<AllCategory> allCategories = [];
  //
  // List<AllCategoryDetailApi> allCategoriesProducts = [];

// Future<void> viewCategory() async {
//   loader = true;
//   allCategoriesProducts.clear(); /// homeTop view all
//   await allCategoryData();/// homeTop view all
//   await getAllCategoriesProducts(); /// homeTop view all
//   loader = false;
//   // notifyListeners();
// }

  // ///homeTop view all
  // Future<void> allCategoryData() async {
  //   loader = true;
  //    notifyListeners();
  //   AllCategoryApi viewCategoryModel= await AllCategoryProductApi.allCategoryData();
  //   if (viewCategoryModel.status != 200) {
  //     allCategoryData();
  //   } else {
  //     allCategories.clear();
  //     allCategories = viewCategoryModel.data!;
  //     getAllCategoriesProducts();
  //     print(allCategories);
  //     //loader = false;
  //     //notifyListeners();
  //   }
  // }
  //
  // Future<void> getAllCategoriesProducts() async {
  //   allCategoriesProducts =List.generate(allCategories.length, (index) => AllCategoryDetailApi());
  //   int index1 = 0;
  //   for(var element in allCategories){
  //     await allCategoryProduct(element.links!.products!.index1);
  //     index1++;
  //   }
  //   loader = false;
  //   notifyListeners();
  //   // allCategoriesProducts.clear();
  //   // for (var element in allCategories) {
  //   //   await allCategoryProduct(element.links!.products!);
  //   // }
  // }
  //
  // Future<void> allCategoryProduct(String url,int index) async {
  //   loader = true;
  //   notifyListeners();
  //   AllCategoryDetailApi product = await AllCategoryProductApi.categoryProductView(url);
  //   if (product.status != 200) {
  //     allCategoryProduct(url,index);
  //   } else {
  //     //allCategoriesProducts.clear();
  //    // allCategoriesProducts.add(product);
  //     allCategoriesProducts[index] = product;
  //     print('-----------------------------${product.data!.length}');
  //     loader = false;
  //     notifyListeners();
  //   }
  // }

}
