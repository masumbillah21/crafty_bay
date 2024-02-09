import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:crafty_bay/wishlist/controllers/get_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:get/get.dart';

class AddWishlistController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> createWishlist(int productId) async {
    bool status = true;
    _inProgress = true;
    Get.find<WishlistStoreController>().toggleProgress(productId);

    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.createWishList(productId),
      token: AuthController.token.toString(),
    );

    if (res.isSuccess) {
      await Get.find<GetWishlistController>().getWishlist();
    } else {
      status = false;
    }

    _inProgress = false;
    Get.find<WishlistStoreController>().toggleProgress(0);
    update();

    return status;
  }
}
