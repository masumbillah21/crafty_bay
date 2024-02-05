import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/cart/cart_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class GetCartListController extends GetxController {
  CartListModel? _cartList = CartListModel();

  bool _inProgress = false;

  CartListModel? get cartList => _cartList;
  bool get inProgress => _inProgress;

  final RxDouble _totalPrice = 0.0.obs;

  RxDouble get totalPrice => _totalPrice;

  Future<void> getCartList() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.cartList);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _cartList = CartListModel.fromJson(res.jsonResponse);

        _totalPrice.value = _calculateTotalPrice;
      }
    }
  }

  Future<void> deleteCartList(int productId) async {
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.deleteCartList(productId));
    _inProgress = false;
    //update();
    if (res.isSuccess) {
      await getCartList();
    }
  }

  void updateQuantity(int id, int quantity) {
    _cartList?.cartList?.firstWhere((element) => element.id == id).qty =
        quantity;
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
