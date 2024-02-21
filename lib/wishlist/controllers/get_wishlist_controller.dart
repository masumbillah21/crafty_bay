import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:crafty_bay/wishlist/models/wishlist_list_model.dart';
import 'package:get/get.dart';

class GetWishlistController extends GetxController {
  WishlistListModel? _wishlist = WishlistListModel();

  bool _inProgress = false;

  WishlistListModel? get wishlist => _wishlist;
  bool get inProgress => _inProgress;

  Future<void> getWishlist() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.productWishList,
      token: AuthController.token.toString(),
    );
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _wishlist = WishlistListModel.fromJson(res.jsonResponse);
        await wishListProductIds();
      }
    }
    _inProgress = false;
    update();
  }

  Future<void> wishListProductIds() async {
    List<int> list = [];
    _wishlist?.wishList?.forEach((element) {
      list.add(element.productId!);
    });
    await Get.find<WishlistStoreController>()
        .saveWishListProduct(productIdList: list);
  }
}
