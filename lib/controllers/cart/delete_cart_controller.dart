import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/controllers/cart/get_cart_list_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class DeleteCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<void> deleteCartList(int productId) async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
        url: Urls.deleteCartList(productId),
        token: AuthController.token.toString());
    _inProgress = false;
    //update();
    if (res.isSuccess) {
      await Get.find<GetCartListController>().getCartList();
    }
  }
}
