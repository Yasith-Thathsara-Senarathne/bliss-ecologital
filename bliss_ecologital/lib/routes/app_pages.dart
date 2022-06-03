import 'package:bliss_ecologital/pages/product_page/product_binding.dart';
import 'package:bliss_ecologital/pages/product_page/product_page.dart';
import 'package:get/get.dart';
import 'package:bliss_ecologital/pages/home_page/home_binding.dart';
import 'package:bliss_ecologital/pages/home_page/home_page.dart';
import 'package:bliss_ecologital/routes/routes.dart';

abstract class AppPages {
  static get initial => Routes.homePage;

  static final routes = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.productPage,
      page: () => const ProductPage(),
      binding: ProductBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
