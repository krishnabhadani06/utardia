import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:utardia/screen/address/address_provider.dart';
import 'package:utardia/screen/authorization/login/forgot_password/forgot_password_proivder.dart';
import 'package:utardia/screen/authorization/login/login_provider.dart';
import 'package:utardia/screen/authorization/registration/Bottomsheet/bottom_sheet_provider.dart';
import 'package:utardia/screen/authorization/registration/otp_verification/otp_verification_provider.dart';
import 'package:utardia/screen/authorization/registration/registration_provider.dart';
import 'package:utardia/screen/category/category_provider.dart';
import 'package:utardia/screen/category/subCategory/subCategory_provider.dart';
import 'package:utardia/screen/dashboard/campaigns/campaigns_provider.dart';
import 'package:utardia/screen/dashboard/cart/cart_provider.dart';
import 'package:utardia/screen/dashboard/change_password/chnage_password_provider.dart';
import 'package:utardia/screen/dashboard/dashboard_provider.dart';
import 'package:utardia/screen/dashboard/favorite/favorite_provider.dart';
import 'package:utardia/screen/dashboard/home/home_provider.dart';
import 'package:utardia/screen/dashboard/profile/profile_provider.dart';
import 'package:utardia/screen/dashboard/search/search_provider.dart';
import 'package:utardia/screen/dashboard/view_all_category/view_screen_provider.dart';
import 'package:utardia/screen/edit_profile/editprofile_provider.dart';
import 'package:utardia/screen/mycard/my_card_provider.dart';
import 'package:utardia/screen/order/order_provider.dart';
import 'package:utardia/screen/payment/payment_provider.dart';
import 'package:utardia/screen/splash/splash_provider.dart';
import 'package:utardia/screen/splash/splash_screen.dart';
import 'package:utardia/services/pref_service.dart';

import 'common/helper.dart';
import 'screen/category/product_details/product_details_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => OtpProvider()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (context) => BottomSheetProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => CampaingProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => EditProfileProvider()),
        ChangeNotifierProvider(create: (context) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => MyCardProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => ViewAllCategoryProvider()),
        ChangeNotifierProvider(create: (context) => SubCategoryProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigator,
        debugShowCheckedModeBanner: false,
        //home: const HomeScreen(),
        builder: EasyLoading.init(),
        home: const SplashScreen(),
      ),
    );
  }
}
