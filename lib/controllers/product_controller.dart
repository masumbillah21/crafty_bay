import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/product_list_model.dart';
import 'package:crafty_bay/models/product_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ProductListModel? _categoryProductList = ProductListModel();

  final Set<ProductModel> _productList = {};

  bool _inProgress = false;

  ProductListModel? get categoryProductList => _categoryProductList;
  Set<ProductModel>? get productList => _productList;
  bool get inProgress => _inProgress;

  ProductModel getProductById(int productId) {
    return _productList.firstWhere((element) => element.id == productId);
  }

  Future<void> getProductByCategoryId(int categoryId) async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.productListByCategory(categoryId));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _categoryProductList = ProductListModel.fromJson(res.jsonResponse);
      }
    }
  }
}
