import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{
  bool loader = false;
  Future<void> init()async {
    await  getSearchDate();
  }

  Future<void> getSearchDate() async {
    loader = true;
    notifyListeners();
  }
}