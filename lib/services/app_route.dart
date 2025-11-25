// ignore_for_file: constant_identifier_names, depend_on_referenced_packages, prefer_const_constructors
import 'package:get/get.dart';

import '../module/Tanent/rent_payment.dart';
import '../module/splash.dart';


part 'routes_page.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const DETAILRENT = Routes.RENTTDETAIL;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.RENTTDETAIL,
      page: () => RentPayment(),
    ),
  ];
}
