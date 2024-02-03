import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/cart/cart_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> addToCart(CartModel formValue) async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiPostRequest(
        url: Urls.createCartList, formValue: formValue.toJson());
    _inProgress = false;
    update();
    if (!res.isSuccess) {
      status = false;
    }
    return status;
  }
}
