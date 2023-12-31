import 'dart:convert';

class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? otp;

  UserModel(
      {this.email,
      this.firstName,
      this.lastName,
      this.mobile,
      this.city,
      this.shippingAddress,
      this.otp});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    firstName = json['firstName'] ?? '';
    lastName = json['lastName'] ?? '';
    mobile = json['mobile'] ?? '';
    city = json['city'] ?? '';
    shippingAddress = json['shippingAddress'] ?? '';
    otp = json['OTP'] ?? '';
  }

  String toJson() {
    final Map<String, dynamic> userData = <String, dynamic>{};
    userData['email'] = email;
    if (firstName != null) {
      userData['firstName'] = firstName;
    }
    if (lastName != null) {
      userData['lastName'] = lastName;
    }
    if (mobile != null) {
      userData['mobile'] = mobile;
    }
    if (city != null) {
      userData['city'] = city;
    }
    if (shippingAddress != null) {
      userData['shippingAddress'] = shippingAddress;
    }
    if (otp != null && otp!.isNotEmpty) {
      userData['OTP'] = otp;
    }
    return jsonEncode(userData);
  }
}
