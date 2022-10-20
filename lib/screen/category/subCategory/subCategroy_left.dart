// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:utardia/common/helper.dart';
// import 'package:utardia/common/text_styles.dart';
// import 'package:utardia/util/color_res.dart';
// import 'package:utardia/util/image_res.dart';
//
// class SubCategoryLeft extends StatelessWidget {
//   const SubCategoryLeft({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: ListView.builder(
//         // itemCount: provider2.allHomeCategories.length,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           // print(provider.allCategories.length);
//           return Padding(
//             padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   // onTap: () => provider.onGesterTap(
//                   //     index,
//                   //     provider2.allHomeCategories[index].links?.products
//                   //         .toString(),
//                   //     provider2.allHomeCategories[index].links?.subCategories
//                   //         .toString()),
//                   child: Container(
//                     height: deviceHeight * 0.11,
//                     width: deviceWidth * 0.19,
//                     // decoration: provider.selectedPageInd == index
//                     //     ? BoxDecoration(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: ColorRes.blue, width: 1),
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(8.0)),
//                       color: ColorRes.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.25),
//                           blurRadius: 2,
//                           offset: const Offset(0, 2),
//                           spreadRadius: 1,
//                         ),
//                       ],
//                     ),
//                     //     : BoxDecoration(
//                     //   border:
//                     //   Border.all(color: Colors.transparent, width: 1),
//                     //   color: ColorRes.white,
//                     // ),
//                     child: Container(
//                       alignment: Alignment.topCenter,
//                       child: Column(
//                         // crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           SizedBox(
//                             height: deviceHeight * 0.07,
//                             width: deviceWidth * 0.22,
//                             child: CachedNetworkImage(
//                               imageUrl: '',
//                               // imageUrl: provider2
//                               //     .allHomeCategories[index].banner
//                               //     .toString(),
//                               progressIndicatorBuilder:
//                                   (context, url, downloadProgress) =>
//                                       CircularProgressIndicator(
//                                           value: downloadProgress.progress),
//                               errorWidget: (context, url, error) =>
//                                   Image.asset(AssetsImagesRes.girl1),
//                             ),
//                           ),
//                           Text(
//                             "",
//                             // provider2.allHomeCategories[index].name.toString(),
//                             textAlign: TextAlign.center,
//                             style: natoMediumTextStyle(
//                                     fontSize: 10, color: ColorRes.clrFont)
//                                 .copyWith(overflow: TextOverflow.ellipsis),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
