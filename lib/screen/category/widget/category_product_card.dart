import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class categoryProductCard extends StatefulWidget {
  // bool? isLike = false;
  //bool? like = false,
  BuildContext? context;
  int? index;
  String? image;
  String? name;
  String? mainPrice;
  String? strokedPrice;
  String? rate;
  int? gro;
  String? id;
  bool? islike;
  String? url;
  String? productUrl;
  void Function() onTap;
  categoryProductCard(
      {Key? key,
      this.context,
      this.index,
      this.image,
      this.name,
      this.mainPrice,
      this.strokedPrice,
      this.gro,
      this.id,
      this.url,
      this.rate,
      this.islike,
      this.productUrl,
      required this.onTap})
      : super(key: key);

  @override
  State<categoryProductCard> createState() => _categoryProductCardState();
}

class _categoryProductCardState extends State<categoryProductCard> {
  bool isLiked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider2 = Provider.of<FavoriteProvider>(context, listen: false);

    return Consumer<FavoriteProvider>(builder: (context, pro, x) {
      return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.only(
              left: 3.0, right: 3.0, top: 7.0, bottom: 7.0),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 5,
                offset: Offset.zero,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.24,
                        width: deviceWidth,
                        child: CachedNetworkImage(
                            imageUrl: widget.image!,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    )),
                            errorWidget: (context, url, error) =>
                                Image.asset(AssetsImagesRes.girl1)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 25,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorRes.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.20),
                                        blurRadius: 5,
                                        offset: Offset.zero,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: ColorRes.white,
                                    radius: 15,
                                    child: Center(
                                      child: InkWell(
                                          onTap: () {
                                            pro.addWishList(
                                                widget.id.toString(),
                                                context,
                                                widget.productUrl.toString());
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: widget.islike ?? false
                                                ? ColorRes.red
                                                : ColorRes.grey,
                                            size: 18,
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(height: deviceHeight * 0.01),

                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: deviceHeight * 0.006),
                    SizedBox(
                      width: deviceWidth * 0.36,
                      // width: deviceWidth * 0.20,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          widget.name!,
                          style: robotoMediumTextStyle(
                              color: ColorRes.greyDark, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: deviceHeight * 0.01),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10.0),
                          height: 22,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: ColorRes.yellow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.rate!,
                                style: const TextStyle(
                                    color: ColorRes.white, fontSize: 12),
                              ),
                              const Icon(
                                Icons.star,
                                color: ColorRes.white,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          Strings.tops,
                          style: robotoSemiBoldTextStyle(
                              color: ColorRes.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //mainAxisAlignment: MainAxisAlignment.start,
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${widget.mainPrice!.toString()}",
                            style: robotoBoldTextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("${widget.strokedPrice!.toString()}",
                                  //widget.strokedPrice!,
                                  style: robotoBoldTextStyle(
                                          fontSize: 10,
                                          color:
                                              ColorRes.clrFont.withOpacity(0.7))
                                      .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Text(
                                Strings.off57,
                                style: natoMediumTextStyle(
                                    color: ColorRes.darkGreen, fontSize: 7.3),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ),
                  ],
                ),
                //],
              ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
