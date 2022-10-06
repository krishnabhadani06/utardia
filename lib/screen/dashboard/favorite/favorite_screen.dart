import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/material_button.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/favorite/widget/favorite_center.dart';
import 'package:utardia/screen/dashboard/home/home_screen.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../../../util/icon_res.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     Provider.of<FavoriteProvider>(context,listen: false).getWishList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<FavoriteProvider>(context);
    return Consumer<FavoriteProvider>(builder: (con, provider, widget) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorRes.appBarColor,
            leading: GestureDetector(
              child: Icon(IconRes.icBack, size: 30),
              onTap: () {
                navigator.currentState!.pop(context);
              },
            ),
            centerTitle: true,
            title: const Text(Strings.favorite, style: TextStyle(fontSize: 22)),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: provider.Wishlist2 != null
                  ? provider.loader == true && provider.Wishlist2!.data!.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : provider.loader == false &&
                              provider.Wishlist2!.data!.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.12),
                                Image.asset(AssetsImagesRes.favouriteImage),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                Text(
                                  Strings.yourHeartIsEmpty,
                                  style: natoBoldTextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01),
                                Text(
                                  Strings.startFallInLove,
                                  style: natoMediumTextStyle(
                                      fontSize: 16, color: ColorRes.grayText),
                                ),
                                Text(
                                  Strings.goods,
                                  style: natoMediumTextStyle(
                                      fontSize: 16, color: ColorRes.grayText),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: materialButton(
                                      txtButton: Strings.startShopping,
                                      onPressed: () =>
                                          provider.onTapShopping()),
                                ),
                              ],
                            )
                          // ? Text("NO Any Favr")
                          : GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 8.0,
                                childAspectRatio:
                                    deviceWidth / (deviceHeight * 0.80),
                              ),
                              itemCount: provider.Wishlist2!.data!.length == 0
                                  ? 4
                                  : provider.Wishlist2!.data!.length,
                              itemBuilder: (context, i) {
                                // print(fruit[index]['counter'].toString());
                                // fashion[i].counter == 0
                                //     ? provider.quality = false
                                //     : provider.quality = true;
                                return FavoriteCenter(
                                  index: i,
                                );
                              },
                            )
                  : const CircularProgressIndicator()),
        ),
      );
    });
  }
}
