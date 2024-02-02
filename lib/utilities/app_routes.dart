import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
import 'package:crafty_bay/views/screens/authentication/verify_pin_code_screen.dart';
import 'package:crafty_bay/views/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/views/screens/customer_review/customer_review_screen.dart';
import 'package:crafty_bay/views/screens/onboard/splash_screen.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:crafty_bay/views/screens/shop/cart_list_screen.dart';
import 'package:crafty_bay/views/screens/shop/categories_screen.dart';
import 'package:crafty_bay/views/screens/shop/home_screen.dart';
import 'package:crafty_bay/views/screens/shop/product_details_screen.dart';
import 'package:crafty_bay/views/screens/shop/wish_list_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes = [
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(
      name: BottomNavScreen.routeName,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: CategoriesScreen.routeName,
      page: () => const CategoriesScreen(),
    ),
    GetPage(
      name: ProductDetailsScreen.routeName,
      page: () => ProductDetailsScreen(),
    ),
    GetPage(
      name: CartListScreen.routeName,
      page: () => const CartListScreen(),
    ),
    GetPage(
      name: WishListScreen.routeName,
      page: () => const WishListScreen(),
    ),
    GetPage(
      name: VerifyEmailScreen.routeName,
      page: () => const VerifyEmailScreen(),
    ),
    GetPage(
      name: VerifyPinCodeScreen.routeName,
      page: () => const VerifyPinCodeScreen(),
    ),
    GetPage(
      name: UpdateProfileScreen.routeName,
      page: () => const UpdateProfileScreen(),
    ),
    GetPage(
      name: CustomerReviewScreen.routeName,
      page: () => const CustomerReviewScreen(),
    ),
  ];
}
