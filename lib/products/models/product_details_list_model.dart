import 'package:crafty_bay/products/models/product_details_model.dart';

class ProductDetailsListModel {
  List<ProductDetailsModel>? productDetailsList = [];
  List<String> carouselImages = [];

  ProductDetailsListModel({this.productDetailsList});

  ProductDetailsListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productDetailsList = <ProductDetailsModel>[];
      carouselImages = [];
      json['data'].forEach((v) {
        for (int i = 1; i <= 4; i++) {
          if (v.containsKey('img$i')) {
            carouselImages.add(v['img$i']);
          }
        }
        productDetailsList!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
}
