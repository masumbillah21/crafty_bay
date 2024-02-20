import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/auth/screens/verify_email_screen.dart';
import 'package:crafty_bay/global/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/invoices/screens/invoice_screen.dart';
import 'package:crafty_bay/users/screens/update_profile_screen.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppNavigationDrawerWidget extends StatelessWidget {
  AppNavigationDrawerWidget({
    super.key,
  });

  final ValueNotifier<bool> _login = ValueNotifier(false);

  void _isLogin() async {
    _login.value = await AuthController().checkAuthState();
  }

  @override
  Widget build(BuildContext context) {
    _isLogin();
    return Drawer(
      child: ValueListenableBuilder(
          valueListenable: _login,
          builder: (context, value, _) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      AssetsPath.logo,
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
                      Get.find<BottomNavController>().backToHome();
                    }
                  },
                ),
                if (value) ...[
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
                          await WishlistStoreController.clearWishListProduct();
                          Get.offAndToNamed(BottomNavScreen.routeName);
                          Get.find<BottomNavController>().backToHome();
                        },
                        secondButtonAction: () {
                          Get.back();
                        },
                      );
                    },
                  )
                ] else ...[
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Login'),
                    trailing: const Icon(Icons.arrow_forward_rounded),
                    onTap: () {
                      Get.offAndToNamed(VerifyEmailScreen.routeName);
                    },
                  )
                ],
              ],
            );
          }),
    );
  }
}
