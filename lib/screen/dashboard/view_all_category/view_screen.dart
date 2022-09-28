import 'package:flutter/material.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/dashboard/view_all_category/widgets/view_screen_center.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class ViewAllCategoryScreen extends StatelessWidget {
  const ViewAllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Icon(IconRes.icBack, size: 28),
          onTap: () {
            navigator.currentState!.pop();
          },
        ),
        centerTitle: true,
        title: const Text(Strings.category, style: TextStyle(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            ViewCenterScreen(),
          ],
        ),
      ),
    ));
  }
}
