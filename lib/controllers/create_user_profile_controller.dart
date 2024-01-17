import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/models/user_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class CreateUserProfileController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> createProfile(
      {required String firstName,
      required String lastName,
      required String mobile,
      required String city,
      required String shippingAddress}) async {
    _inProgress = true;
    update();

    UserModel formValue = UserModel(
      firstName: firstName,
      lastName: lastName,
      mobile: mobile,
      city: city,
      shippingAddress: shippingAddress,
    );
    ApiResponse res = await ApiCaller()
        .apiPostRequest(url: Urls.createProfile, formValue: formValue.toJson());

    _inProgress = false;
    update();
    if (res.isSuccess) {
      await _authController.saveUserData(model: formValue);
      return true;
    } else {
      return false;
    }
  }
}
