import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

import '../favorite_provider.dart';

class FavoriteCenter extends StatelessWidget {
  int? index;

  // Data? product;
  FavoriteCenter({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Container(
      margin:
          const EdgeInsets.only(left: 3.0, right: 3.0, top: 7.0, bottom: 7.0),
      // height: 210,
      width: 180,
      decoration: BoxDecoration(
        //color: Colors.white,
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
      child: GestureDetector(
        // onTap: () => widget.onTap(widget.index!, widget.url!),
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
                          imageUrl: provider.Wishlist2!.data![index ?? 0]
                              .product!.thumbnailImage
                              .toString(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                              Image.asset(AssetsImagesRes.girl1)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorRes.white,
                              radius: 15,
                              child: Center(
                                child: InkWell(
                                    onTap: () {
                                      final pro = Provider.of<FavoriteProvider>(
                                          context,
                                          listen: false);

                                      provider.addWishList(
                                          pro.Wishlist2!.data![index!].product!
                                              .id
                                              .toString(),
                                          context,
                                          '');
                                    },
                                    child: const Icon(
                                      Icons.favorite,
                                      color: ColorRes.red,
                                      size: 18,
                                    )),
                              ),
                            ),
                            SizedBox(height: deviceHeight * 0.01),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: deviceHeight * 0.006),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(
                        index == null
                            ? Strings.anglesMaluZip
                            : provider
                                .Wishlist2!.data![index ?? 0].product!.name
                                .toString(),
                        style: robotoMediumTextStyle(
                            color: ColorRes.greyDark, fontSize: 12),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * 0.01,
                    ),
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
                                "${provider.Wishlist2!.data![index ?? 0].product!.rating.toString()}",
                                // widget.rate!,
                                style: TextStyle(
                                    color: ColorRes.white, fontSize: 12),
                              ),
                              Icon(
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
                    SizedBox(
                      height: deviceHeight * 0.02,
                    ),
                    Wrap(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              index == null
                                  ? Strings.rs3800
                                  : "Rs.${provider.Wishlist2!.data![index ?? 0].product!.basePrice.toString()}",
                              style: robotoBoldTextStyle(fontSize: 15)
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: deviceWidth * 0.01,
                            ),
                            Text(
                                index == null
                                    ? Strings.rs3800
                                    : provider.Wishlist2!.data![index ?? 0]
                                        .product!.basePrice
                                        .toString(),
                                style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            ColorRes.clrFont.withOpacity(0.7))
                                    .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                        Text(
                          index != null
                              ? "(57 % Off)"
                              : provider.Wishlist2!.data![index ?? 0].product!
                                  .basePrice
                                  .toString(),
                          style: robotoBoldTextStyle(
                              fontSize: 12, color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
