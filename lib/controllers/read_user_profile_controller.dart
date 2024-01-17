import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/models/user_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ReadUserProfileController extends GetxController {
  bool _inProgress = false;
  bool _hasProfileData = true;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;
  bool get hasProfileData => _hasProfileData;

  Future<bool> readProfile() async {
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.readProfile);

    _inProgress = false;
    update();

    if (res.isSuccess) {
      if (res.jsonResponse['data'] == null) {
        _hasProfileData = false;
      } else {
        UserModel userModel = UserModel.fromJson(res.jsonResponse['data'][0]);
        await _authController.saveUserData(model: userModel);
      }

      return true;
    } else {
      return false;
    }
  }
}
