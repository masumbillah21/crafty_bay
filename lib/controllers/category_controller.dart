import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/category_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  List<CategoryModel>? _categoryList = [];

  bool _inProgress = false;
  bool _loaded = false;

  List<CategoryModel>? get categoryList => _categoryList;
  bool get inProgress => _inProgress;

  Future<void> getCategoryList() async {
    if (_loaded) {
      return;
    }
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.categoryList);
    _inProgress = false;
    _loaded = true;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<CategoryModel>? catList = <CategoryModel>[];

        res.jsonResponse['data'].forEach((v) {
          catList.add(CategoryModel.fromJson(v));
        });

        _categoryList = catList;
      }
    }
  }
}
