import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/screen/dashboard/profile/widget/icon_comma.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class ProfileDrawerGeneral extends StatelessWidget {
  const ProfileDrawerGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Text(
              Strings.general,
              style:
                  robotoBoldTextStyle(fontSize: 12, color: ColorRes.buttonBlue),
            )
          ],
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        InkWell(
          onTap: () => provider.onTapOrder(context),
          child: rowCommon(icon: IconRes.icOrders, title: Strings.order),
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        InkWell(
          onTap: () => provider.onTapFavorite(context),
          child: rowCommon(icon: IconRes.icFavourites, title: Strings.favorite),
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        InkWell(
          onTap: () => provider.onTapAddress(context),
          child: rowCommon(icon: IconRes.icAddresses, title: Strings.myAddress),
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        InkWell(
          onTap: () => provider.onTapMyCard(context),
          child: rowCommon(icon: IconRes.icCards, title: Strings.myCards),
        ),
        SizedBox(
          height: deviceHeight * 0.01,
        ),
        InkWell(
          onTap: () {},
          child: rowCommon(icon: IconRes.icMyOrders, title: Strings.myOrder),
        ),
      ],
    );
  }
}
