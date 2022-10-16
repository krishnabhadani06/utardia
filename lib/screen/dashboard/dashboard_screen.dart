import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/category/category_screen.dart';
import 'package:utardia/screen/dashboard/campaigns/campaigns_screen.dart';
import 'package:utardia/screen/dashboard/cart/cart_screen.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/dashboard/home/home_screen.dart';
import 'package:utardia/screen/edit_profile/edit_profile_screen.dart';
import 'package:utardia/util/color_res.dart';

import 'widgets/bottom_bar.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardProvider provider = Provider.of<DashboardProvider>(context);
    provider.initAllProvider(context);
    // provider1.allProfileDataList(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorRes.appBarColor,
        ),
        child: Consumer<DashboardProvider>(builder: (con, pro, widget) {
          // pro.initAllProvider(context);
          if (pro.currentTab == 0) {
            //pro.onBottomBarChange(0, con);
            return const HomeScreen();
          } else if (pro.currentTab == 1) {
            //pro.onBottomBarChange(1, con);
            return CategoryScreen(select: 0);
            //return  const ViewAllCategoryScreen();
          } else if (pro.currentTab == 2) {
            //pro.onBottomBarChange(2, con);
            return const CartScreen();
          } else if (pro.currentTab == 3) {
            //pro.onBottomBarChange(3, con);
            return const CampaingScreen();
          } else {
            //pro.onBottomBarChange(4, con);

            //return const ProfileScreen();
            return const EditProfileScreen();
          }
        }),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
// if (provider.currentTab == 0) {
//   return const HomeScreen();
// } else {
//   if (provider.currentTab == 1) {
//   return const SearchScreen();
// } else if (provider.currentTab == 2) {
//   return const CartScreen();
// }
