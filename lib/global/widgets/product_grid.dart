import 'package:crafty_bay/global/widgets/product_star_widget.dart';
import 'package:crafty_bay/global/widgets/wishlist_widget.dart';
import 'package:crafty_bay/products/models/product_model.dart';
import 'package:crafty_bay/products/screens/product_details_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductGrid extends StatelessWidget {
  final ProductModel productModel;

  const ProductGrid({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailsScreen.routeName,
            arguments: {'id': productModel.id});
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
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, __) =>
                      SvgPicture.asset(AssetsPath.logo),
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
                        "৳${productModel.price}",
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 6),
                      ProductStarWidget(productStar: productModel.star ?? 0),
                      const SizedBox(width: 8),
                      WishlistWidget(productId: productModel.id ?? 0)
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
