import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/product_list_model.dart';
import 'package:crafty_bay/utilities/remark_enum.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  ProductListModel? _remarkProductList = ProductListModel();
  bool _inProgress = false;

  ProductListModel? get remarkProductList => _remarkProductList;
  bool get inProgress => _inProgress;

  Future<void> getProductByRemark() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.productListByRemark(RemarkEnum.Popular.name));
    _inProgress = false;

    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _remarkProductList = ProductListModel.fromJson(res.jsonResponse);
      }
    }
  }
}
