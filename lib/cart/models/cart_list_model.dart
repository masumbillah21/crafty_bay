import 'dart:convert';

import 'package:crafty_bay/cart/models/cart_model.dart';

class CartListModel {
  List<CartModel>? cartList = [];

  CartListModel({this.cartList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cartList = <CartModel>[];
      json['data'].forEach((v) {
        cartList!.add(CartModel.fromJson(v));
      });
    }
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cartList != null) {
      data['data'] = cartList!.map((v) => v.toJson()).toList();
    }
    return jsonEncode(data);
  }
}
