import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/new_product_controller.dart';
import 'package:crafty_bay/controllers/popular_product_controller.dart';
import 'package:crafty_bay/controllers/special_product_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/shop/cart_list_screen.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
import 'package:crafty_bay/views/screens/shop/home_screen.dart';
import 'package:crafty_bay/views/screens/shop/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/bottom-navigation';
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final double iconSize = 35.0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartListScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    Get.find<HomeCarouselController>().getHomeCarousel();
    Get.find<CategoryController>().getCategoryList();
    Get.find<PopularProductController>().getProductByRemark();
    Get.find<SpecialProductController>().getProductByRemark();
    Get.find<NewProductController>().getProductByRemark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (nav) {
      return Scaffold(
        body: _screens[nav.currentScreen],
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
                Icons.favorite_border_outlined,
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
