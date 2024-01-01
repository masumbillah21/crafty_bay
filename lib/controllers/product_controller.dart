import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/product_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<ProductModel>? _remarkProductList = [];

  bool _inProgress = false;

  List<ProductModel>? get remarkProductList => _remarkProductList;
  bool get inProgress => _inProgress;

  Future<void> getProductByRemark(String remark) async {
    _inProgress = true;
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productListByRemark(remark));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<ProductModel>? remarkProducts = <ProductModel>[];

        res.jsonResponse['data'].forEach((v) {
          remarkProducts.add(ProductModel.fromJson(v));
        });

        _remarkProductList = remarkProducts;
      }
    }
  }
}
