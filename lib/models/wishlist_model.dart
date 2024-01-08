class WishlistModel {
  int? id;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;

  WishlistModel({
    this.id,
    this.email,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  WishlistModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
