import 'package:crafty_bay/models/product_details_model.dart';

class ProductDetailsListModel {
  List<ProductDetailsModel>? productDetailsList = [];
  List<String> carouselImages = [];

  ProductDetailsListModel({this.productDetailsList});

  ProductDetailsListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productDetailsList = <ProductDetailsModel>[];
      json['data'].forEach((v) {
        for (int i = 1; i <= 4; i++) {
          if (v.containsKey('img1')) {
            carouselImages.add(v['img$i']);
          }
        }
        productDetailsList!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (productDetailsList != null) {
      data['data'] = productDetailsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
