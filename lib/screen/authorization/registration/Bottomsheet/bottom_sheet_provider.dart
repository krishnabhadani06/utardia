  import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier{

  void onTapCloseBottomSheet(BuildContext context){
    Navigator.of(context).pop();
  }
}