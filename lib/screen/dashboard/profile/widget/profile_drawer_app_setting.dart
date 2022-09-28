import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/screen/dashboard/profile/widget/icon_comma.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class ProfileDrawerAppSetting extends StatelessWidget {
  const ProfileDrawerAppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Text(
          Strings.appSetting,
          style: robotoBoldTextStyle(fontSize: 12, color: ColorRes.buttonBlue),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Row(children: [
          icons(
              iconData: IconRes.icNotification, size: 28, color: ColorRes.blue),
          SizedBox(width: deviceWidth * 0.03),
          Text(
            Strings.notification,
            style:
                robotoBoldTextStyle(fontSize: 16, color: ColorRes.buttonBlue),
          ),
          Container(
            margin: const EdgeInsets.only(left: 58.0),
            // padding: const EdgeInsets.only(right: 15.0),
            child: CupertinoSwitch(
              value: provider.value,
              onChanged: (value) => provider.onChangeNotification(),
              activeColor: ColorRes.buttonBlue,
            ),
          ),
        ]),
        SizedBox(height: deviceHeight * 0.02),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              icons(
                  iconData: IconRes.icLanguage,
                  size: 28,
                  color: ColorRes.buttonBlue),
              SizedBox(width: deviceWidth * 0.03),
              Container(
                width: deviceWidth * 0.33,
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.language,
                  style: robotoBoldTextStyle(
                      fontSize: 16, color: ColorRes.buttonBlue),
                ),
              ),
              Text(
                Strings.english,
                style: robotoMediumTextStyle(
                    fontSize: 16, color: ColorRes.buttonBlue),
              ),
              icons(
                  iconData: IconRes.icNext,
                  size: 30,
                  color: ColorRes.buttonBlue),
            ],
          ),
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        InkWell(
          onTap: () {
            provider.onTapLogOut(context);
          },
          child: Row(
            children: [
              icons(
                  iconData: IconRes.icLogOut,
                  size: 28,
                  color: ColorRes.buttonBlue),
              SizedBox(width: deviceWidth * 0.03),
              Text(
                Strings.logOut,
                style: robotoBoldTextStyle(
                    fontSize: 16, color: ColorRes.buttonBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
