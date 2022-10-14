import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/screen/dashboard/profile/widget/icon_comma.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class ProfileDrawerAccount extends StatefulWidget {
  const ProfileDrawerAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileDrawerAccount> createState() => _ProfileDrawerAccountState();
}

class _ProfileDrawerAccountState extends State<ProfileDrawerAccount> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<ProfileProvider>(context, listen: false)
      //     .allProfileDataList(context);
      //Provider.of<EditProfileProvider>(context, listen: false).profilemodel = widget.profilemode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    //final provider1 = Provider.of<EditProfileProvider>(context);
    return Consumer<ProfileProvider>(builder: (context, provide, widget) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 13.0),
              /* child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: ColorRes.white,
                    child: ClipOval(
                      child: Image.network(
                        PrefService.getString(PrefKeys.profileImage),
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.error);
                          //return const Image(image: AssetImage(AssetsImagesRes.girl4));
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.welcome,
                        style: robotoRegularTextStyle(
                            fontSize: 12, color: ColorRes.grey),
                      ),
                      Text(
                        provide.profileMode!.data != null
                            ? provide.profileMode!.data![0].name.toString()
                            : "dvhvbh",
                        //`Strings.userName,
                        style: robotoRegularTextStyle(
                            fontSize: 16, color: ColorRes.black),
                      ),
                    ],
                  ),
                ],
              ),*/
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    Strings.account,
                    style: robotoBoldTextStyle(
                            fontSize: 12, color: ColorRes.buttonBlue)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ),
            InkWell(
              onTap: () => provider.onTapEdit(context),
              child: rowCommon(
                  icon: Image.asset(AssetsImagesRes.userIcon),
                  title: Strings.editProfile),
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ),
            InkWell(
              onTap: () => provider.onTapChangePassword(context),
              child: rowCommon(
                  icon: Image.asset(AssetsImagesRes.passwordIcon),
                  title: Strings.changePassword),
            ),
          ],
        ),
      );
    });
  }
}

// Container(
//   height: 55,
//   width: 55,
//   decoration: const BoxDecoration(
//     shape: BoxShape.circle,
//     color: ColorRes.white,
//   ),
//   child: CachedNetworkImage(
//     //imageUrl: imgPath,
//      imageUrl: 'https://picsum.photos/250?image=9',
//     progressIndicatorBuilder: (context, url, downloadProgress) =>
//         CircularProgressIndicator(value: downloadProgress.progress),
//     errorWidget: (context, url, error) => Image.asset(AssetsImagesRes.buy2GetFreeImage),
//   )
// ),

// CircleAvatar(
//   radius: 30.0,
//   backgroundImage: NetworkImage(
//       //'https://picsum.photos/250?image=9',
//       "https://dharmeshs39.sg-host.com/public/${provide.profileMode!=null?provide.profileMode!.data![0].avatarOriginal.toString():""}",
//           fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//           return const Image(image: AssetImage(AssetsImagesRes.girl4));
//         },
//   ),
//   backgroundColor: Colors.transparent,
// ),
