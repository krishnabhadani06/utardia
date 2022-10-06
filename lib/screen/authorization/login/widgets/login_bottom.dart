import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.anyAccount,
                style: robotoMediumTextStyle(fontSize: 12),
              ),
              SizedBox(width: deviceWidth * 0.01),
              InkWell(
                onTap: () => provider.onTapCreate(),
                child: Text(
                  Strings.createNew,
                  style: robotoMediumTextStyle(
                      fontSize: 12, color: ColorRes.textBlue),
                ),
              )
            ],
          ),
          SizedBox(height: deviceHeight * 0.01),
        ],
      ),
    );
  }
}
