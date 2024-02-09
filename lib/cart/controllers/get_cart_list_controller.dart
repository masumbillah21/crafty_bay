import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/cart/models/cart_list_model.dart';
import 'package:crafty_bay/cart/models/cart_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class GetCartListController extends GetxController {
  CartListModel? _cartList = CartListModel();
  final Set<int> productIdList = {};
  bool _inProgress = false;

  CartListModel? get cartList => _cartList;
  bool get inProgress => _inProgress;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<void> getCartList() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
        url: Urls.cartList, token: AuthController.token.toString());
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _cartList = CartListModel.fromJson(res.jsonResponse);

        _totalPrice.value = _calculateTotalPrice;
      }
    }
  }

  void updateQuantity(int id, int quantity) async {
    CartModel? cartModel =
        _cartList?.cartList?.firstWhere((element) => element.id == id);
    cartModel!.qty = quantity;
    productIdList.add(cartModel.productId!);
    _totalPrice.value = _calculateTotalPrice;
  }

  double get _calculateTotalPrice {
    double total = 0;
    if (_cartList?.cartList?.isEmpty ?? true) {
      return total;
    }
    _cartList?.cartList?.forEach((item) {
      total += (double.tryParse(item.product?.price ?? '0') ?? 0) * item.qty!;
    });
    return total;
  }
}
