import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/common_loader.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/home/widget/home_center.dart';
import 'package:utardia/screen/dashboard/profile/widget/profile_drawer.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';

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
            leading: InkWell(
                onTap: () {
                  // on drawer menu pressed
                  if (provider.drawerScaffoldLKey.currentState!.isDrawerOpen) {
                    //if drawer is open, then close the drawer
                    Navigator.pop(context);
                  } else {
                    provider.drawerScaffoldLKey.currentState!.openDrawer();
                    //if drawer is closed then open the drawer.
                  }
                },
                child: Image.asset(AssetsImagesRes.menuBar)),
            // leading: IconButton(
            //   onPressed: () {
            //     //on drawer menu pressed
            //     if (provider.drawerScaffoldLKey.currentState!.isDrawerOpen) {
            //       //if drawer is open, then close the drawer
            //       Navigator.pop(context);
            //     } else {
            //       provider.drawerScaffoldLKey.currentState!.openDrawer();
            //       //if drawer is closed then open the drawer.
            //     }
            //   },
            //   icon: const Icon(Icons.menu),
            // ),
            centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("U T R A D I A",
                    style: robotoSemiBoldTextStyle(
                      color: ColorRes.white,
                      fontSize: 18,
                    ).copyWith(fontWeight: FontWeight.w700)),
                Text("T h e  T r u s t w o r t h y  M a r k e t p l a c e",
                    style: robotoSemiBoldTextStyle(
                      color: ColorRes.white,
                      fontSize: 7,
                    ).copyWith(fontWeight: FontWeight.w700))
              ],
            ),
          ),
          body: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0.0,
              primary: false,
              backgroundColor: Colors.transparent,
            ),
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
            body: provider.loader == true
                ? commonLoader()
                : RefreshIndicator(
                    triggerMode: RefreshIndicatorTriggerMode.anywhere,
                    onRefresh: () async {
                      Logger().e("refresh");
                      provider.init();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const HomeTop(),
                          const HomeCenter(),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.allHomeTopCategories.length,
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.02),
                              itemBuilder: (context, index) {
                                return HomeBottom(index: index);
                              }),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
