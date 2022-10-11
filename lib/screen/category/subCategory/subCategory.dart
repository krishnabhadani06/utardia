import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/category/widget/category_left.dart';
import 'package:utardia/screen/category/widget/category_right.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ColorRes.appBarColor,
        leading: GestureDetector(
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            if (navigator.currentState!.canPop() == true) {
              navigator.currentState!.pop();
            } else {
              Provider.of<DashboardProvider>(context, listen: false)
                  .onBottomBarChange(0, context);
            }
          },
        ),
        centerTitle: true,
        title: const Text("Sub Category", style: TextStyle(fontSize: 20)),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoryLeft(),
          CategoryRight(),
        ],
      ),
    ));
  }
}
