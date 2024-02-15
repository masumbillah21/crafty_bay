import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/cart/controllers/get_cart_list_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class DeleteCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> deleteCartList(int productId) async {
    bool status = false;
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
        url: Urls.deleteCartList(productId),
        token: AuthController.token.toString());
    _inProgress = false;

    if (res.isSuccess) {
      status = true;
      await Get.find<GetCartListController>().getCartList();
    }
    update();
    return status;
  }
}
