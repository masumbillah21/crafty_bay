import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/cart/models/cart_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> addToCart(CartModel formValue) async {
    bool status = false;
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller().apiPostRequest(
      url: Urls.createCartList,
      formValue: formValue.toJson(),
      token: AuthController.token.toString(),
    );
    if (res.isSuccess) {
      status = true;
    }
    _inProgress = false;
    update();
    return status;
  }
}
