import 'dart:io';

import 'package:bliss_ecologital/constants/app_colors.dart';
import 'package:bliss_ecologital/services/app_data/cart_data_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:bliss_ecologital/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  // initialize cart services
  CartDataServices.initialize();

  // set device orientation to portrait up
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const BlissEcologitalApp(),
    ),
  );
}

class BlissEcologitalApp extends StatelessWidget {
  const BlissEcologitalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        splashColor: AppColors.blackSqueeze,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.blackSqueeze,
        canvasColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppColors.blackSqueeze,
          elevation: 0,
          centerTitle: false,
        ),
      ),
      title: 'Bliss',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
