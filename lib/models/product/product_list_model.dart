import 'package:crafty_bay/models/product/product_model.dart';

class ProductListModel {
  List<ProductModel>? productList = [];

  ProductListModel({this.productList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productList = <ProductModel>[];
      json['data'].forEach((v) {
        productList!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (productList != null) {
      data['data'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
