import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/profile/widget/profile_drawer_account.dart';
import 'package:utardia/screen/dashboard/profile/widget/profile_drawer_app_setting.dart';

import 'profile_drawer_general.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileDrawerAccount(),
        SizedBox(height: deviceHeight / 35),
        const ProfileDrawerGeneral(),
        SizedBox(height: deviceHeight / 50),
        const ProfileDrawerAppSetting(),
      ],
    );
  }
}
