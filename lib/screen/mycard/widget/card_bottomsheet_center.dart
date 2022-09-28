import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/textform_field.dart';
import 'package:utardia/screen/mycard/my_card_provider.dart';
import 'package:utardia/util/string.dart';

class CardBottomSheetCenter extends StatelessWidget {
  const CardBottomSheetCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyCardProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 17.0, top: 20.0),
          child: Row(
            children: [
              Flexible(
                  flex: 2,
                  child: txtfield(
                      validate: (val) {
                        return (val!.isEmpty) ? Strings.enterDate : null;
                      },
                      controllerValue: provider.txtExpiryDate,
                      hintTxt: Strings.expiryDate)),
              SizedBox(
                width: deviceWidth * 0.03,
              ),
              Flexible(
                  flex: 2,
                  child: txtfield(
                      validate: (val) {
                        return (val!.isEmpty) ? Strings.enterCvv : null;
                      },
                      controllerValue: provider.txtCvv,
                      hintTxt: Strings.cvv)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 17.0, top: 20.0),
          child: txtfield(
              validate: (val) {
                return (val!.isEmpty) ? Strings.enterCardHolderName : null;
              },
              controllerValue: provider.txtCardHolderName,
              hintTxt: Strings.cardHolderName),
        ),
        SizedBox(
          height: deviceHeight / 50,
        ),
        materialButton(
            txtButton: Strings.add,
            onPressed: () => provider.onTapAddCard(context)),
      ],
    );
  }
}
