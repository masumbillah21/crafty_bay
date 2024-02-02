import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/cart_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ReadCartListController extends GetxController {
  List<CartModel>? _cartList = [];

  bool _inProgress = false;

  List<CartModel>? get cartList => _cartList;
  bool get inProgress => _inProgress;

  Future<void> getCartList() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.cartList);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<CartModel>? catList = <CartModel>[];

        res.jsonResponse['data'].forEach((v) {
          catList.add(CartModel.fromJson(v));
        });

        _cartList = catList;
      }
    }
  }
}
