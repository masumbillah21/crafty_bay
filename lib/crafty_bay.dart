import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/controllers/product_slider_controller.dart';
import 'package:crafty_bay/controllers/user_controller.dart';
import 'package:crafty_bay/utilities/app_routes.dart';
import 'package:crafty_bay/utilities/app_theme_data.dart';
import 'package:crafty_bay/views/screens/onboard/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crafty Bay',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      navigatorKey: navigationKey,
      initialBinding: CraftyBayDependency(),
      initialRoute: SplashScreen.routeName,
      getPages: AppRoutes.appRoutes,
    );
  }
}

class CraftyBayDependency extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(UserController());
    Get.put(BottomNavController());
    Get.put(CategoryController());
    Get.put(ProductController());
    Get.put(ProductSliderController());
  }
}
