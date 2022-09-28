import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/screen/dashboard/home/widget/home_bottom_product_detail/home_bottom_product_detail_bottom.dart';
import 'package:utardia/screen/dashboard/home/widget/home_bottom_product_detail/home_bottom_product_detail_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/image_res.dart';
import 'package:utardia/util/string.dart';

class TopProductDetailScreen extends StatelessWidget {
  const TopProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailsProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 30),
          onTap: () {
            navigator.currentState!.pop();
          },
        ),
        centerTitle: true,
        title: Text(Strings.productDetails,
            style: ubuntuBoldTextStyle(fontSize: 22, color: ColorRes.white)),
      ),
      body: SingleChildScrollView(
        // body:provider.loader? const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: deviceHeight * 0.40,
                width: deviceWidth * 100,
                // color: ColorRes.yellow,
                child: CachedNetworkImage(
                  //imageUrl: provider.allProductDescription[provider.selectedIndex].thumbnailImage.toString(),
                  imageUrl:
                      provider.homeTopProductDetail!.thumbnailImage.toString(),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetsImagesRes.girl1),
                ),
              ),
              const SizedBox(height: 9),
              SizedBox(
                height: deviceHeight * 0.06,
                width: deviceWidth,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.homeTopProductDetail!.photos!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.06,
                          width: deviceWidth * 0.12,
                          //color: ColorRes.blue,
                          child: Image.network(
                            "https://dharmeshs39.sg-host.com/public/${provider.homeTopProductDetail!.photos![index].path.toString()}",
                            fit: BoxFit.fill,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    );
                  },
                ),
              ),
              const TopProductDetailCenter(),
              const TopProductDetailBottom(),
            ],
          ),
        ),
      ),
    ));
  }
}
