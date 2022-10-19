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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorRes.appBarColor,
        ),
        child: Consumer<DashboardProvider>(builder: (con, pro, widget) {
          if (pro.currentTab == 0) {
            return const HomeScreen();
          } else if (pro.currentTab == 1) {
            return CategoryScreen(
              select: 0,
            );
          } else if (pro.currentTab == 2) {
            return const CartScreen();
          } else if (pro.currentTab == 3) {
            return const CampaingScreen();
          } else {
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
