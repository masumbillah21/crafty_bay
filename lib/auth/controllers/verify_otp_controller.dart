import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/users/controllers/read_user_profile_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:crafty_bay/wishlist/controllers/get_wishlist_controller.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> verifyOTP(String pin) async {
    _inProgress = true;
    bool status = false;
    update();

    String? email = _authController.user?.email ?? '';

    ApiResponse res = await ApiCaller().apiGetRequest(
        url: Urls.verifyLogin(email: email, otp: pin), isLogin: true);

    if (res.isSuccess) {
      await _authController.saveUserToken(res.jsonResponse['data']);
      await Get.find<ReadUserProfileController>().readProfile();
      await Get.find<GetWishlistController>().getWishlist();

      status = true;
    }
    _inProgress = false;
    update();
    return status;
  }
}
