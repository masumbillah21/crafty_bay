import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:crafty_bay/models/user_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  bool _inProgress = false;

  final AuthController _authController = Get.find<AuthController>();

  bool get inProgress => _inProgress;

  Future<bool> verifyUserEmail(String email) async {
    _inProgress = true;
    update();

    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.loginUrl(email));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      _authController.saveUserToReset(
        model: UserModel.fromJson({'email': email}),
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> verifyPicCode(String pin) async {
    _inProgress = true;
    update();

    String? email = AuthController().user?.email ?? '';

    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.verifyLogin(email: email, otp: pin));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      _authController.saveUserInfo(
          model: UserModel.fromJson({'email': email}),
          userToken: res.jsonResponse['data']);
      return true;
    } else {
      return false;
    }
  }

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
      _authController.saveUserToReset(model: formValue);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> readProfile() async {
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.readProfile);

    _inProgress = false;
    update();

    if (res.isSuccess) {
      //_authController.saveUserToReset(model: formValue);
      return true;
    } else {
      return false;
    }
  }
}
