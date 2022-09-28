import 'package:flutter/material.dart';
import 'package:utardia/screen/mycard/my_card_screen.dart';
import 'package:utardia/screen/mycard/widget/edit_card_details.dart';

import 'widget/add_card_bottomsheet.dart';

class MyCardProvider extends ChangeNotifier {
  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtExpiryDate = TextEditingController();
  TextEditingController txtCvv = TextEditingController();
  TextEditingController txtCardHolderName = TextEditingController();
  GlobalKey<FormState> myCardFormKey = GlobalKey<FormState>();

  String type = '';

  Widget onTapNew(
    BuildContext context,
  ) {
    return const AddCardBottomSheet();
  }

  Widget onTapEdit() {
    return const EditCardDetails();
  }

  void onTapAddCard(BuildContext context) {
    // txtPincode.text;
    // txtLandmark.text;
    // txtName.text;
    if (myCardFormKey.currentState!.validate()) {
      txtCardNumber.text;
      txtCardHolderName.text;
      txtExpiryDate.text;
      txtCvv.text;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyCardScreen(),
        ),
      );
      notifyListeners();
    }
  }

  void onTapEditCard(BuildContext context) {
    // txtPincode.text;
    // txtLandmark.text;
    // txtName.text;
    if (myCardFormKey.currentState!.validate()) {
      txtCardNumber.text;
      txtCardHolderName.text;
      txtExpiryDate.text;
      txtCvv.text;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyCardScreen(),
        ),
      );
      notifyListeners();
    }
  }
}
