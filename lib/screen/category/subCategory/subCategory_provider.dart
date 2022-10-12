import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/category/subCategory/subCategory.dart';

class SubCategoryProvider extends ChangeNotifier {
  void onTapSubCategory() {
    navigator.currentState!.push(MaterialPageRoute(builder: (context) {
      return const SubCategoryScreen();
    }));
  }
}
