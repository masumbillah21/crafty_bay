import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> verifyOTP(String pin) async {
    _inProgress = true;
    update();

    String? email = _authController.user?.email ?? '';

    ApiResponse res = await ApiCaller().apiGetRequest(
        url: Urls.verifyLogin(email: email, otp: pin), isLogin: true);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      await _authController.saveUserToken(res.jsonResponse['data']);
      return true;
    } else {
      return false;
    }
  }
}
