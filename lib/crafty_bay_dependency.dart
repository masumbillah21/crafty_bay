import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/category_controller.dart';
import 'package:crafty_bay/controllers/create_user_profile_controller.dart';
import 'package:crafty_bay/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/new_product_controller.dart';
import 'package:crafty_bay/controllers/popular_product_controller.dart';
import 'package:crafty_bay/controllers/product_controller.dart';
import 'package:crafty_bay/controllers/product_details_controller.dart';
import 'package:crafty_bay/controllers/read_user_profile_controller.dart';
import 'package:crafty_bay/controllers/send_email_otp_controller.dart';
import 'package:crafty_bay/controllers/special_product_controller.dart';
import 'package:crafty_bay/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/controllers/wishlist_controller.dart';
import 'package:get/get.dart';

class CraftyBayDependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => HomeCarouselController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => PopularProductController(), fenix: true);
    Get.lazyPut(() => SpecialProductController(), fenix: true);
    Get.lazyPut(() => NewProductController(), fenix: true);
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.lazyPut(() => WishlistController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SendEmailOTPController(), fenix: true);
    Get.lazyPut(() => VerifyOTPController(), fenix: true);
    Get.lazyPut(() => ReadUserProfileController(), fenix: true);
    Get.lazyPut(() => CreateUserProfileController(), fenix: true);
  }
}
