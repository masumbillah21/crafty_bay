import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/controllers/user_controller.dart';
import 'package:crafty_bay/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

class CraftyBayDependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => HomeCarouselController());
    Get.lazyPut(() => WishlistController());
    Get.put(AuthController());
    Get.put(UserController());
  }
}
