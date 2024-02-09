import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/reviews/models/review_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> createReview(ReviewModel reviewModel) async {
    bool status = false;
    _inProgress = true;
    update();

    ApiResponse res = await ApiCaller().apiPostRequest(
      url: Urls.createProductReview,
      formValue: reviewModel.toJson(),
      token: AuthController.token.toString(),
    );
    _inProgress = false;
    update();

    if (res.isSuccess) {
      status = true;
    }
    return status;
  }
}
