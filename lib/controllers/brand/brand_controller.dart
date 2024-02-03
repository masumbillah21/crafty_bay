import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/brand/brand_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  List<BrandModel>? _brandList = [];

  bool _inProgress = false;

  List<BrandModel>? get brandList => _brandList;
  bool get inProgress => _inProgress;

  Future<void> getBrandList() async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(url: Urls.brandList);
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        List<BrandModel>? list = <BrandModel>[];

        res.jsonResponse['data'].forEach((v) {
          list.add(BrandModel.fromJson(v));
        });

        _brandList = list;
      }
    }
  }
}
