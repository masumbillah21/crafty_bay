import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/product_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<ProductModel>? _remarkProductList = [];
  final Set<ProductModel> _productList = {};

  bool _inProgress = false;
  bool _loaded = false;

  List<ProductModel>? get remarkProductList => _remarkProductList;
  Set<ProductModel>? get productList => _productList;
  bool get inProgress => _inProgress;

  ProductModel getProductById(int productId) {
    return _productList.firstWhere((element) => element.id == productId);
  }

  Future<void> getProductByRemark(String remark) async {
    if (_loaded) {
      return;
    }
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productListByRemark(remark));
    _inProgress = false;
    _loaded = true;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<ProductModel>? remarkProducts = <ProductModel>[];

        res.jsonResponse['data'].forEach((v) {
          remarkProducts.add(ProductModel.fromJson(v));
          _productList.add(ProductModel.fromJson(v));
        });

        _remarkProductList = remarkProducts;
      }
    }
  }
}
