import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/category_screen.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/home/widget/category_title.dart';
import 'package:utardia/screen/dashboard/home/widget/imageSliderBottom.dart';
import 'product_card.dart';

class HomeBottom extends StatelessWidget {
  final int index;
  const HomeBottom({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    final provider1 = Provider.of<ProductDetailsProvider>(context);

    return Column(children: [
      if (index % 2 == 0)
        sliderBottomHome(context: context, bannerImage: provider.bannerImage),
      Builder(builder: (context) {
        return Column(
          children: [
            categoryTitle(
                title: provider.allHomeTopCategories[index].name,
                onTap: () {
                  navigator.currentState!
                      .push(MaterialPageRoute(builder: (context) {
                    int indezxx = provider.allHomeCategories.indexWhere(
                        (element) =>
                            element.name.toString() ==
                            provider.allHomeTopCategories[index].name
                                .toString());

                    return CategoryScreen(
                        select: provider.allHomeCategories.indexWhere(
                            (element) =>
                                element.name.toString() ==
                                provider.allHomeTopCategories[index].name
                                    .toString()));
                  }));
                }),
            SizedBox(
                height: provider.allHomeTopProducts[index].data != null
                    ? 220
                    : null,
                width: MediaQuery.of(context).size.width,
                //color: Colors.yellow,
                child: provider.allHomeTopProducts[index].data != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index1) {
                          return ProductCard(
                            context: context,
                            index: index1,
                            strokedPrice: provider.allHomeTopProducts[index]
                                .data![index1].strokedPrice!,
                            mainPrice: provider.allHomeTopProducts[index]
                                .data![index1].mainPrice!,
                            image: provider.allHomeTopProducts[index]
                                .data![index1].thumbnailImage!,
                            name: provider
                                .allHomeTopProducts[index].data![index1].name!,
                            gro: provider.allHomeTopProducts[index]
                                .data![index1].isGrocery!,
                            rate: provider
                                .allHomeTopProducts[index].data![index1].rating
                                .toString(),
                            url: provider.allHomeTopProducts[index]
                                .data![index1].links!.details
                                .toString(),
                            productUrl: provider
                                .allHomeTopCategories[index].links!.products
                                .toString(),
                            like: provider.wishListId.contains(provider
                                .allHomeTopProducts[index].data![index1].id
                                .toString()),
                            id: provider
                                .allHomeTopProducts[index].data![index1].id
                                .toString(),
                            onTap: () {
                              provider1.onTapProductDetails(
                                  index1,
                                  provider.allHomeTopProducts[index]
                                      .data![index1].links!.details
                                      .toString(),
                                  context,
                                  provider.allHomeTopProducts[index]
                                      .data![index1].id
                                      .toString());
                            },
                          );
                        },
                        itemCount: provider.allHomeTopProducts[index].data !=
                                null
                            ? provider.allHomeTopProducts[index].data!.length
                            : 0)
                    : const Center(
                        child: Text('No Products'),
                      )
                //itemCount: provider.allHomeCategoriesProducts[index].data!.length),
                )
          ],
        );
      }),
    ]);
  }
}
