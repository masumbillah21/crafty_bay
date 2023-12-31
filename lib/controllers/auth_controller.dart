import 'dart:convert';

import 'package:crafty_bay/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static String? _token;
  static UserModel? _user;
  static final _storage = GetStorage();

  static String? get token => _token;
  UserModel? get user => _user;

  Future<void> saveUserInfo(
      {required String userToken, required UserModel model}) async {
    //_filterProfilePhoto(model);
    await _storage.write('token', userToken);
    await _storage.write("user", model.toJson());
    _token = userToken;
    _user = UserModel.fromJson(jsonDecode(_storage.read('user') ?? '{}'));
    update();
  }

  Future<void> saveUserToReset({required UserModel model}) async {
    //_filterProfilePhoto(model);
    await _storage.write("user", model.toJson());
    _user = UserModel.fromJson(jsonDecode(_storage.read('user') ?? '{}'));
    update();
  }

  Future<void> initializeUserCache() async {
    _token = _storage.read('token');
    _user = UserModel.fromJson(jsonDecode(_storage.read('user') ?? '{}'));
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
    _user = null;
  }

  // static UserModel _filterProfilePhoto(UserModel model) {
  //   if (model.photo != null && model.photo!.startsWith('data:image')) {
  //     model.photo =
  //         model.photo!.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
  //   }
  //   return model;
  // }
}
