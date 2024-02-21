import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/products/models/product_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductBrandController extends GetxController {
  ProductListModel? _brandProductList = ProductListModel();

  bool _inProgress = false;

  ProductListModel? get brandProductList => _brandProductList;

  bool get inProgress => _inProgress;

  Future<void> getProductByBrandId(int brandId) async {
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productListByBrand(brandId));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _brandProductList = ProductListModel.fromJson(res.jsonResponse);
      }
    }
  }
}
