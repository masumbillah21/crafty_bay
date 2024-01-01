import 'dart:convert';

import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth_controller.dart';
import 'package:http/http.dart' as http;

class ApiCaller {
  final requestHeader = {
    "Content-Type": "application/json",
    'token': AuthController.token.toString(),
  };

  Future<ApiResponse> apiPostRequest({
    required String url,
    required String formValue,
    bool isLogin = false,
  }) async {
    try {
      var uri = Uri.parse(url);
      var response =
          await http.post(uri, headers: requestHeader, body: formValue);
      var resData = jsonDecode(response.body);

      if (response.statusCode == 200 && resData['msg'] == 'success') {
        return ApiResponse(
          isSuccess: true,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        if (!isLogin) {
          //backToLogin();
        }
        return ApiResponse(
          isSuccess: false,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse(
          isSuccess: false,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      }
    } catch (err) {
      return ApiResponse(isSuccess: false, errorMessage: err.toString());
    }
  }

  Future<ApiResponse> apiGetRequest({
    required String url,
  }) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(
        uri,
        headers: requestHeader,
      );
      var resData = jsonDecode(response.body);

      if (response.statusCode == 200 && resData['msg'] == 'success') {
        return ApiResponse(
          isSuccess: true,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      } else if (response.statusCode == 401) {
        //backToLogin();
        return ApiResponse(
          isSuccess: false,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse(
          isSuccess: false,
          jsonResponse: resData,
          statusCode: response.statusCode,
        );
      }
    } catch (err) {
      return ApiResponse(isSuccess: false, errorMessage: err.toString());
    }
  }

  // Future<void> backToLogin() async {
  //   await AuthController.clearAuthData();
  //   Navigator.pushNamedAndRemoveUntil(
  //       // TaskManagerApp.navigationKey.currentContext!,
  //       LoginScreen.routeName,
  //       (route) => false);
  // }
}
