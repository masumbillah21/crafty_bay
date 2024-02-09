import 'dart:convert';

import 'package:crafty_bay/users/models/user_model.dart';

class CustomerModel {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  CustomerModel(
      {this.id,
      this.cusName,
      this.cusAdd,
      this.cusCity,
      this.cusState,
      this.cusPostcode,
      this.cusCountry = 'Bangladesh',
      this.cusPhone,
      this.cusFax,
      this.shipName,
      this.shipAdd,
      this.shipCity,
      this.shipState,
      this.shipPostcode,
      this.shipCountry = 'Bangladesh',
      this.shipPhone,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'];
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'];
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cus_name'] = cusName;
    data['cus_add'] = cusAdd;
    data['cus_city'] = cusCity;
    data['cus_state'] = cusCity;
    data['cus_postcode'] = cusPostcode;
    data['cus_country'] = cusCountry;
    data['cus_phone'] = cusPhone;
    data['cus_fax'] = cusPhone;
    data['ship_name'] = shipName;
    data['ship_add'] = shipAdd;
    data['ship_city'] = shipCity;
    data['ship_state'] = shipCity;
    data['ship_postcode'] = shipPostcode;
    data['ship_country'] = shipCountry;
    data['ship_phone'] = shipPhone;
    return jsonEncode(data);
  }
}
