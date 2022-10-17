import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/model/profile_model/profile_detail_model.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/address/address_screen.dart';
import 'package:utardia/screen/authorization/login/login_screen.dart';
import 'package:utardia/screen/dashboard/change_password/change_password_screen.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_screen.dart';
import 'package:utardia/screen/dashboard/profile/all_profile_api/profile_detail_api.dart';
import 'package:utardia/screen/edit_profile/edit_profile_screen.dart';
import 'package:utardia/screen/edit_profile/editprofile_provider.dart';
import 'package:utardia/screen/mycard/my_card_screen.dart';
import 'package:utardia/screen/order/oder_screen.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/services/pref_service.dart';
import 'package:utardia/util/pref_key.dart';

class ProfileProvider extends ChangeNotifier {
  bool loader = false;
  bool value = false;
  int index = 0;

  final GlobalKey<ScaffoldState> drawerScaffoldLKey =
      GlobalKey<ScaffoldState>();

  ProfileModel? profileMode;
  // List<ProfileList> allProfileDetails = [];
  // ProfileList? allProfileDetails;

  Future<void> init() async {
    await getProfileDate();
    // await allProfileDataList();
    //  profileData(index);
  }

  Future<void> getProfileDate() async {
    loader = true;
    notifyListeners();
  }

  void onTapOrders(BuildContext con) {
    Provider.of<OrderProvider>(con, listen: false).init();
    navigator.currentState!.push(MaterialPageRoute(builder: (context) {
      return const OrderScreen();
    }));
  }

  bool onChangeNotification() {
    if (kDebugMode) {
      print(value);
    }
    value == true ? value = false : value = true;
    // value = !value;
    notifyListeners();
    if (kDebugMode) {
      print(value);
    }
    return value;
  }

  void onTapEdit(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const EditProfileScreen()));
  }

  void onTapChangePassword(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
  }

  void onTapOrder(BuildContext context) {
    Provider.of<OrderProvider>(context, listen: false).init();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const OrderScreen()));
  }

  void onTapFavorite(BuildContext context) {
    Provider.of<FavoriteProvider>(context, listen: false).getWishList();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FavoriteScreen()));
  }

  void onTapMyCard(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyCardScreen()));
  }

  void onTapAddress(BuildContext context) {
    Provider.of<AddressProvider>(context, listen: false).getAddress();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddressScreen()));
  }

  Future<void> onTapLogOut(BuildContext context) async {
    await PrefService.setValue(PrefKeys.isLogin, false);
    navigator.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  //  Future<void> profileData(int index) async {
  //    index = index;
  //    await allProfileDataList();
  //    // allProfileDetails.clear();
  //    // await allProfileDataList();
  //  }
  //
  // ProfileDetail profileModel = ProfileDetail();
  //  List<ProfileList> allProfileDetails = [];
  // // ProfileList? allProfileDetails;

  Future<void> allProfileDataList(BuildContext context) async {
    loader = true;
    notifyListeners();
    profileMode = await AllProfileDetailApi.allProfileData();
    if (profileMode != null) {
      // Logger().e(profileMode!.data);
      Provider.of<EditProfileProvider>(context, listen: false).profileModel =
          profileMode!;
      Provider.of<EditProfileProvider>(context, listen: false)
          .notifyListeners();
    } else {
      // print(allProfileDetails.length);
      if (kDebugMode) {
        // print('*******************${profileModel.data!.length}');
      }
    }
    loader = false;
    notifyListeners();
  }
}

// Future<void> profileData(int index) async {
//   loader = true;
//   index = index;
//   // await allProfileDataList();
//   // allProfileDetails.clear();
//   // await allProfileDataList();
//   notifyListeners();
// }
