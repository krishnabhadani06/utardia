import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/home/widget/home_center.dart';
import 'package:utardia/screen/dashboard/profile/widget/profile_drawer.dart';
import 'package:utardia/screen/dashboard/search/search_screen.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';

import 'widget/home_bottom.dart';
import 'widget/home_top.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (con, provider, widget) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorRes.appBarColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  right: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    // method to show the search bar
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegate());
                  },
                  // onPressed: () => provider.onTapSearch(context),
                  icon: Icon(
                    IconRes.icSearch,
                    size: 30,
                  ),
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                //on drawer menu pressed
                if (provider.drawerScaffoldLKey.currentState!.isDrawerOpen) {
                  //if drawer is open, then close the drawer
                  Navigator.pop(context);
                } else {
                  provider.drawerScaffoldLKey.currentState!.openDrawer();
                  //if drawer is closed then open the drawer.
                }
              },
              icon: const Icon(Icons.menu),
            ),
          ),
          body: Scaffold(
            drawerEnableOpenDragGesture: false,
            key: provider.drawerScaffoldLKey,
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: ColorRes.lightGrey, //desired color
              ),
              child: Drawer(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 23.0),
                        child: Column(
                          children: const [
                            ProfileDrawer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //body:SingleChildScrollView(
            body: provider.loader
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      //itemCount: 1 + 1 + provider.allCategoriesProducts.length,
                      itemCount: 1 + 1 + provider.allHomeTopProducts.length,
                      padding: EdgeInsets.only(top: deviceHeight * 0.02),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const HomeTop();
                        } else if (index == 1) {
                          return const HomeCenter();
                        } else {
                          return provider.homeBottomLoader
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : HomeBottom(index: index - 2);
                        }
                      },
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
