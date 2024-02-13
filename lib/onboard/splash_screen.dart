import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/global/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    await Get.find<AuthController>().initializeUserCache();
    if (await AuthController.isLogin()) {
      await Get.find<WishlistStoreController>().initializeWishListProduct();
    }

    Get.offAllNamed(BottomNavScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                AssetsPath.logo,
                alignment: Alignment.center,
              ),
            ),
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 16,
                ),
                Text("Version 1.0"),
                SizedBox(
                  height: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
