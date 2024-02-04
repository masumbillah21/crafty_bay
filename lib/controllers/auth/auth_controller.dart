import 'dart:convert';

import 'package:crafty_bay/controllers/user/read_user_profile_controller.dart';
import 'package:crafty_bay/models/user/customer_model.dart';
import 'package:crafty_bay/models/user/user_model.dart';
import 'package:crafty_bay/views/screens/authentication/verify_email_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static String? _token;
  static CustomerModel? _customer;
  static UserModel? _user;
  static final _storage = GetStorage();

  static String? get token => _token;
  CustomerModel? get customer => _customer;
  UserModel? get user => _user;

  Future<void> saveUserToken(String userToken) async {
    await _storage.write('token', userToken);
    _token = _storage.read('token');
    update();
  }

  Future<void> saveCustomerData({required CustomerModel model}) async {
    await _storage.write("customer", model.toJson());
    _customer =
        CustomerModel.fromJson(jsonDecode(_storage.read('customer') ?? '{}'));
    update();
  }

  Future<void> saveUserData({required UserModel model}) async {
    await _storage.write("user", model.toJson());
    _user = UserModel.fromJson(jsonDecode(_storage.read('user') ?? '{}'));
    update();
  }

  Future<void> initializeUserCache() async {
    _token = _storage.read('token');
    _customer =
        CustomerModel.fromJson(jsonDecode(_storage.read('customer') ?? '{}'));
  }

  Future<bool> checkAuthState() async {
    String? token = _storage.read('token');
    if (token != null) {
      await initializeUserCache();
      return true;
    } else {
      return false;
    }
  }

  static Future<void> clearAuthData() async {
    await _storage.erase();
    _token = null;
    _customer = null;
  }

  void checkLogin() async {
    bool isLogin = false;
    isLogin = await checkAuthState();
    if (!isLogin) {
      Get.offNamed(VerifyEmailScreen.routeName);
    } else {
      await Get.find<ReadUserProfileController>().readProfile();
    }
  }
}
