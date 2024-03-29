import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/auth/controllers/send_email_otp_controller.dart';
import 'package:crafty_bay/auth/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/brands/controllers/brand_controller.dart';
import 'package:crafty_bay/cart/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/cart/controllers/delete_cart_controller.dart';
import 'package:crafty_bay/cart/controllers/get_cart_list_controller.dart';
import 'package:crafty_bay/cart/controllers/update_cart_controller.dart';
import 'package:crafty_bay/categories/controllers/category_controller.dart';
import 'package:crafty_bay/checkout/controllers/create_invoice_controller.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/home/controllers/home_carousel_controller.dart';
import 'package:crafty_bay/invoices/controllers/invoice_controller.dart';
import 'package:crafty_bay/invoices/controllers/invoice_details_controller.dart';
import 'package:crafty_bay/products/controllers/new_product_controller.dart';
import 'package:crafty_bay/products/controllers/popular_product_controller.dart';
import 'package:crafty_bay/products/controllers/product_brand_controller.dart';
import 'package:crafty_bay/products/controllers/product_category_controller.dart';
import 'package:crafty_bay/products/controllers/product_details_controller.dart';
import 'package:crafty_bay/products/controllers/special_product_controller.dart';
import 'package:crafty_bay/reviews/controllers/create_review_controller.dart';
import 'package:crafty_bay/reviews/controllers/get_review_list_controller.dart';
import 'package:crafty_bay/users/controllers/create_user_profile_controller.dart';
import 'package:crafty_bay/users/controllers/read_user_profile_controller.dart';
import 'package:crafty_bay/wishlist/controllers/add_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/delete_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/get_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:get/get.dart';

class CraftyBayDependency extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(HomeCarouselController());
    Get.put(BrandController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.lazyPut(() => ProductCategoryController(), fenix: true);
    Get.lazyPut(() => ProductBrandController(), fenix: true);
    Get.put(ProductDetailsController());
    Get.put(GetWishlistController());
    Get.lazyPut(() => AddWishlistController(), fenix: true);
    Get.lazyPut(() => DeleteWishlistController(), fenix: true);
    Get.put(WishlistStoreController());
    Get.put(AuthController());
    Get.lazyPut(() => SendEmailOTPController(), fenix: true);
    Get.lazyPut(() => VerifyOTPController(), fenix: true);
    Get.put(ReadUserProfileController());
    Get.put(CreateUserProfileController());
    Get.put(AddToCartController());
    Get.put(GetCartListController());
    Get.lazyPut(() => DeleteCartController(), fenix: true);
    Get.put(UpdateCartController());
    Get.lazyPut(() => GetReviewListController(), fenix: true);
    Get.lazyPut(() => CreateReviewController(), fenix: true);
    Get.lazyPut(() => CreateInvoiceController(), fenix: true);
    Get.lazyPut(() => InvoiceController(), fenix: true);
    Get.lazyPut(() => InvoiceDetailsController(), fenix: true);
  }
}
