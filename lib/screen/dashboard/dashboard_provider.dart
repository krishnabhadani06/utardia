import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/dashboard/campaigns/campaigns_provider.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/screen/edit_profile/editprofile_provider.dart';

class DashboardProvider extends ChangeNotifier {
  int currentTab = 0;
  late HomeProvider homeProvider;
  late CategoryProvider categoryProvider;
  late CartProvider cartProvider;
  late CampaingProvider campaingsProvider;

  void initAllProvider(BuildContext context) async {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    categoryProvider = Provider.of<CategoryProvider>(context, listen: false);
    //searchProvider = Provider.of<SearchProvider>(context,listen: false);
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    // await homeProvider.init();
  }

  void onBottomBarChange(int index, BuildContext context) {
    currentTab = index;
    if (index == 0) {
      homeProvider.init();
      // notifyListeners();
    } else if (index == 1) {
      //categoryProvider.init();
      // notifyListeners();
    } else if (index == 4) {
      Provider.of<EditProfileProvider>(context, listen: false)
          .allProfileDataList(context);
      // notifyListeners();
    } else {
      cartProvider.init();
      // notifyListeners();
    }

    notifyListeners();
  }
}
