import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/controllers/auth/send_email_otp_controller.dart';
import 'package:crafty_bay/controllers/auth/verify_otp_controller.dart';
import 'package:crafty_bay/controllers/brand/brand_controller.dart';
import 'package:crafty_bay/controllers/cart/add_to_cart_controller.dart';
import 'package:crafty_bay/controllers/cart/get_cart_list_controller.dart';
import 'package:crafty_bay/controllers/category/category_controller.dart';
import 'package:crafty_bay/controllers/checkout/create_invoice_controller.dart';
import 'package:crafty_bay/controllers/home/bottom_nav_controller.dart';
import 'package:crafty_bay/controllers/home/home_carousel_controller.dart';
import 'package:crafty_bay/controllers/product/new_product_controller.dart';
import 'package:crafty_bay/controllers/product/popular_product_controller.dart';
import 'package:crafty_bay/controllers/product/product_controller.dart';
import 'package:crafty_bay/controllers/product/product_details_controller.dart';
import 'package:crafty_bay/controllers/product/special_product_controller.dart';
import 'package:crafty_bay/controllers/reviews/create_review_controller.dart';
import 'package:crafty_bay/controllers/reviews/get_review_list_controller.dart';
import 'package:crafty_bay/controllers/user/create_user_profile_controller.dart';
import 'package:crafty_bay/controllers/user/read_user_profile_controller.dart';
import 'package:crafty_bay/controllers/wishlist/wishlist_controller.dart';
import 'package:get/get.dart';

class CraftyBayDependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController(), fenix: true);
    Get.lazyPut(() => HomeCarouselController(), fenix: true);
    Get.lazyPut(() => BrandController(), fenix: true);
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
    Get.lazyPut(() => AddToCartController(), fenix: true);
    Get.lazyPut(() => GetCartListController(), fenix: true);
    Get.lazyPut(() => GetReviewListController(), fenix: true);
    Get.lazyPut(() => CreateReviewController(), fenix: true);
    Get.lazyPut(() => CreateInvoiceController(), fenix: true);
  }
}
