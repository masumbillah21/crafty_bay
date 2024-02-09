import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/products/models/product_details_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final RxString _selectedColor = ''.obs;
  final RxString _selectedSize = ''.obs;
  final RxInt _productQuantity = 1.obs;

  ProductDetailsListModel? _productDetailsList = ProductDetailsListModel();

  ProductDetailsListModel? get productDetails => _productDetailsList;

  bool _inProgress = false;
  bool get inProgress => _inProgress;

  RxString get selectedColor => _selectedColor;
  RxString get selectedSize => _selectedSize;
  RxInt get productQuantity => _productQuantity;

  Future<void> getProductDetailsById(int productId) async {
    _selectedColor.value = '';
    _selectedSize.value = '';
    _productQuantity.value = 1;
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

  void selectColor(String color) {
    _selectedColor.value = color;
  }

  void selectSize(String size) {
    _selectedSize.value = size;
  }

  void increaseQyt() {
    _productQuantity.value += 1;
  }

  void decreaseQyt() {
    if (_productQuantity > 1) {
      _productQuantity.value -= 1;
    }
  }
}
