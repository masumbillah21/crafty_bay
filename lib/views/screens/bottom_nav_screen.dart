import 'package:crafty_bay/controllers/brand/brand_controller.dart';
import 'package:crafty_bay/controllers/category/category_controller.dart';
import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/home/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/product/new_product_controller.dart';
import 'package:crafty_bay/controllers/product/popular_product_controller.dart';
import 'package:crafty_bay/controllers/product/special_product_controller.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/views/screens/cart/cart_list_screen.dart';
import 'package:crafty_bay/views/screens/category/categories_screen.dart';
import 'package:crafty_bay/views/screens/home/home_screen.dart';
import 'package:crafty_bay/views/screens/wishlist/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  static const routeName = '/bottom-navigation';
  const BottomNavScreen({super.key});

  final double iconSize = 35.0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartListScreen(),
    WishListScreen()
  ];

  void getHomeData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeCarouselController>().getHomeCarousel();
      Get.find<CategoryController>().getCategoryList();
      Get.find<BrandController>().getBrandList();
      Get.find<PopularProductController>().getProductByRemark();
      Get.find<SpecialProductController>().getProductByRemark();
      Get.find<NewProductController>().getProductByRemark();
    });
  }

  @override
  Widget build(BuildContext context) {
    getHomeData();
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
