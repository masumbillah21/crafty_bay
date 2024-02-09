import 'package:crafty_bay/categories/screens/category_product_list_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  final int id;
  final String categoryName;
  final String categoryImg;
  const CategoryGrid({
    super.key,
    required this.id,
    required this.categoryName,
    required this.categoryImg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(CategoryProductListScreen.routeName,
            arguments: {'id': id, 'name': categoryName});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              categoryImg,
              fit: BoxFit.cover,
              errorBuilder: (context, _, __) =>
                  SvgPicture.asset(AssetsPath.logo),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categoryName,
            style: const TextStyle(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
