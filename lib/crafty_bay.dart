import 'package:crafty_bay/views/screens/onboard/splash_screen.dart';
import 'package:crafty_bay/views/utilities/app_routes.dart';
import 'package:crafty_bay/views/utilities/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crafty Bay',
      theme: AppThemeData.lightThemeData,
      initialRoute: SplashScreen.routeName,
      getPages: AppRoutes.appRoutes,
    );
  }
}
