import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/wishlist/wishlist_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  WishlistListModel? _wishlist = WishlistListModel();

  bool _inProgress = false;

  WishlistListModel? get wishlist => _wishlist;
  bool get inProgress => _inProgress;

  Future<bool> createWishlist(int productId) async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.createWishList(productId));
    _inProgress = false;
    update();
    if (!res.isSuccess) {
      status = false;
    }

    return status;
  }

  Future<void> getWishlist() async {
    _inProgress = true;
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productWishList);
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _wishlist = WishlistListModel.fromJson(res.jsonResponse);
      }
    }
    _inProgress = false;
    update();
  }

  Future<bool> deleteWishlist(int productId) async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.deleteWishList(productId));
    _inProgress = false;
    update();
    if (!res.isSuccess) {
      status = false;
    } else {
      await getWishlist();
    }

    return status;
  }
}
