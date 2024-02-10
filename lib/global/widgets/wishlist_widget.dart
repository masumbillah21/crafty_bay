import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/wishlist/controllers/add_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/delete_wishlist_controller.dart';
import 'package:crafty_bay/wishlist/controllers/wishlist_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({
    super.key,
    required this.productId,
    this.iconSize = 12,
  });

  final int productId;
  final double iconSize;

  void _addToWishList() async {
    bool success =
        await Get.find<AddWishlistController>().createWishlist(productId);
    success ? successToast("Added to wishlist") : errorToast("Failed to add");
  }

  void _deleteFromWishlist(BuildContext context) {
    showPopup(
      context: context,
      titleColor: Colors.red,
      contentColor: Colors.red,
      firstButtonAction: () async {
        Get.back();
        bool success = await Get.find<DeleteWishlistController>()
            .deleteWishlist(productId);
        success
            ? successToast("Delete from wishlist.")
            : errorToast("Failed to remove.");
      },
      secondButtonAction: () {
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistStoreController>(builder: (stored) {
      final hasInWishList = stored.productListInWishlist.contains(productId);

      return Visibility(
        visible: stored.productId != productId,
        replacement: const SizedBox(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
        child: GestureDetector(
          onTap: () async {
            if (hasInWishList) {
              _deleteFromWishlist(context);
            } else {
              _addToWishList();
            }
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: hasInWishList ? Colors.red : AppColors.primaryColor,
            ),
            child: Icon(
              hasInWishList ? Icons.delete : Icons.favorite_border_outlined,
              size: iconSize,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
