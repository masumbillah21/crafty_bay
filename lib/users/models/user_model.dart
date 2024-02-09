import 'dart:convert';

class UserModel {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  UserModel({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    email = json['email'] ?? '';
    otp = json['otp'] ?? '';
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['otp'] = otp;
    return jsonEncode(data);
  }
}
