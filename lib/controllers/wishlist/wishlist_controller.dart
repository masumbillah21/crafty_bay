import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/controllers/wishlist/wishlist_store_controller.dart';
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
    Get.find<WishlistStoreController>().toggleProgress(productId);
    print('trying to update');
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.createWishList(productId),
      token: AuthController.token.toString(),
    );

    if (res.isSuccess) {
      await getWishlist();
    } else {
      status = false;
    }

    _inProgress = false;
    Get.find<WishlistStoreController>().toggleProgress(0);
    update();

    return status;
  }

  Future<void> getWishlist() async {
    _inProgress = true;
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.productWishList,
      token: AuthController.token.toString(),
    );
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _wishlist = WishlistListModel.fromJson(res.jsonResponse);
        wishListProductIds();
      }
    }
    _inProgress = false;
    update();
  }

  Future<bool> deleteWishlist(int productId) async {
    bool status = true;
    _inProgress = true;

    Get.find<WishlistStoreController>().toggleProgress(productId);
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.deleteWishList(productId),
      token: AuthController.token.toString(),
    );

    if (res.isSuccess) {
      await getWishlist();
    } else {
      status = false;
    }
    _inProgress = false;
    Get.find<WishlistStoreController>().toggleProgress(0);

    update();
    return status;
  }

  void wishListProductIds() {
    List<int> list = [];
    _wishlist?.wishList?.forEach((element) {
      list.add(element.productId!);
    });
    Get.find<WishlistStoreController>()
        .saveWishListProduct(productIdList: list);
    //return list;
  }
}
