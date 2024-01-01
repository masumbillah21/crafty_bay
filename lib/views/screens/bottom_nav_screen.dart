import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:crafty_bay/views/screens/shop/cart_screen.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
import 'package:crafty_bay/views/screens/shop/home_screen.dart';
import 'package:crafty_bay/views/screens/shop/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  static const routeName = '/bottom-navigation';
  const BottomNavScreen({super.key});
  final double iconSize = 35.0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (nav) {
      return Scaffold(
        body: _screens[nav.currentScreen],
        appBar: const CraftyAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: nav.currentScreen,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) {
            nav.changeScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: iconSize,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
                size: iconSize,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_outlined,
                size: iconSize,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard_outlined,
                size: iconSize,
              ),
              label: 'Wish',
            ),
          ],
        ),
      );
    });
  }
}

class CraftyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CraftyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navLogo),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(UpdateProfileScreen.routeName);
          },
          icon: const Icon(
            Icons.person_2_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone_outlined,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_outlined,
          ),
        ),
      ],
    );
  }
}
