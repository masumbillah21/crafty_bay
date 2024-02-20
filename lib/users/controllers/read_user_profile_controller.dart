import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/users/models/customer_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ReadUserProfileController extends GetxController {
  bool _inProgress = false;
  bool _hasProfileData = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;
  bool get hasProfileData => _hasProfileData;

  Future<bool> readProfile() async {
    _inProgress = true;
    bool status = false;
    update();

    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.readProfile,
      token: AuthController.token.toString(),
    );

    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null ||
          res.jsonResponse['data'].isNotEmpty) {
        CustomerModel customerModel =
            CustomerModel.fromJson(res.jsonResponse['data']);
        await _authController.saveCustomerData(model: customerModel);
        _hasProfileData = true;
        status = true;
      }
    }
    _inProgress = false;
    update();
    return status;
  }
}
