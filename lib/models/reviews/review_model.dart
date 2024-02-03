import 'dart:convert';

import 'package:crafty_bay/models/user/customer_model.dart';

class ReviewModel {
  int? id;
  String? description;
  String? rating;
  int? customerId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  CustomerModel? profile;

  ReviewModel(
      {this.id,
      this.description,
      this.rating,
      this.customerId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.profile});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    rating = json['rating'];
    customerId = json['customer_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile = json['profile'] != null
        ? CustomerModel.fromJson(json['profile'])
        : null;
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['rating'] = rating;
    data['product_id'] = productId;
    return jsonEncode(data);
  }
}
