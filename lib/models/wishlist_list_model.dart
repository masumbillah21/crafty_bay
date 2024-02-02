import 'package:crafty_bay/models/wishlist_model.dart';

class WishlistListModel {
  List<WishlistModel>? wishList;

  WishlistListModel({this.wishList});

  WishlistListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      wishList = <WishlistModel>[];
      json['data'].forEach((v) {
        wishList!.add(WishlistModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (wishList != null) {
      data['data'] = wishList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
