import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/wishlist_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  List<WishlistModel>? _wishlist = [];

  bool _inProgress = false;

  bool _loaded = false;

  List<WishlistModel>? get wishlist => _wishlist;
  bool get inProgress => _inProgress;

  Future<void> createWishlist(int productId) async {
    _inProgress = true;
    _loaded = false;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.createWishList(productId));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<WishlistModel>? list = <WishlistModel>[];

        res.jsonResponse['data'].forEach((v) {
          list.add(WishlistModel.fromJson(v));
        });

        _wishlist = list;
      }
    }
  }

  Future<void> getWishlist() async {
    if (_loaded) {
      return;
    }
    _inProgress = true;
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productWishList);
    _inProgress = false;
    _loaded = true;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<WishlistModel>? list = <WishlistModel>[];

        res.jsonResponse['data'].forEach((v) {
          list.add(WishlistModel.fromJson(v));
        });

        _wishlist = list;
      }
    }
  }
}
