import 'package:crafty_bay/controllers/cart/add_to_cart_controller.dart';
import 'package:crafty_bay/controllers/cart/get_cart_list_controller.dart';
import 'package:crafty_bay/models/cart/cart_model.dart';
import 'package:get/get.dart';

class UpdateCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> updateCartList() async {
    bool status = false;
    _inProgress = true;
    update();

    GetCartListController getCartListController =
        Get.find<GetCartListController>();
    Set<int> productIds = getCartListController.productIdList;

    Get.find<GetCartListController>().cartList?.cartList?.forEach((item) async {
      if (productIds.contains(item.productId)) {
        CartModel formValue = item;
        bool res = await Get.find<AddToCartController>().addToCart(formValue);
        if (res) {
          status = true;
        }
      }
    });
    await Future.delayed(const Duration(seconds: 1));
    _inProgress = false;
    update();
    //await getCartListController.getCartList();
    getCartListController.productIdList.clear();

    return status;
  }
}