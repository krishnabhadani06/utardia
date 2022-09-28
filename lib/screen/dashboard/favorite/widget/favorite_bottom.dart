import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/common/text_styles.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class FavoriteBottom extends StatelessWidget {
  const FavoriteBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 4, right: 2, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: deviceHeight / 30,
                  width: deviceWidth / 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorRes.green, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Row(
                    children: [
                      // Align(alignment: Alignment.center,),
                      GestureDetector(
                        child: Container(
                          height: deviceHeight / 20,
                          width: deviceWidth / 18,
                          decoration: const BoxDecoration(
                            color: ColorRes.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Icon(
                            IconRes.icDown,
                            color: ColorRes.white,
                          ),
                        ),
                        onTap: () {},
                      ),
                      Text(
                        '100g',
                        style: robotoBoldTextStyle(
                            fontSize: 10, color: ColorRes.green),
                      ),
                    ],
                  )),
              Visibility(
                visible: provider.quality,
                child: GestureDetector(
                  child: Container(
                    height: deviceHeight / 30,
                    width: deviceWidth / 15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: ColorRes.green,
                    ),
                    child: Icon(
                      IconRes.icDec,
                      size: 16,
                      color: ColorRes.white,
                    ),
                  ),
                  onTap: () {
                    // data[index].details[i].counter--;
                    // setState(() {});
                  },
                ),
              ),
              Visibility(
                visible: provider.quality,
                child: Text(
                  Strings.counter == 0 ? '0' : Strings.counter.toString(),
                  style: robotoBoldTextStyle(fontSize: 10),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: deviceHeight / 30,
                  width: deviceWidth / 15,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: ColorRes.green,
                  ),
                  child: Icon(
                    IconRes.icPlus,
                    size: 16,
                    color: ColorRes.white,
                  ),
                ),
                onTap: () {
                  // data[index].details[i].counter++;
                  // setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
