import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/products/models/product_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  ProductListModel? _categoryProductList = ProductListModel();

  bool _inProgress = false;

  ProductListModel? get categoryProductList => _categoryProductList;

  bool get inProgress => _inProgress;

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
