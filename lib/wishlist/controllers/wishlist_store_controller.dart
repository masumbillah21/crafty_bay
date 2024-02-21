import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WishlistStoreController extends GetxController {
  static List<dynamic> _productListInWishlist = [];

  static final _storage = GetStorage();
  int _productId = 0;

  List<dynamic> get productListInWishlist => _productListInWishlist;

  int get productId => _productId;

  Future<void> saveWishListProduct({required List<int> productIdList}) async {
    await _storage.write("wishlist", productIdList);
    _productListInWishlist = _storage.read('wishlist') ?? [];
    update();
  }

  Future<void> initializeWishListProduct() async {
    _productListInWishlist = _storage.read('wishlist') ?? [];
    update();
  }

  static Future<void> clearWishListProduct() async {
    await _storage.erase();
    _productListInWishlist = [];
  }

  void toggleProgress(int id) {
    _productId = id;
    update();
  }
}
