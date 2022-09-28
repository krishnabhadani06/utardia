import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class Category {
  String category;
  String imgpath;
  List<Details> details;

  Category(
      {required this.category, required this.imgpath, required this.details});
}

class Details {
  String icimage;
  String titlename;
  String off;
  String subtitlename;
  int rs;
  String discount;

  Details({
    required this.icimage,
    required this.off,
    required this.subtitlename,
    required this.titlename,
    required this.discount,
    required this.rs,
  });
}

List<Category> data = [
  Category(
    category: Strings.mensFashion,
    imgpath: AssetsImagesRes.mensFashion,
    details: [
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
    ],
  ),
  Category(
      category: Strings.womenFashion,
      imgpath: AssetsImagesRes.womenFashion,
      details: [
        Details(
          icimage: AssetsImagesRes.girl7,
          titlename: Strings.topsWomen,
          subtitlename: Strings.anglesMaluZip,
          discount: 'Rs.3479',
          rs: 700,
          off: '10% off',
        ),
      ]),
  Category(
    category: Strings.kidsFashion,
    imgpath: AssetsImagesRes.kidsFashion,
    details: [
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
    ],
  ),
  Category(
    category: Strings.bornBaby,
    imgpath: AssetsImagesRes.bornBabyFashion,
    details: [
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
    ],
  ),
  Category(
    category: Strings.tops,
    imgpath: AssetsImagesRes.top,
    details: [
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
    ],
  ),
  Category(
    category: Strings.lehengha,
    imgpath: AssetsImagesRes.lehengha,
    details: [
      Details(
        icimage: AssetsImagesRes.girl7,
        titlename: Strings.topsWomen,
        subtitlename: Strings.anglesMaluZip,
        discount: 'Rs.3479',
        rs: 700,
        off: '10% off',
      ),
    ],
  ),
];

class Fashion {
  String icimage;
  String titlename;
  String off;
  String subtitlename;
  int rs;
  String discount;

  Fashion({
    required this.icimage,
    required this.off,
    required this.subtitlename,
    required this.titlename,
    required this.discount,
    required this.rs,
  });
}

List<Fashion> fashion = [
  Fashion(
    icimage: AssetsImagesRes.girl7,
    titlename: Strings.topsWomen,
    subtitlename: Strings.anglesMaluZip,
    discount: 'Rs.3479',
    rs: 700,
    off: '10% off',
  ),
  Fashion(
    icimage: AssetsImagesRes.girl6,
    titlename: Strings.topsWomen,
    subtitlename: Strings.anglesMaluZip,
    discount: 'Rs.3479',
    rs: 700,
    off: '10% off',
  ),
// Fashion(
//   icimage: AssetsImagesRes.girl1,
//   titlename: Strings.topsWomen,
//   subtitlename: Strings.anglesMaluZip,
//   discount:'Rs.3479',
//   rs: 700,
//   off: '10% off',
// ),
// Fashion(
//   icimage: AssetsImagesRes.girl4,
//   titlename: Strings.topsWomen,
//   subtitlename: Strings.anglesMaluZip,
//   discount:'Rs.3479',
//   rs: 700,
//   off: '10% off',
// ),
];

// class Details {
//   // IconData iconData;
//   String icimage;
//   String title;
//   int rs;
//   bool like;
//   String savers;
//   String item;
//   int counter;
//   String discount;
//   String off;
//
//
//   Details(
//       {
//         required this.off,
//         required this.discount,
//         // required this.iconData,
//         required this.icimage,
//         required this.title,
//         required this.rs,
//         required this.like,
//         required this.item,
//         required this.counter,
//         required this.savers});
// }
// List<Category> data = [
//   Category(
//     category: Strings.mensFashion,
//     imgpath: AssetsImagesRes.mensFashion,
//     details: [
//       Details(
//         // iconData: AssetsString.icHeart,
//         icimage: AssetsImagesRes.mensFashion,
//         title: Strings.mensFashion,
//         rs: 40,
//         like: true,
//         item: '1kg',
//         counter: 5,
//         savers: Strings.savers40,
//         off: '10%OFF',
//         discount: Strings.rs80,),
//       Details(
//         // iconData:  AssetsString.icHeart,
//         icimage:  AssetsImagesRes.mensFashion,
//         title: Strings.banana,
//         rs: 40,
//         like: false,
//         item: '100g',
//         counter: 0,
//         savers:  Strings.savers40,
//         off: '10%OFF',
//         discount: Strings.rs80,),
//       Details(
//         // iconData:  AssetsString.icHeart,
//         icimage: AssetsImagesRes.mensFashion,
//         title: Strings.banana,
//         rs: 40,
//         like: false,
//         item: '100g',
//         counter: 0,
//         savers:  Strings.savers40,
//         off: '10%OFF',
//         discount: Strings.rs80,),
//       Details(
//         // iconData:  AssetsString.icHeart,
//         icimage: AssetsImagesRes.mensFashion,
//         title: Strings.banana,
//         rs: 40,
//         like: true,
//         item: '100g',
//         counter: 0,
//         savers:  Strings.savers40,
//         off: '10%OFF',
//         discount: Strings.rs80,),
//       Details(
//         // iconData:  AssetsString.icHeart,
//         icimage: AssetsImagesRes.mensFashion,
//         title: Strings.banana,
//         rs: 40,
//         like: false,
//         item: '100g',
//         counter: 0,
//         savers:  Strings.savers40,
//         off: '10%OFF',
//         discount: Strings.rs80,),
//     ],
//   ),
//
//   Category(category: Strings.womenFashion, imgpath: AssetsImagesRes.womenFashion, details: [
//     Details(
//       // iconData:  AssetsString.icHeart,
//       icimage: AssetsImagesRes.lehengha,
//       title: Strings.womenFashion,
//       rs: 50,
//       like: true,
//       item: '100g',
//       counter: 3,
//       savers:  Strings.savers40,
//       off: '10%OFF',
//       discount: Strings.rs80,)
//   ]),
//   Category(
//     category: Strings.kidsFashion,
//     imgpath: AssetsImagesRes.kidsFashion,
//     details: [
//       Details(
//           off: '10%OFF',
//           discount: Strings.rs80,
//           // iconData:  AssetsString.icHeart,
//           icimage: AssetsImagesRes.lehengha,
//           title: Strings.tomatos,
//           rs: 50,
//           like: true,
//           item: '100g',
//           counter: 3,
//           savers:  Strings.savers40)
//     ],
//   ),
//   Category(
//     category: Strings.bornBaby,
//     imgpath: AssetsImagesRes.bornBabyFashion,
//     details: [
//       Details(
//           off: '10%OFF',
//           discount: Strings.rs80,
//           // iconData:  AssetsString.icHeart,
//           icimage:AssetsImagesRes.lehengha,
//           title: Strings.tomatos,
//           rs: 50,
//           like: true,
//           item: '100g',
//           counter: 3,
//           savers:  Strings.savers40)
//     ],
//   ),
//   Category(
//     category: Strings.tops,
//     imgpath: AssetsImagesRes.top,
//     details: [
//       Details(
//           off: '10%OFF',
//           discount: Strings.rs80,
//           // iconData:  AssetsString.icHeart,
//           icimage: AssetsImagesRes.lehengha,
//           title: Strings.tomatos,
//           rs: 50,
//           like: true,
//           item: '100g',
//           counter: 3,
//           savers:  Strings.savers40)
//     ],
//   ),
//   Category(
//     category: Strings.lehengha,
//     imgpath: AssetsImagesRes.lehengha,
//     details: [
//       Details(
//           off: '10%OFF',
//           discount: Strings.rs80,
//           // iconData:  AssetsString.icHeart,
//           icimage: AssetsImagesRes.lehengha,
//           title: Strings.tomatos,
//           rs: 50,
//           like: true,
//           item: '100g',
//           counter: 3,
//           savers:  Strings.savers40),
//     ],
//   ),
// ];
