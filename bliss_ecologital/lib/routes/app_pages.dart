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
    ),
  ];
}
