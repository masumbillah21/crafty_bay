import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistStoreController extends GetxController {
  static List<dynamic> _productListInWishlist = [];
  bool _inProgress = false;
  static final _storage = GetStorage();

  List<dynamic> get productListInWishlist => _productListInWishlist;
  bool get inProgress => _inProgress;

  Future<void> saveWishListProduct({required List<int> productIdList}) async {
    print("Before saving $inProgress}");
    await _storage.write("wishlist", productIdList);
    _productListInWishlist = _storage.read('wishlist') ?? [];
    _inProgress = false;
    print("After saving $inProgress}");
  }

  Future<void> initializeWishListProduct() async {
    _productListInWishlist = _storage.read('wishlist') ?? [];
  }

  static Future<void> clearWishListProduct() async {
    await _storage.erase();
    _productListInWishlist = [];
  }

  void toggleProgress() {
    _inProgress = !_inProgress;
    update();
  }
}
