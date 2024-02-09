import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
import 'package:crafty_bay/views/screens/authentication/verify_pin_code_screen.dart';
import 'package:crafty_bay/views/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/views/screens/brand/brand_product_list_screen.dart';
import 'package:crafty_bay/views/screens/brand/brands_screen.dart';
import 'package:crafty_bay/views/screens/cart/cart_list_screen.dart';
import 'package:crafty_bay/views/screens/category/categories_screen.dart';
import 'package:crafty_bay/views/screens/category/category_product_list_screen.dart';
import 'package:crafty_bay/views/screens/checkout/checkout_screen.dart';
import 'package:crafty_bay/views/screens/checkout/payment_web_view_screen.dart';
import 'package:crafty_bay/views/screens/contact/contact_screen.dart';
import 'package:crafty_bay/views/screens/customer_review/customer_review_screen.dart';
import 'package:crafty_bay/views/screens/customer_review/review_list_screen.dart';
import 'package:crafty_bay/views/screens/home/home_screen.dart';
import 'package:crafty_bay/views/screens/invoice/invoice_product_screen.dart';
import 'package:crafty_bay/views/screens/invoice/invoice_screen.dart';
import 'package:crafty_bay/views/screens/notification/notification_screen.dart';
import 'package:crafty_bay/views/screens/onboard/splash_screen.dart';
import 'package:crafty_bay/views/screens/product/product_details_screen.dart';
import 'package:crafty_bay/views/screens/profile/update_profile_screen.dart';
import 'package:crafty_bay/views/screens/wishlist/wish_list_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage<dynamic>> appRoutes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: BottomNavScreen.routeName,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: HomeScreen.routeName,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: NotificationScreen.routeName,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: ContactScreen.routeName,
      page: () => const ContactScreen(),
    ),
    GetPage(
      name: CategoriesScreen.routeName,
      page: () => const CategoriesScreen(),
    ),
    GetPage(
      name: CategoryProductListScreen.routeName,
      page: () => const CategoryProductListScreen(),
    ),
    GetPage(
      name: BrandsScreen.routeName,
      page: () => const BrandsScreen(),
    ),
    GetPage(
      name: BrandProductListScreen.routeName,
      page: () => const BrandProductListScreen(),
    ),
    GetPage(
      name: ProductDetailsScreen.routeName,
      page: () => const ProductDetailsScreen(),
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
    GetPage(
      name: ReviewListScreen.routeName,
      page: () => const ReviewListScreen(),
    ),
    GetPage(
      name: CheckoutScreen.routeName,
      page: () => const CheckoutScreen(),
    ),
    GetPage(
      name: PaymentWebViewScreen.routeName,
      page: () => const PaymentWebViewScreen(),
    ),
    GetPage(
      name: InvoiceScreen.routeName,
      page: () => const InvoiceScreen(),
    ),
    GetPage(
      name: InvoiceProductScreen.routeName,
      page: () => const InvoiceProductScreen(),
    ),
  ];
}
