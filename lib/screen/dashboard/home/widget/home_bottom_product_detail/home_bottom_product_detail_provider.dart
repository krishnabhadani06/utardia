// class TopProductDetailProvider extends ChangeNotifier {
//
//   bool  loader = false;
//   int selectIndex = 0;
//
//   HomeTopProductDetail homeTopProductDetailModel = HomeTopProductDetail();
//   TopProductDetail? homeTopProductDetail;
//
//   Future<void> topProductDetails (String url) async {
//     loader = true;
//     notifyListeners();
//
//     HomeTopProductDetail homeTopProductDetailModel = await  HomeTopCategoryAPiServices.homeTopProductDetailData(url);
//     if(homeTopProductDetailModel.status != 200){
//     topProductDetails(url);
//     }else{
//       homeTopProductDetail = homeTopProductDetailModel.data!.first;
//       if (kDebugMode) {
//       print('-----------------------------${ homeTopProductDetailModel.data!.length}');
//     }
//     loader = false;
//     notifyListeners();
//     }
//   }
//
//   void onTapTopProductDetails(int index,String url){
//     selectIndex = index;
//     homeTopProductDetail = null;
//     topProductDetails(url);
//     navigator.currentState!.push(
//         MaterialPageRoute(builder: (context) =>  const TopProductDetailScreen()));
//     if (kDebugMode) {
//       print('00000000------------ $url');
//     }
//     notifyListeners();
//   }
// }
//
