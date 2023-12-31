import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
import 'package:crafty_bay/views/utilities/assets_path.dart';
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
    Get.offAllNamed(VerifyEmailScreen.routeName);
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
