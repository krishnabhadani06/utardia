import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/category/product_details/product_details_provider.dart';
import 'package:utardia/util/color_res.dart';

class TopProductDetailCenter extends StatelessWidget {
  const TopProductDetailCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDetailsProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                width: 20,
                // color: Colors.blue,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        provider.homeTopProductDetail!.choiceOptions!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorRes.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6.0)),
                            ),
                            //  child: Center(child: Text(provider.homeProductDetail!.choiceOptions![0].options![index])),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 50,
                width: 20,
                // color: Colors.blue,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount: 6,
                    itemCount: provider.homeTopProductDetail!.colors!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 26,
                            width: 26,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.red,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
