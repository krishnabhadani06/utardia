
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
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
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 12.0),
                  child: const Divider(
                    color: ColorRes.lightGrey,
                    thickness: 1.5,
                    height: 2,
                  ),
                ),
              ),
              Text(Strings.or,
                  style: robotoRegularTextStyle(
                      color: ColorRes.textLightGrey, fontSize: 16)),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, right: 10.0),
                  child: const Divider(
                    color: ColorRes.lightGrey,
                    thickness: 1.5,
                    height: 2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsImagesRes.googleImage,
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.09,
              ),
              SizedBox(
                width: deviceWidth * 0.10,
              ),
              Image.asset(
                AssetsImagesRes.facebookImage,
                height: deviceHeight * 0.05,
                width: deviceWidth * 0.09,
              ),
            ],
          ),
          SizedBox(
            height: deviceHeight * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.anyAccount,
                style: robotoMediumTextStyle(fontSize: 12),
              ),
              InkWell(
                onTap: () => provider.onTapCreate(),
                child: Text(
                  Strings.createNew,
                  style: robotoMediumTextStyle(
                      fontSize: 12, color: ColorRes.textBlue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
