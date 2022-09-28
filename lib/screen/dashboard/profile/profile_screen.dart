import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/string.dart';

import 'widget/profile_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Scaffold.of(context).openEndDrawer(); //No Error
    ///The Error was coming, As you're trying to build a widget when it is
    ///rebuilding widget Tree due to the change in the width of the browser.
    ///Wrapping it inside ensures that the code will run after the build.
    // });
    return SafeArea(
      child: Scaffold(
        primary: true,
        appBar: AppBar(
            backgroundColor: ColorRes.appBarColor,
            centerTitle: true,
            title: const Text(Strings.profile, style: TextStyle(fontSize: 22)),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                //on drawer menu pressed
                if (provider.drawerScaffoldLKey.currentState!.isDrawerOpen) {
                  //if drawer is open, then close the drawer
                  navigator.currentState!.pop(context);
                } else {
                  provider.drawerScaffoldLKey.currentState!.openDrawer();
                  //if drawer is closed then open the drawer.
                }
              },
              icon: const Icon(Icons.menu),
            )),
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
          body: Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 16.0, right: 19.0),
            child: Column(
              children: [
                Container(
                  height: deviceHeight * 0.15,
                  width: deviceWidth * 0.95,
                  // color: ColorRes.lightGrey,
                  child: const CircleAvatar(
                    backgroundColor: ColorRes.grey,
                  ),
                ),
                SizedBox(height: deviceHeight / 30),
                const Text(Strings.name),
                SizedBox(height: deviceHeight / 50),
                const Text(Strings.emailOrPhone),
                SizedBox(height: deviceHeight / 50),
                SizedBox(height: deviceHeight / 50),
                const Text(Strings.address),
                SizedBox(height: deviceHeight / 20),

                // HomeCenter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
