import 'package:crafty_bay/reviews/models/review_model.dart';

class ReviewListModel {
  List<ReviewModel>? reviewList;

  ReviewListModel({this.reviewList});

  ReviewListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      reviewList = <ReviewModel>[];
      json['data'].forEach((v) {
        reviewList!.add(ReviewModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reviewList != null) {
      data['data'] = reviewList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
