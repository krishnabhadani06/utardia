import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utardia/common/helper.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/widget/category_left.dart';
import 'package:utardia/screen/category/widget/category_right.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/util/color_res.dart';
import 'package:utardia/util/icon_res.dart';
import 'package:utardia/util/string.dart';

class CategoryScreen extends StatefulWidget {
  int select;

  CategoryScreen({Key? key, required this.select}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final provider = Provider.of<CategoryProvider>(context, listen: false);
      final provider2 = Provider.of<HomeProvider>(context, listen: false);
      provider.init(provider2.allHomeCategories[0].links!.products.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CategoryProvider>(context);
    final provider2 = Provider.of<HomeProvider>(context);

    if (widget.select != 0) {
      provider.pageCon =
          PageController(initialPage: widget.select, keepPage: true);
      provider.selectedPageInd = widget.select;
      widget.select = 0;
    }
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
              // navigator.currentState!.pushReplacement(MaterialPageRoute(builder: (context){
              //   return const HomeScreen();
              // }
              // ));
            },
          ),
          centerTitle: true,
          title:
              const Text(Strings.productList, style: TextStyle(fontSize: 20)),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CategoryLeft(),
            CategoryRight(),
          ],
        ),
      ),
    );
  }
}
