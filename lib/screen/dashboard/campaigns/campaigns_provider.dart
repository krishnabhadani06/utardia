import 'package:flutter/material.dart';

class CampaingProvider extends ChangeNotifier{
  bool loader = false;
  Future<void> init()async {
    await  getCampaingDate();
  }

  Future<void> getCampaingDate() async {
    loader = true;
    notifyListeners();
  }


}