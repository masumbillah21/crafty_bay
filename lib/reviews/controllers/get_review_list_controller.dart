import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/reviews/models/review_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class GetReviewListController extends GetxController {
  ReviewListModel? _reviewList = ReviewListModel();

  bool _inProgress = false;

  ReviewListModel? get reviewList => _reviewList;
  bool get inProgress => _inProgress;

  Future<void> getReviewList(int productId) async {
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.listReviewByProduct(productId));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null) {
        _reviewList = ReviewListModel.fromJson(res.jsonResponse);
      }
    }
  }
}
