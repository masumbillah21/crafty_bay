import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/users/models/user_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class SendEmailOTPController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> sendEmailOTP(String email) async {
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.loginUrl(email), isLogin: true);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      await _authController.saveUserData(
        model: UserModel.fromJson({'email': email}),
      );
      return true;
    } else {
      return false;
    }
  }
}
