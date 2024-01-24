import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/product_details_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  ProductDetailsListModel? _productDetailsList = ProductDetailsListModel();
  ProductDetailsListModel? get productDetailsList => _productDetailsList;

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  Future<void> getProductDetailsById(int productId) async {
    _inProgress = true;
    update();
    ApiResponse res =
        await ApiCaller().apiGetRequest(url: Urls.productDetailById(productId));
    _inProgress = false;

    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _productDetailsList =
            ProductDetailsListModel.fromJson(res.jsonResponse);
      }
    }
  }

  void getCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }
}
