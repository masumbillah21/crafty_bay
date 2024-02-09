import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/views/screens/invoice/invoice_screen.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppNavigationDrawerWidget extends StatelessWidget {
  const AppNavigationDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(
                AssetsPath.navLogo,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () {
              if (Get.currentRoute == BottomNavScreen.routeName) {
                Get.back();
              } else {
                Get.toNamed(BottomNavScreen.routeName);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Invoices'),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () {
              if (Get.currentRoute == InvoiceScreen.routeName) {
                Get.back();
              } else {
                Get.toNamed(InvoiceScreen.routeName);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () {
              if (Get.currentRoute == UpdateProfileScreen.routeName) {
                Get.back();
              } else {
                Get.toNamed(UpdateProfileScreen.routeName);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () {
              showPopup(
                context: context,
                content: "Do you want to logout?",
                firstButtonText: "Logout",
                firstButtonAction: () async {
                  Get.back();
                  await AuthController.clearAuthData();
                  Get.offAndToNamed(BottomNavScreen.routeName);
                  Get.find<BottomNavController>().backToHome();
                },
                secondButtonAction: () {
                  Get.back();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
