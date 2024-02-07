import 'package:crafty_bay/controllers/wishlist/wishlist_controller.dart';
import 'package:crafty_bay/controllers/wishlist/wishlist_store_controller.dart';
import 'package:crafty_bay/models/product/product_model.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:crafty_bay/views/screens/product/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGrid extends StatelessWidget {
  final ProductModel productModel;

  const ProductGrid({
    super.key,
    required this.productModel,
  });

  void _addToWishList() async {
    bool success =
        await Get.find<WishlistController>().createWishlist(productModel.id!);
    success ? successToast("Added to wishlist") : errorToast("Failed to add");
  }

  void _deleteFromWishlist(BuildContext context) {
    showPopup(
      context: context,
      onAgree: () {
        Get.back();
        Get.find<WishlistController>().deleteWishlist(productModel.id!);
      },
      onDisagree: () {
        Get.back();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailsScreen.routeName, arguments: productModel.id);
      },
      borderRadius: BorderRadius.circular(15),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                child: Image.network(
                  productModel.image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "\$${productModel.price}",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text("${productModel.star}"),
                        ],
                      ),
                      const SizedBox(width: 8),
                      GetBuilder<WishlistStoreController>(builder: (stored) {
                        final hasInWishList = stored.productListInWishlist
                            .contains(productModel.id);

                        print('in grid id: ${stored.productId}');

                        return Visibility(
                          visible: stored.productId != productModel.id,
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
                                color: hasInWishList
                                    ? Colors.red
                                    : AppColors.primaryColor,
                              ),
                              child: Icon(
                                hasInWishList
                                    ? Icons.delete
                                    : Icons.favorite_border_outlined,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
