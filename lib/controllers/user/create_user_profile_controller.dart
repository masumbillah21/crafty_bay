import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/models/user/customer_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class CreateUserProfileController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> createProfile(CustomerModel formValue) async {
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller().apiPostRequest(
      url: Urls.createProfile,
      formValue: formValue.toJson(),
      token: AuthController.token.toString(),
    );

    _inProgress = false;
    update();
    if (res.isSuccess) {
      await _authController.saveCustomerData(model: formValue);
      return true;
    } else {
      return false;
    }
  }
}
